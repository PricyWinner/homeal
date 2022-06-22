part of 'pages.dart';

class ChooseStorePage extends StatefulWidget {
  const ChooseStorePage({Key? key}) : super(key: key);

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
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
