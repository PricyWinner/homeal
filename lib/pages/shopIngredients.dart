part of 'pages.dart';

class ShopIngredients extends StatefulWidget {
  final List<BahanClass> bahan;
  ShopIngredients({Key? key, required this.bahan}) : super(key: key);

  @override
  State<ShopIngredients> createState() => _ShopIngredientsState();
}

class _ShopIngredientsState extends State<ShopIngredients> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('shopIngredients'),
          ),
          body: Column(
            children: [
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
                              width: 50,
                            ),
                            title: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 4.0, 0, 1.0),
                                  child: Text(
                                    widget.bahan.elementAt(index).name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text("Rp." +
                                    widget.bahan
                                        .elementAt(index)
                                        .price
                                        .toString())
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            subtitle:
                                Text(widget.bahan.elementAt(index).weight),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => VoucherDetailPage(
                              //         selectedVoucher: selectedGameVoucher(widget.gameid)
                              //             .elementAt(index)),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
