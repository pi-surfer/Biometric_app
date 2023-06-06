import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:app_project/models/projects.dart';
import 'package:flutter/services.dart';

class ProjectProvider with ChangeNotifier {
  ProjectProvider() {
    loadProjects().then((projects) {
      _projects = projects;
      notifyListeners();
    });
  }

  List<Projects> _projects = [];

  List<Projects> get projects => _projects;

  Future loadProjects() async {
    final data = await rootBundle.loadString('assets/projects.json');
    final projectsJson = json.decode(data);

    return projectsJson.keys.map<Projects>((code) {
      final json = projectsJson[code];
      final newJson = json..addAll({'code': code.toLowerCase()});

      return Projects.fromJson(newJson);
    }).toList();
      
  }
}