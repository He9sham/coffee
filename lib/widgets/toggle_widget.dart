import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isCold = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          buildToggleSelection('hot', !isCold),
          buildToggleSelection('iced', isCold),
        ],
      ),
    );
  }

  Widget buildToggleSelection(label, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCold = label == 'iced';
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 20),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey[400],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(padding: const EdgeInsets.all(10), child: Text(label)),
      ),
    );
  }
}
