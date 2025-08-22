import 'package:coffee_app/models/drank_model.dart';
import 'package:coffee_app/widgets/qty_widget.dart';
import 'package:coffee_app/widgets/toggle_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  // Animation
  final PageController controller = PageController(viewportFraction: 0.50);

  double pageCurrent = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        pageCurrent = controller.page ?? 1;
      });
    });
    super.initState();
  }

  // Logic

  int? selectedIndex;
  final List<Icon> icons = [
    Icon(FontAwesomeIcons.glassWater, size: 20),
    Icon(FontAwesomeIcons.glassWater, size: 18),
    Icon(FontAwesomeIcons.glassWater, size: 17),
    Icon(FontAwesomeIcons.arrowRight),
  ];
  final List titles = ['Large', 'Medium', 'Small', 'More'];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final drink = DrinkModel.drankItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 2 widget
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drink[pageCurrent.round()].title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      drink[pageCurrent.round()].suptitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "€ ${drink[pageCurrent.round()].price.toString()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // 1 widget
          PageView.builder(
            controller: controller,
            itemCount: drink.length,
            itemBuilder: (context, index) {
              final scale = 1 - (pageCurrent - index).abs() * 1;
              final translateY = (pageCurrent - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // image
                          Image.asset(
                            drink[index].drankImage,
                            height: 700,
                            fit: BoxFit.contain,
                          ),
                          // shadow
                          Positioned(
                            bottom: 150,
                            right: 0,
                            left: 0,
                            child: Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 60,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Size glass
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  final icon = icons[index];
                  final title = titles[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.amberAccent
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black87),
                          ),
                          child: icon,
                        ),
                        SizedBox(height: 5),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          // Toggle selection
          Positioned(
            right: 0,
            left: 25,
            bottom: 60,
            child: Row(
              children: [ToggleWidget(), SizedBox(width: 15), QtyWidget()],
            ),
          ),
        ],
      ),
    );
  }
}
