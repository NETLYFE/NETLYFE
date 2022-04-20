import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/models/cart_model.dart';
import 'package:netlyfe/services/firebase_service.dart';

abstract class CartFunctions {
  Future<bool> addDrugsToCart({CartModel? cartmodel});
}

class CartController implements CartFunctions {
  var log = Logger();
  // var counter = 1;
  @override
  Future<bool> addDrugsToCart({CartModel? cartmodel}) async {
    try {
      final cartDoc = cartCollection.doc();
      cartmodel!.cartKey = cartDoc.id;
      await cartDoc.set(cartmodel.toJson());
      return true;
    } catch (e) {
      log.d(e);
      return false;
    }
  }
}
