import 'package:flutter/material.dart';
import 'package:trailapp/screens/homepage/widgets/Product.dart';
import 'package:trailapp/screens/showall/showalldetails.dart';
import 'package:trailapp/servies/demo.dart';
import 'package:trailapp/theme/theme.dart';
import 'widgets/customAppbar.dart';

class HomePage extends StatelessWidget {
  void onPressedEvent(BuildContext context) {
   Navigator.of(context).pushNamed(ShowAllDeatils.routeName);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floationactionbtncustom(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Text("City", style: greySmall),
              titlbar(),
              priceTagList(context),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: (){
                         Navigator.of(context).pushNamed(ShowAllDeatils.routeName);

                    },
                    child: Product(
                      imgpath: 'assets/img/home.jpg',
                      place: "Jogan, Xyz palace",
                      price: "\$2000.00",
                      specs: "4 bedroom / 2 bathroom",
                    ),
                  ),
                  Product(
                    imgpath: 'assets/img/home2.jpg',
                    place: "Jogan, Xyz palace",
                    price: "\$2000.00",
                    specs: "4 bedroom / 2 bathroom",
                  ),
                  Product(
                    imgpath: 'assets/img/home.jpg',
                    place: "Jogan, Xyz palace",
                    price: "\$2000.00",
                    specs: "4 bedroom / 2 bathroom",
                  ),
                ],
              )
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
