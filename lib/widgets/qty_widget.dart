import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

class _QtyWidgetState extends State<QtyWidget> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (num >= 2) {
                  num--;
                }
              });
            },
            icon: Icon(FontAwesomeIcons.minus, size: 18),
          ),
          SizedBox(width: 15),
          Text(
            num.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {
              setState(() {
                num++;
              });
            },
            icon: Icon(FontAwesomeIcons.plus, size: 18),
          ),
        ],
      ),
    );
  }
}
