part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// void print(String string) {
//   print(listResep[0].category.toString());
// }

class _HomePageState extends State<HomePage> {
  // List<ItemClass> listResep = resepDB();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Indonesia",
              ),
              Tab(
                text: 'French',
              ),
              Tab(
                text: 'Intalian',
              ),
              Tab(
                text: 'Indian',
              ),
              Tab(
                text: 'Amcerican',
              ),
            ],
            isScrollable: true,
          ),
          title: const Text('Homeal'),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recommended",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RecomendedCarousel(),
                  ),
                  
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Popular Nowadays",
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: RecomendedCarousel(),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Order Again",
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: RecomendedCarousel(),
                  // ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Text("gferencgh"),
            Text("fernch"),
            Text("fernch"),
            Text("fernch"),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    ));
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Store',
      style: optionStyle,
    ),
    Text(
      'Index 2: History',
      style: optionStyle,
    ),
    Text(
      'Index 2: profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        print(listResep.elementAt(0).category);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ChooseStorePage(),
        //   ),
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: 'Store',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'rofile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
