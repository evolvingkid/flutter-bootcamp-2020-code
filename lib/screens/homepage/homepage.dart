import 'package:flutter/material.dart';
import 'package:trailapp/models/homeDataModels.dart';
import 'package:trailapp/screens/form/formpage.dart';
import 'package:trailapp/screens/homepage/widgets/Product.dart';
import 'package:trailapp/screens/showall/showalldetails.dart';
import 'package:trailapp/theme/theme.dart';
import 'widgets/customAppbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onPressedEvent(BuildContext context) {
    Navigator.of(context).pushNamed(ShowAllDeatils.routeName);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<HomeDataModel> houseData = [
    HomeDataModel(
      houseName: 'this is house name',
      bathrom: 2,
      bedroom: 4,
      description: 'hqdiq iwudhqwudqhw dhqw dhqw',
      price: 222,
    ),
    HomeDataModel(
      houseName: 'this is house name',
      bathrom: 2,
      bedroom: 4,
      description: 'hqdiq iwudhqwudqhw dhqw dhqw',
      price: 223,
    ),
    HomeDataModel(
      houseName: 'this is house name',
      bathrom: 2,
      bedroom: 4,
      description: 'hqdiq iwudhqwudqhw dhqw dhqw',
      price: 223,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floationactionbtncustom(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('form'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FormPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                ontap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              Text("City", style: greySmall),
              titlbar(),
              priceTagList(context),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: houseData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Map argumnets = {
                        'housename': houseData[index].houseName,
                        'price': houseData[index].price
                      };

                      Navigator.of(context).pushNamed(ShowAllDeatils.routeName,
                          arguments: argumnets);
                    },
                    child: Product(
                      imgpath: 'assets/img/home.jpg',
                      place: "Jogan, Xyz palace",
                      price: houseData[0].price.toString(),
                      specs: "4 bedroom / 2 bathroom",
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container priceTagList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
          GreyCard(price: "₹8888"),
        ],
      ),
    );
  }

  Row titlbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "San Francisco",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 34),
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
}

class floationactionbtncustom extends StatelessWidget {
  const floationactionbtncustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(9, 9, 63, 1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.place,
            color: Colors.white,
          ),
          Text(
            "Map View",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class GreyCard extends StatelessWidget {
  const GreyCard({
    Key key,
    this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(12),
      child: Text(
        "$price",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
