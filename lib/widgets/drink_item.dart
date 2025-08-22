import 'package:flutter/material.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({
    super.key,
    required this.drinkImage,
    required this.title,
    required this.subtitle,
  });
  final String drinkImage, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // card widget
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Card(
            elevation: 3,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 3),

              child: Row(),
            ),
          ),
        ),
          // image widget
        Positioned (
          top: -10,
          bottom: 49,
          left: 20,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),

              Image.asset(drinkImage, fit: BoxFit.contain),
            ],
          ),
        ),
        // title and subtitle widget
        Positioned(
          top: 75,
          right: 90,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 85,
          bottom: 0,
          right: 40,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(color: Colors.black38),
            ),
            child: Icon(Icons.arrow_forward, size: 17, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
