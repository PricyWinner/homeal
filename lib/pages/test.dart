part of 'pages.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  List<ItemClass> listItemDB = listResep;
  List<ItemClass> listItemDB2 = [];
  // for (var item in lisItemDB) {
    
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
      title: Text(listItemDB[0].category),
    )));
  }
}
