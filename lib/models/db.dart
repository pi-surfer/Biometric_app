import 'dart:math';

// We create a different class for each type of data and
// each one is characterized by the properties of interest

class HR {
  // this class models the single heart rate data point
  final DateTime timestamp;
  final int value;

  HR({required this.timestamp, required this.value});
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
}

class Steps {
  final DateTime timestamp;
  final int value;

  Steps({required this.timestamp, required this.value});

}