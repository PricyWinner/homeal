part of 'components.dart';

// List<String> item = ["Rawon", "gulai", "nasi goreng", "mie goreng"];

//

// ignore: must_be_immutable
class RecomendedCarousel extends StatelessWidget {
  // List<ItemClass> resepDB = listResep;
  // List<ItemClass> listResepDB = listResep;
  RecomendedCarousel({Key? key}) : super(key: key);
  List<Widget> cards = new List.generate(
      listResep.length,
      (index) => new CustomCard(
            index: index,
          ));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final index;
  CustomCard({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: [
            Image.network(
              listResep.elementAt(index).imageURL,
              fit: BoxFit.cover,
              width: 170,
            ),
            Text(
              listResep.elementAt(index).title,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        onTap: () {
          // print(resepDB);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResepPage(),
            ),
          );
        },
      ),
    );
  }
}
