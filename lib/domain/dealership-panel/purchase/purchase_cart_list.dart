import 'package:abs_customer_sites/presentation/dealership_panel/purchase_page/widget/purchase_cart.dart';

class PurchaseCartList {
  List<PurchaseCart> lsit = [
    PurchaseCart(
      serviceStatus: 'paid',
      servicesCount: 3,
      date: '2020/9/5',
      total: 3400,
    ),
    PurchaseCart(
      serviceStatus: 'unpaid',
      servicesCount: 1,
      date: '2020/4/2',
      total: 800,
    ),
    PurchaseCart(
      serviceStatus: 'paid',
      servicesCount: 3,
      date: '2020/9/5',
      total: 3400,
    ),
    PurchaseCart(
      serviceStatus: 'unpaid',
      servicesCount: 1,
      date: '2020/4/2',
      total: 800,
    ),
  ];
}
