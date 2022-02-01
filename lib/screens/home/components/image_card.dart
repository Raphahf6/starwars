import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';

class ImageCard extends StatefulWidget {
  String title;
  String imageUrl;
  Function()? onTap;

  double height;
  double width;

  ImageCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    this.height = double.infinity,
    this.width = 180,
  }) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: widget.onTap,
      child: Card(
        elevation: 15,
        color: cardPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            SizedBox(
              width: widget.width,
              height: widget.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black12,
                    Colors.black,
                  ],
                ),
              ),
            ),
            Container(
              width: widget.width,
              padding: const EdgeInsets.all(CARD_DEFAULT_PADDING),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 13 / MediaQuery.of(context).textScaleFactor,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
