part of 'pages.dart';

class ChooseStorePage extends StatefulWidget {
  final List<BahanClass> bahan;
  ChooseStorePage({Key? key, required this.bahan}) : super(key: key);

  @override
  _ChooseStorePageState createState() => _ChooseStorePageState();
}

class _ChooseStorePageState extends State<ChooseStorePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Choose Store'),
        ),
        // body: GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(
        //     target: _center,
        //     zoom: 11.0,
        //   ),
        // ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  leading: Icon(Icons.location_pin),
                  title: Text('Your Location'),
                  subtitle: Text('Jl. Kebon Jeruk III, Jakarta Barat'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Container(
                height: 100,
                child: Card(
                  elevation: 6,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    leading: Image.network(
                      'https://i.imgur.com/NbEFirn.png',
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                    title: Text('Hypermart Gajah Mada Plaza'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopIngredients(
                            bahan: widget.bahan,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: Image.network(
                    'https://i.imgur.com/m9sIFDt.png',
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  title: Text('Hero - Mall Taman Anggrek '),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: Image.network(
                    'https://i.imgur.com/MGNvpDh.jpg',
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  title: Text('Ranch Market Hublife'),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: Image.network(
                    'https://i.imgur.com/DRlX6TE.png',
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  title: Text('The Food Hall - Neo Soho'),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                elevation: 6,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  leading: Image.network(
                    'https://i.imgur.com/zuEVVZA.jpg',
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  title: Text('Farmers Market Wang Plaza'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
