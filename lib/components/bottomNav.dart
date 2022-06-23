part of 'components.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = selectedIndex;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
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
      if (_selectedIndex == 0) {
        selectedIndex = 0;
        // print(listResep.elementAt(0).category);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));

        // Navigator.pushReplacementNamed(context, '/');
      } else if (_selectedIndex == 1) {
        selectedIndex = 1;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cartpage()));
        // Navigator.pushReplacementNamed(context, '/cart');
      } else if (_selectedIndex == 2) {
        selectedIndex = 2;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HistoryPage()));
      } else if (_selectedIndex == 3) {
        selectedIndex = 3;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
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
          icon: Icon(Icons.shop),
          label: 'Cart',
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
