import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

import '../../../controler/constants.dart';
import '../../custumize_avatar.dart';
import 'body.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .4,
      child: Stack(
        children: [
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(
              left: kdefaultPadding + 15,
              right: kdefaultPadding + 15,
            ),
            height: widget.size.height * 0.4 - 20,
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic),
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
        ],
      ),
    );
  }
}
