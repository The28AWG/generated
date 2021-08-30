import 'package:dark_novels_io/io.dart';

class PurchaseService {
  final DarkIO io;

  PurchaseService(
    this.io,
  );

  Future<Response> createInAppPurchase(Map<String, dynamic> model) =>
      (io.newRequest('/v2/purchase/')
            ..post()
            ..model = model)
          .execute();
}
