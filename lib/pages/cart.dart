part of 'pages.dart';

class Cartpage extends StatefulWidget {
  Cartpage({Key? key}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int totalPrice = 0;

  List<CartClass> cartTemp = [];

  void getCart() {
    for (int i = 0; i < cartDB.length; i++) {
      if (cartDB.elementAt(i).done == false) {
        cartTemp.add(cartDB.elementAt(i));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    print("inCart");
  }

  Widget generateList() {
    getCart();
    if (cartTemp.isEmpty) {
      totalPrice = 0;
      // return Text("Cart is empty");
      return Image.network(
        'https://i.imgur.com/7YSaYoJ.jpg',
      );
    } else {
      // getCart();
      totalPrice = getTotalPrice();
      return ListView.builder(
          itemCount: cartTemp.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: Image.network(
                    cartTemp.elementAt(index).store.imageURL,
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 1.0),
                        child: Text(
                          cartTemp.elementAt(index).store.storeName,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        "Rp." + cartTemp.elementAt(index).totalPrice.toString(),
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  subtitle: Text(cartTemp.elementAt(index).quantity.toString() +
                      ' ' +
                      'Items'),
                ),
              ),
            );
          });
    }
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (int i = 0; i < cartTemp.length; i++) {
      totalPrice = totalPrice + cartTemp.elementAt(i).totalPrice;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
          ),
          bottomNavigationBar: BottomNavBar(),
          body: Column(
            children: [
              Expanded(child: generateList()),
              Container(
                height: 106,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Total price:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(' Rp.' + totalPrice.toString(),
                              style: TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: ButtonTheme(
                        minWidth: 200.0,
                        height: 100.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () => {
                                  if (cartTemp.isNotEmpty)
                                    {
                                      HistoryDB.add(HistoryClass(
                                          cartTemp, new DateTime.now())),
                                      // selectedIndex = 0,
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PaymentPage(
                                                    TotalPrice:
                                                        getTotalPrice())),
                                      ),
                                    }
                                  else
                                    {}
                                },
                            child: Text(
                                '                            Shop now                            ')),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
