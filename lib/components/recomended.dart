part of 'components.dart';
List<String> item = ["Rawon", "gulai", "nasi goreng", "mie goreng"];
class RecomendedCarousel extends StatelessWidget {
  RecomendedCarousel({Key? key}) : super(key: key);

  List<Widget> cards = new List.generate(
      item.length,
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
              "https://i.imgur.com/7zkwrpk.jpg",
              fit: BoxFit.cover,
              width: 170,
            ),
            Text(
              item[index],
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        onTap: () {
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
