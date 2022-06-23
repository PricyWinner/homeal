part of 'services.dart';

List<BahanClass> listBahan = [];
List<BahanAmountClass> listBahanAmount = [];
List<ItemClass> listResep = [];
List<String> idBahan = [
  '9t6vG9vZNwlxbfa9OCzG',
  'Ng4RYOUk3Xg3iUtXNFyd',
  'MkMmfe5dyxpbOGmvVBxy',
  'm0MJv9sUyuSTrL8q4YMo',
  'jEmzPJfl45VJ96q9Lllr',
  'KO1ylfzV0aipikNkEr5q',
  'EBaJUokPulUSK3lwKB2L',
  'PRqG7bQPAhGlWtuBaBGE',
  'U30v11PJjRa44xD0Z3H4',
  'hTcueW6qRfr36Dg5vaio',
  'iJM8ZyjOgN7DeJvDYrvn',
  'jEmzPJfl45VJ96q9Lllr',
  'kNUaJDqT32eDUwk8Jjno',
  'kfPlyeeUtw0Un4Cj2ML7',
  'l2bvKNMU7KYxAUmhMxgy',
  'm0MJv9sUyuSTrL8q4YMo',
  'ouKuoCdJWGmHdQY67nyv',
  'tMswcpEuExWg9JKzlnoN'
];
List<String> idResep = [
  'r6JD11SC9fMg78nD6JGy',
  'TPyrSGx9CzCysbBWhZNX',
  'RKHY78FD65hYdGKDzjUc',
  '6wyfS3nfGH0WNn8YbABZ'
];
var bahan_id;

Future<void> firebaseinit() async {
  listBahan.clear();
  listBahanAmount.clear();
  listResep.clear();
  FirebaseApp defaultApp = await Firebase.initializeApp();
  var collection = FirebaseFirestore.instance.collection('bahan');
  for (int i = 0; i < idBahan.length; i++) {
    var docSnapshot = await collection.doc(idBahan[i]).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      bahan_id = idBahan[i].toString();
      var bahan_name = data['name'].toString();
      int bahan_price = data['price'];
      var bahan_weight = data['weight'].toString();
      var bahan_imageURL = data['imageURL'].toString();
      listBahan.add(BahanClass(bahan_id.toString(), bahan_name, bahan_price,
          bahan_weight, bahan_imageURL));
    }
  }

  var resepCollection = FirebaseFirestore.instance.collection('masakan');
  for (int i = 0; i < idResep.length; i++) {
    var docSnapshot = await resepCollection.doc(idResep[i]).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;

      // You can then retrieve the value from the Map like this:
      var id = idResep[i].toString();
      var imageURL = data['imageURL'].toString();
      var category = data['category'].toString();
      var title = data['title'].toString();
      var stepsraw = data['steps'] as List<dynamic>;
      var ingredients = data['ingredients'];

      for (int ii = 0; ii < ingredients.length; ii++) {
        listBahanAmount.add(BahanAmountClass(
            ingredients[ii]['bahanID'].toString(),
            ingredients[ii]['amount'].toString()));
      }

      List<String> steps = stepsraw.cast<String>();
      listResep.add(
          ItemClass(id, imageURL, title, category, steps, listBahanAmount));
    }
    print("init");
    print(resepDB().toString());
  }
}

List<ItemClass> resepDB() {
  return listResep;
}
