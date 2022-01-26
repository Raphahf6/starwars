import 'package:flutter/material.dart';

import '../../../controler/constants.dart';

class MyCards extends StatelessWidget {
  const MyCards({
    Key? key,
    required this.image,
    required this.title,
    this.press,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          left: kdefaultPadding,
          top: kdefaultPadding * 2,
          bottom: kdefaultPadding * 3,
        ),
        // vai cobrir 40% do total de largura
        width: size.width * 0.5,
        child: Column(
          children: [
            Container(
              width: size.width * .3,
              height: size.height * .1,
              padding: const EdgeInsets.all(kdefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: kprimaryColor.withOpacity(0.23))
                  ]),
              child: Center(
                child: RichText(
                    text: TextSpan(
                  text: image,
                  style: Theme.of(context).textTheme.button,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
