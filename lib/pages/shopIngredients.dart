part of 'pages.dart';

class ShopIngredients extends StatefulWidget {
  final List<BahanClass> bahan;
  final StoreClass currentStore;
  ShopIngredients({Key? key, required this.bahan, required this.currentStore})
      : super(key: key);

  @override
  State<ShopIngredients> createState() => _ShopIngredientsState();
}

class _ShopIngredientsState extends State<ShopIngredients> {
  int getTotalPrice() {
    int total = 0;
    for (int i = 0; i < widget.bahan.length; i++) {
      total = total + widget.bahan.elementAt(i).price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.currentStore.storeName),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
                height: 50,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Shop Ingredients',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.bahan.length,
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
                              widget.bahan.elementAt(index).imageURL,
                              fit: BoxFit.cover,
                              width: 70,
                            ),
                            title: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 4.0, 0, 1.0),
                                  child: Text(
                                    widget.bahan
                                        .elementAt(index)
                                        .name
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Text(
                                  "Rp." +
                                      widget.bahan
                                          .elementAt(index)
                                          .price
                                          .toString(),
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            subtitle:
                                Text(widget.bahan.elementAt(index).weight),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
                  height: 140,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
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
                              child: Text(' Rp.' + getTotalPrice().toString(),
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
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
                                      if (cartDB.isEmpty)
                                        {
                                          cartDB.add(CartClass(
                                              0,
                                              widget.currentStore,
                                              getTotalPrice(),
                                              widget.bahan.length,
                                              false)),
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HomePage()),
                                              ModalRoute.withName('/')),
                                          print(cartDB.toList().toString())
                                        }
                                      else
                                        {
                                          cartDB.add(CartClass(
                                              cartDB.length,
                                              widget.currentStore,
                                              getTotalPrice(),
                                              widget.bahan.length,
                                              false)),
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          HomePage()),
                                              ModalRoute.withName('/')),
                                          print(cartDB)
                                        }
                                    },
                                child: Text('Add to Cart')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                                onPressed: () => {},
                                child: Text(' Shop now ')),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
