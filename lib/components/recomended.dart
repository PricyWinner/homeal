part of 'components.dart';

// List<String> item = ["Rawon", "gulai", "nasi goreng", "mie goreng"];

//

// ignore: must_be_immutable
// class RecomendedCarousel extends StatelessWidget {
//   RecomendedCarousel({Key? key}) : super(key: key);
//   List<Widget> cards = new List.generate(
//       listResep.length,
//       (index) => new CustomCard(
//             index: index,
//           ));
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 170.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: cards,
//       ),
//     );
//   }
// }

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
          print(listResep.elementAt(0).ingredients.length);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResepPage(
                selectedResep: listResep[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecomendedCarousel extends StatefulWidget {
  RecomendedCarousel({Key? key}) : super(key: key);

  @override
  State<RecomendedCarousel> createState() => _RecomendedCarouselState();
}

class _RecomendedCarouselState extends State<RecomendedCarousel> {
  List<Widget> cards = [];
  Widget getCarouselWidget() {
    if (cards.length > 0) {
      return Container(
        height: 170.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cards,
        ),
      );
    } else {
      return Text('loading');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        cards = new List.generate(
            listResep.length,
            (index) => new CustomCard(
                  index: index,
                ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return getCarouselWidget();
  }
}

// class CustomCard extends StatefulWidget {
//   final index;
//   CustomCard({Key? key, required this.index}) : super(key: key);

//   @override
//   State<CustomCard> createState() => _CustomCardState();
// }

// class _CustomCardState extends State<CustomCard> {
//   ItemClass? item = null;
//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget getCardWidget() {
//     if (item != null) {
//       return Card(
//         child: InkWell(
//           child: Column(
//             children: [
//               Image.network(
//                 listResep.elementAt(widget.index).imageURL,
//                 fit: BoxFit.cover,
//                 width: 170,
//               ),
//               Text(
//                 listResep.elementAt(widget.index).title,
//                 style: TextStyle(fontSize: 18),
//               )
//             ],
//           ),
//           onTap: () {
//             print(listResep.elementAt(0).ingredients.length);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ResepPage(
//                   selectedResep: listResep[widget.index],
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     } else {
//       return Text("Loading");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return getCardWidget();
//   }
// }
