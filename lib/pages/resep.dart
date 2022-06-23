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
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
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
                  title: Text(selectedResep.title),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            selectedResep.imageURL,
                            fit: BoxFit.fill,
                            width: 350,
                            height: 200,
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
                                itemCount: getBahan().length,
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseStorePage(
                                          bahan: getBahan(),
                                        )),
                              ),
                            },
                            child: Text("Shop Ingredients"),
                          ),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              selectedResep.imageURL,
                              fit: BoxFit.cover,
                              width: 250,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  // for (var step in selectedResep.steps) Text(step)
                                  // new List.generate(selectedResep.steps.length, (index) => Text(index.to+ ' ' + selectedResep.steps.elementAt(index)))
                                  for (var i = 0;
                                      i < selectedResep.steps.length;
                                      i++)
                                    Text(
                                      (i + 1).toString() +
                                          '. ' +
                                          selectedResep.steps.elementAt(i) +
                                          '\n',
                                    )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
