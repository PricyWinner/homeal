part of 'pages.dart';

class ResepPage extends StatelessWidget {
  final ItemClass selectedResep;

  ResepPage({Key? key, required this.selectedResep}) : super(key: key);

  List<BahanClass> getBahan() {
    List<BahanClass> bahan = [];
    List<BahanClass> bahandb = listBahan;
    for (int i = 0; i < selectedResep.ingredients.length; i++) {
      for (int ii = 0; ii < bahandb.length; ii++) {
        if (bahandb.elementAt(ii).id ==
            selectedResep.ingredients.elementAt(i).bahanID) {
          bahan.add(bahandb.elementAt(ii));
          // amount.add(selectedResep.ingredients.elementAt(i).amount);
        }
      }
    }
    return bahan;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        text: "ingredients",
                      ),
                      Tab(
                        text: 'Steps',
                      ),
                    ],
                  ),
                  title: const Text('Voucher'),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            selectedResep.imageURL,
                            fit: BoxFit.cover,
                            width: 350,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(selectedResep.title,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text("50.000",
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: selectedResep.ingredients.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      height: 50,
                                      // color: Colors.amber[colorCodes[index]],
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            getBahan().elementAt(index).weight +
                                                " " +
                                                getBahan()
                                                    .elementAt(index)
                                                    .name,
                                            textAlign: TextAlign.left),
                                      ));
                                }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseStorePage(bahan: getBahan(),)),
                              ),
                            },
                            child: Text("Shop Ingredients"),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          selectedResep.imageURL,
                          fit: BoxFit.cover,
                          width: 350,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 35.0, top: 20.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              selectedResep.steps.toString(),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))));
  }
}
