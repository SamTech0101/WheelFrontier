import 'value_trade.dart';

abstract class ValueTradeRepository {
  Future<List<ValueTrade>> fetchValueTrades(int limit, int offset);
  Future<void> update(ValueTrade valueTrade);
}
