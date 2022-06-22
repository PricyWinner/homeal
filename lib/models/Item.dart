part of 'models.dart';

class ItemClass {
  String id;
  String imageURL;
  String title;
  String category;
  var steps;
  List<BahanAmountClass> ingredients;
  ItemClass(this.id, this.imageURL, this.title, this.category, this.steps,
      this.ingredients);
}

class BahanClass {
  String id;
  String imageURL;
  String name;
  int price;
  String weight;
  BahanClass(this.id, this.name, this.price, this.weight, this.imageURL);
}

class BahanAmountClass {
  String bahanID;
  String amount;
  BahanAmountClass(this.bahanID, this.amount);
}

// List<ItemClass> listItems = [];
// List<BahanClass> listBahan() {
//   return gameDB;
// }