class Drugs{
   String? duId;
   String? imgUrl;
   String? name;
   String? price;
   String? description;
   String? category;
   String? discount;
   String? manufacturedBy;
   String?drugKey;

  Drugs({
   this.duId,
   this.imgUrl,
   this.name,
    this.price,
    this.category,
    this.description,
    this.discount,
   this.manufacturedBy,
    this.drugKey
  });

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic>{};
    data['duid'] = duId;
    data['img_url'] = imgUrl;
    data['name'] = name;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['discount'] =  discount;
    data['manufactured_by'] = manufacturedBy;
    data['drug_key'] = drugKey;

    return data;
  }

  Drugs.fromJson(Map<String, dynamic> json){
    duId = json['duid'];
    imgUrl = json['img_url'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    discount = json['discount'];
    manufacturedBy = json['manufactured_by'];
    drugKey = json['drug_key'];

  }

}