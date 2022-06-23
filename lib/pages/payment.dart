part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final int TotalPrice;
  PaymentPage({Key? key, required this.TotalPrice}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            for (int i = 0; i < cartDB.length; i++)
              {
                cartDB.elementAt(i).done = true,
              },
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Cartpage()),
            ),
          },
        ),
        title: Text('Payment'),
      ),
      body: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://i.imgur.com/ygltvSI.png',
                fit: BoxFit.cover,
                width: 250,
              ),
            ),
            Text(
              "Payment successful!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text('You have completed your payment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total Payment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Rp ' + widget.TotalPrice.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
