part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Column(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Popular",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RecomendedCarousel(),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Text("fernch"),
            Text("fernch"),
            Text("fernch"),
            Text("fernch"),
          ],
        ),
      ),
    ));
  }
}
