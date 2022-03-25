class CartItems {
  String? itemName;
  String? itemPrice;
  String? itemImageUrl;
  String? itemKey;
  String? itemMfr;
  String? itemCounter;
  String? userId;

  CartItems(
      {this.itemName,
      this.itemPrice,
      this.itemImageUrl,
      this.itemKey,
      this.itemMfr,
      this.itemCounter,
      this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemName'] = itemName;
    data['itemPrice'] = itemPrice;
    data['itemImageUrl'] = itemImageUrl;
    data['itemKey'] = itemKey;
    data['itemMfr'] = itemMfr;
    data['itemCounter'] = itemCounter;
    data['userId'] = userId;
    return data;
  }

  CartItems.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    itemPrice = json['itemPrice'];
    itemImageUrl = json['itemImageUrl'];
    itemKey = json['itemKey'];
    itemMfr = json['itemMfr'];
    itemCounter = json['itemCounter'];
    userId = json['userId'];
  }
}
