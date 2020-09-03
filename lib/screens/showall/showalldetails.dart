import 'package:flutter/material.dart';

class ShowAllDeatils extends StatelessWidget {
  static const routeName = '/showalldetails';

  @override
  Widget build(BuildContext context) {
    Map argu = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 300,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset('assets/img/home.jpg', fit: BoxFit.cover,)),
              Align(alignment: Alignment.center, child: Text('sdsdsd'))
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(margin: EdgeInsets.all(10), child: Text(argu['housename'])),
        Text(argu['housename']),
      ],
    ));
  }
}
