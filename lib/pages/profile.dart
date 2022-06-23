part of 'pages.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                height: 170,
                width: 170,
                child: Image.network(
                  'https://i.imgur.com/ru6mFOd.png',
                  fit: BoxFit.cover,
                  width: 170,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    "Kim Jisoo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Text("kimjisoo@example.com",
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text("+6281300281392", style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                          "                     Edit Profile                     ")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
