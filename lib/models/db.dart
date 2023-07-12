import 'dart:math';

// We create a different class for each type of data and
// each one is characterized by the properties of interest

class HR {
  // this class models the single heart rate data point
  final DateTime timestamp;
  final int value;

  HR({required this.timestamp, required this.value});
}


class Steps {
  final DateTime timestamp;
  final int value;

  Steps({required this.timestamp, required this.value});

}

class Kalories {
  final DateTime timestamp;
  final int value;

  Kalories({required this.timestamp, required this.value});

}

class Times {
  final DateTime timestamp;
  final double value;

  Times({required this.timestamp, required this.value});

}

class FitbitGen {
  final Random _random = Random();

  List<HR> fetchHR() {
    return List.generate(
        100,
        (index) => HR(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextInt(180)));
  }

  List<Kalories> fetchKalories() {
    return List.generate(
        100,
        (index) => Kalories(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextInt(4000)));
  }

  List<Steps> fetchSteps() {
    return List.generate(
        100,
        (index) => Steps(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextInt(50000)));
  }

  List<Times> fetchTimes() {
    return List.generate(
        100,
        (index) => Times(
            timestamp: DateTime.now().subtract(Duration(hours: index)),
            value: _random.nextDouble()));
  }
}