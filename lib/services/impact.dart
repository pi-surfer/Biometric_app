import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
//import 'package:intl/intl.dart';
//import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:app_project/services/server_strings.dart';
import 'package:app_project/utils/shared_preferences.dart';
import 'package:app_project/database/entities/entities.dart';

class ImpactService {
  Preferences prefs;
  Map<String, String>? headersBearer;
  //= {HttpHeaders.authorizationHeader: 'Bearer $token'};

  ImpactService(this.prefs) {
    updateBearer();
    // This helper method is defined below
  }

  String? retrieveSavedToken(bool refresh) {
    if (refresh) {
      return prefs.impactRefreshToken;
    } else {
      return prefs.impactAccessToken;
    }
  }
  // if refresh function was called we need the RefreshToken,
  // if not we can use the AccessToken

  bool checkSavedToken({bool refresh = false}) {
    // By deafault refresh = false

    String? token = retrieveSavedToken(refresh);
    if (token == null) {
      return false;
      // no token
    }
    try {
      return ImpactService.checkToken(token);
      // checking token validity
    } catch (_) {
      return false;
    }
  }

  static bool checkToken(String token) {
    // this method is static because we to make it available
    // also outside this class

    if (JwtDecoder.isExpired(token)) {
      return false;
    }
    // Check if the token is expired using JwtDecoder library
    // It is a small library for decoding a json web token

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // Decode a string JWT token into a Map<String, dynamic> containing
    // the decoded JSON payload.

    // After this we need to check the iss claim.

    // In the JSON Web Token (JWT) standard, the "iss" (issuer) claim is a string
    // that identifies the principal that issued the JWT. This can be a human user,
    // an organization, or a service. The "iss" claim is used to prevent JWT token
    // abuse, and to provide some basic information about the context in which the
    // JWT was issued.

    if (decodedToken['iss'] == null) {
      return false;
    } else {
      if (decodedToken['iss'] != ServerStrings.issClaim) {
        return false;
        // if the issuer is not the expected one
      } //else
    } //if-else

    // Check that the user is a patient/researcher or whatever
    // stated into server_strings.dart
    if (decodedToken['role'] == null) {
      return false;
    } else {
      if (decodedToken['role'] != ServerStrings.researcherRoleIdentifier) {
        return false;
      } //else
    } //if-else

    return true;
    // if none of the previous undesired conditions occurs the token is valid
  } //checkToken

  // This method makes the call to get the tokens
  Future<bool> getTokens(String username, String password) async {
    try {
      // We use a try loop to handle exceptions

      const url = ServerStrings.backendBaseUrl + ServerStrings.tokenEndpoint;
      final body = {'username': username, 'password': password};

      //Get the response
      final response = await http.post(Uri.parse(url), body: body);
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        prefs.impactRefreshToken = decodedResponse['refresh'];
        prefs.impactAccessToken = decodedResponse['access'];
        // get and save refresh and access tokens

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }

  Future<bool> refreshTokens() async {
    String? refToken = await retrieveSavedToken(true);
    // now we are trying to refresh a token so we pass refresh = true
    // to [retrieveSavedToken()]

    try {
      final url = ServerStrings.backendBaseUrl + ServerStrings.refreshEndpoint;
      final body = {'refresh': refToken};

      //Get the response
      final response = await http.post(Uri.parse(url), body: body);
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        prefs.impactRefreshToken = decodedResponse['refresh'];
        prefs.impactAccessToken = decodedResponse['access'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('$e');
      return false;
    }
  }

  // helper method used in the first lines of this class
  Future<void> updateBearer() async {
    if (!await checkSavedToken()) {
      await refreshTokens();
      // if the access token is no more valid we have to perform a refresh to
      // obtain new tokens by using the method defined above
    }
    String? token = await prefs.impactAccessToken;
    if (token != null) {
      headersBearer = {HttpHeaders.authorizationHeader: 'Bearer $token'};
      //_dio.options.headers = {'Authorization': 'Bearer $token'};
      // We are changing the headers cause we want to ask for authorization.
      // Bearer authentication (also called token authentication) is an HTTP
      // authentication scheme that involves security tokens called bearer tokens.
    }
  }

  // Method to retrieve a patient:

  Future<void> getPatient() async {
    await updateBearer();
    final r = await http.get(
        Uri.parse('${ServerStrings.backendBaseUrl}study/v1/patients/active'),
        headers: headersBearer);
    //Response r = await _dio.get('study/v1/patients/active');
    final decodedR = jsonDecode(r.body);
    prefs.impactUsername = decodedR['data'][0]['username'];
    return decodedR['data'][0]['username'];
  }

  // Method to retrieve HR, Steps, Kalories data of a single day:

  Future<List<Steps>> getStepFromDay(DateTime day) async {
    await updateBearer();
    List<Steps> result;
    String formattedDate = DateFormat("yyyy-MM-dd").format(day);
    debugPrint('day = $formattedDate');
    final url = '${ServerStrings.backendBaseUrl}${ServerStrings.stepsEndpoint}${ServerStrings.patientUsername}/day/$formattedDate/';
    var access = retrieveSavedToken(false);
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      result = [];
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        print('decoded response ' + decodedResponse['data']['data'][i]['value'].toString());
        result.add(Steps(int.parse(decodedResponse['data']['data'][i] ['value']),
          (decodedResponse['data']['date'])));
      } //for
    } //if
    else {
      //debugPrint('ln 203 ${response.statusCode} ${response.reasonPhrase}');
      //debugPrint('body = ${response.body} \n headers = ${response.headers}');
      result = [Steps(0, formattedDate)];
    }
    //debugPrint('Steps = $result');
    return result;
  }

  Future<List<HR>> getHRFromDay(DateTime day) async {
    await updateBearer();
    List<HR> result;
    String formattedDate = DateFormat("yyyy-MM-dd").format(day);

    final url = ServerStrings.backendBaseUrl +
        ServerStrings.hrEndpoint +
        ServerStrings.patientUsername +
        '/day/$formattedDate/';
    //debugPrint('$url');
    var access = retrieveSavedToken(false);
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      result = [];
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        result.add(HR(decodedResponse['data']['data'][i] ['value'],
          (decodedResponse['data']['date'])));
      } //for
    } //if
    else {
      result = [HR(0, formattedDate)];
    }

    //debugPrint('HR = $result');
    return result;
  }

  Future<List<Cal>> getCalFromDay(DateTime day) async {
    await updateBearer();
    List<Cal> result;
    String formattedDate = DateFormat("yyyy-MM-dd").format(day);

    final url = ServerStrings.backendBaseUrl +
        ServerStrings.kaloriesEndpoint +
        ServerStrings.patientUsername +
        '/day/$formattedDate/';
    var access = retrieveSavedToken(false);
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      result = [];
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        result.add(Cal(double.parse(decodedResponse['data']['data'][i] ['value']),
          decodedResponse['data']['date']));
      } //for
    } //if
    else {
      result = [Cal(0, formattedDate)];
    }

    //debugPrint('Kalories = $result');
    return result;
  }

  DateTime _truncateSeconds(DateTime input) {
    return DateTime(
        input.year, input.month, input.day, input.hour, input.minute);
  }
}
