import 'package:netlyfe/models/cart_model.dart';

class Users {
  String? userId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? age;
  String? avatar;
  List<CartModel>? cartlist;

  Users(
      {this.userId,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.age,
      this.avatar,
      this.cartlist});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['age'] = age;
    data['avatar'] = avatar;
    data['cartlist'] = cartlist;

    return data;
  }

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    age = json['age'];
    avatar = json['avatar'];
    if (json['cartlist'] != null) {
      cartlist = <CartModel>[];
      (json['cartlist'] as List).forEach((element) {
        cartlist!.add(CartModel.fromJson(element));
      });
    }
  }
}
