import 'car_finder.dart';

abstract class CarFinderRepository {
  Future<List<CarFinder>> fetchCarFinders(int limit, int offset);
  Future<void> update(CarFinder carFinder);
}
