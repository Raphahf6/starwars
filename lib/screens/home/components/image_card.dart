import 'package:flutter/material.dart';
import 'package:starwars_app/controler/constants.dart';

class ImageCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl == null
                      ? "https://flymobi.com.br/images/placeholder-img.jpg"
                      : imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
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
              width: width,
              padding: const EdgeInsets.all(CARD_DEFAULT_PADDING),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20 / MediaQuery.of(context).textScaleFactor,
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
