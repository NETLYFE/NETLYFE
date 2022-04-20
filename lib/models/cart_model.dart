class CartModel {
  String? id;
  String? cartName;
  String? cartPrice;
  String? cartImageUrl;
  String? cartKey;
  String? cartMfr;
  String? counter;

  CartModel(
      {this.id,
      this.cartName,
      this.cartPrice,
      this.cartImageUrl,
      this.cartKey,
      this.cartMfr,
      this.counter});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cartName'] = cartName;
    data['cartPrice'] = cartPrice;
    data['cartImageUrl'] = cartImageUrl;
    data['cartKey'] = cartKey;
    data['cartMfr'] = cartMfr;
    data['counter'] = counter;
    return data;
  }

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartName = json['cartName'];
    cartPrice = json['cartPrice'];
    cartImageUrl = json['cartImageUrl'];
    cartKey = json['cartKey'];
    cartMfr = json['cartMfr'];
    counter = json['counter'];
  }
}
