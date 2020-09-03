import 'package:flutter/material.dart';
import 'package:trailapp/theme/theme.dart';

class Product extends StatelessWidget {
  const Product({Key key, this.price, this.imgpath, this.place, this.specs})
      : super(key: key);
  final String price, imgpath, place, specs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  child: Image.asset(
                    '${imgpath}',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Row(
                children: [
                  Text(
                    "${price}",
                    style: blackMedium,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${place}",
                    style: greySmall,
                  ),
                ],
              ),
              Text(
                "${specs}",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 40,
          child: FavoriteBtn(),
        ),
      ],
    );
  }
}

class FavoriteBtn extends StatefulWidget {
  @override
  _FavoriteBtnState createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  bool _isfaviorite = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isfaviorite = !_isfaviorite;
          });
        },
        child: Icon(
          _isfaviorite ? Icons.favorite : Icons.favorite_border,
          color: _isfaviorite ? Colors.red : Colors.black,
        ),
      ),
    );
  }
}
