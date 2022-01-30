import 'package:flutter/material.dart';

import '../../../controler/constants.dart';

class SessionTitle extends StatefulWidget {
  const SessionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function()? press;

  @override
  State<SessionTitle> createState() => _SessionTitleState();
}

class _SessionTitleState extends State<SessionTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1 / 2,
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MainTitle(text: widget.title),
          ],
        ),
      ),
    );
  }
}

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kdefaultPadding / 4),
      child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
            letterSpacing: 2,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: const Color(0xffFCAB10)),
      ),
    );
  }
}
