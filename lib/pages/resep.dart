part of 'pages.dart';

class ResepPage extends StatelessWidget {
  const ResepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                  tabs: [Tab(text: "Ingredients"), Tab(text: "Recipes")]),
              title: Text('Resep'),
            ),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "https://i.imgur.com/7zkwrpk.jpg",
                        fit: BoxFit.cover,
                        width: 350,
                      ),
                    ),
                  ],
                ),
                Text(
                    'Rebus daging dan dengkul sapi hingga setengah lunak. Potong daging sesuai selera. Sisihkan'),
              ],
            ),
          )),
    );
  }
}
