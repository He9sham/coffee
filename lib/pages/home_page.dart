import 'package:coffee_app/models/drank_model.dart';
import 'package:coffee_app/pages/drink_details.dart';
import 'package:coffee_app/widgets/custom_appbar_home.dart';
import 'package:coffee_app/widgets/drink_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 50),
            // appBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomAppBar(),
            ),

            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drankItem.length,
                itemBuilder: (context, index) {
                  final drink = DrinkModel.drankItem[index];
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double offset = 0;
                      if (controller.hasClients) {
                        offset = controller.offset / 110 - index;
                      }
                      offset = offset.clamp(0, 1);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => DrinkDetails()),
                          ),
                          child: DrinkItem(
                            drinkImage: drink.drankImage,
                            title: drink.title,
                            subtitle: drink.suptitle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
