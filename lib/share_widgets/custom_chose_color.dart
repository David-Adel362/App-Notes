import 'package:flutter/material.dart';

class CustomChoseColor extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const CustomChoseColor({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Chose Color"),
            content: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    onColorSelected(color);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: color == selectedColor ? Colors.black : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selectedColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: const Icon(Icons.color_lens, color: Colors.white),
      ),
    );
  }

  // مجموعة ألوان مقترحة
  static const List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.cyan,
    Colors.amber,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.black,
  ];
}
