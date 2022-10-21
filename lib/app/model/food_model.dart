class Fooditem{

String? image;
String? name;
String? amount;
String? discription;
Fooditem({ this.amount,this.discription,this.image,this.name});


 Fooditem.fromJson(Map<String, dynamic> json) {
    discription = json['Discription'];
    name = json['name'];
    amount = json['price'];
    image = json['image'];
}




}