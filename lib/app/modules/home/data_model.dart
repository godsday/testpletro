
List<Data> datasFromJson(List list){
 return list.map((e) => Data.fromJson(e)).toList();
}
class Data {
  String? image;
  String? name;
  int? price;
  String? discription;
  int?count;

  Data({this.image, this.name, this.price, this.discription,this.count});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
    discription = json['Discription'];
    count = json['count']??0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['Discription'] = discription;
    return data;
  }
}
