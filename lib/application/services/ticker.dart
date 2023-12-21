// simple class for yielding a new state evety seconds with new updated elaspedTime

class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => 1 + x + ticks);
  }
}
