import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class CustumizeAvatar extends StatefulWidget {
  const CustumizeAvatar({Key? key}) : super(key: key);

  @override
  _CustumizeAvatarState createState() => _CustumizeAvatarState();
}

class _CustumizeAvatarState extends State<CustumizeAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FluttermojiCustomizer(
              showSaveWidget: true,
            ),
          )
        ],
      ),
    );
  }
}
