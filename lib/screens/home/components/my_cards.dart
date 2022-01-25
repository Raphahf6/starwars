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
              padding: const EdgeInsets.all(kdefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
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
            Container(
              padding: const EdgeInsets.all(kdefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kprimaryColor.withOpacity(0.23),
                    )
                  ]),
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n".toUpperCase(),
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                          text: description,
                          style:
                              TextStyle(color: kprimaryColor.withOpacity(0.5)))
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
