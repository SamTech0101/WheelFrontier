import 'order_part.dart';

abstract class OrderPartRepository {
  Future<List<OrderPart>> fetchOrderParts(int limit, int offset);
  Future<void> update(OrderPart orderPart);
}
