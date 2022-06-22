part of 'models.dart';

class StoreClass {
  int id;
  String storeName;
  String imageURL;
  StoreClass(this.id, this.storeName, this.imageURL);
}

class CartClass {
  int id;
  int totalPrice;
  int quantity;
  StoreClass store;
  bool done;
  CartClass(this.id, this.store, this.totalPrice, this.quantity, this.done);
}

class HistoryClass {
  List<CartClass> carts;
  DateTime date;
  HistoryClass(this.carts, this.date);
}

List<HistoryClass> HistoryDB = [];
List<StoreClass> storeDB = [];
List<CartClass> cartDB = [];
List<CartClass> HistorycartDB = [];

void generateStore() {
  storeDB.add(StoreClass(
      0, 'Hypermart Gajah Mada Plaza', 'https://i.imgur.com/NbEFirn.png'));
  storeDB.add(StoreClass(
      1, 'Hero - Mall Taman Anggrek', 'https://i.imgur.com/m9sIFDt.png'));
  storeDB.add(
      StoreClass(2, 'Ranch Market Hublife', 'https://i.imgur.com/MGNvpDh.jpg'));
  storeDB.add(StoreClass(
      3, 'The Food Hall - Neo Soho', 'https://i.imgur.com/DRlX6TE.png'));
  storeDB.add(StoreClass(
      4, 'Farmers Market Wang Plaza', 'https://i.imgur.com/zuEVVZA.jpg'));
}
