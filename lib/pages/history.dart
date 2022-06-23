part of 'pages.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int getTotalPrice(int index) {
    int totalPrice = 0;
    for (int i = 0; i < HistoryDB.elementAt(index).carts.length; i++) {
      totalPrice =
          totalPrice + HistoryDB.elementAt(index).carts.elementAt(i).totalPrice;
    }
    return totalPrice;
  }

  Widget generateList() {
    if (HistoryDB.isEmpty) {
      // return Text("History Is Empty");
      return Image.network(
        'https://i.imgur.com/S8RaCOf.png',
      );
    } else {
      return ListView.builder(
          itemCount: HistoryDB.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 1.0),
                        child: Text(
                          HistoryDB.elementAt(index).date.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        "TOTAL PRICE : Rp." + getTotalPrice(index).toString(),
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  trailing: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                      onPressed: () => {
                            for (int i = 0;
                                i < HistoryDB.elementAt(index).carts.length;
                                i++)
                              {
                                HistoryDB.elementAt(index)
                                    .carts
                                    .elementAt(i)
                                    .done = false,
                              },
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Cartpage()))
                            // Fluttertoast.showToast(
                            //     msg: "Cart Added",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.red,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0)
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Cart Added"),
                            ))
                          },
                      child: Text('Order Again')),
                ),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("History"),
          ),
          bottomNavigationBar: BottomNavBar(),
          body: Column(
            children: [
              Expanded(child: generateList()),
            ],
          )),
    );
  }
}
