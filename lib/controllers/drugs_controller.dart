import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/models/cart_model.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/firebase_service.dart';

abstract class DrugsFunctions {
  Stream<List<Drugs>> getDrugsByCategory(String selectedCategory);
  Future<bool> updateCartItems({String? counter, String? price});
}

class DrugsController implements DrugsFunctions {
  var log = Logger();
  @override
  Stream<List<Drugs>> getDrugsByCategory(String selectedCategory) {
    final querySnapshot = drugsCollection
        .where('category', isEqualTo: selectedCategory)
        .snapshots();
    return querySnapshot.map((snapshots) =>
        snapshots.docs.map((doc) => Drugs.fromJson(doc.data())).toList());
  }

  // @override
  // Future<bool> addDrugToCart(
  //     {String? cartItemName,
  //     String? cartItemPrice,
  //     String? cartItemImageUrl,
  //     String? cartItemMfr,
  //     String? cartItemCounter,
  //     String? cartItemKey}) async {
  //   try {
  //     final cartDocument = cartCollection.doc(cartItemKey);
  //     final cartItems = CartItems(
  //       itemName: cartItemName,
  //       itemPrice: cartItemPrice,
  //       itemImageUrl: cartItemImageUrl,
  //       itemMfr: cartItemMfr,
  //       itemCounter: cartItemCounter,
  //       itemKey: cartItemKey,
  //       userId: mAuth.currentUser!.uid,
  //     );
  //     await cartDocument.set(cartItems.toJson());
  //     return true;
  //   } catch (e) {
  //     log.d(e);
  //     return false;
  //   }
  // }

  @override
  Future<bool> updateCartItems(
      {String? counter, String? price, String? itemKey}) async {
    try {
      final updateDoc = cartCollection.doc(itemKey);
      await updateDoc.set({"itemCounter": counter, "itemPrice": price},
          SetOptions(merge: true));
      return true;
    } catch (e) {
      log.d(e);
      return false;
    }
  }
}
