import 'package:flutter/material.dart';

class ShowAllDeatils extends StatelessWidget {
  static const routeName = '/showalldetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.asset('assets/img/home.jpg'),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   SizedBox(height: 30),
                  IconButton(icon: Icon(Icons.arrow_back_ios),
                   onPressed: (){Navigator.of(context).pop();})
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
