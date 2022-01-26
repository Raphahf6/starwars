import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../../../controler/constants.dart';
import '../../custumize_avatar.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kdefaultPadding * 2.5),
      height: size.height * .4 / 1.1,
      child: Stack(
        children: [
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(
                left: kdefaultPadding + 30,
                right: kdefaultPadding + 30,
                bottom: -5 + kdefaultPadding),
            height: size.height * 0.4 - 20,
            decoration: const BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: [
                Text(
                  "Olá #SW-Fan!",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustumizeAvatar())),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: FluttermojiCircleAvatar(),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                padding:
                    const EdgeInsets.symmetric(horizontal: kdefaultPadding),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0.1),
                        blurRadius: 10,
                        color: kprimaryColor.withOpacity(0.90)),
                  ],
                ),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) => {},
                      decoration: InputDecoration(
                        hintText: "Pesquisar",
                        hintStyle:
                            TextStyle(color: kprimaryColor.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.search,
                    semanticLabel: "Search",
                    color: kprimaryColor.withOpacity(0.5),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
