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