import 'package:flutter/material.dart';

class CardWeather extends StatelessWidget {
  final Color color;
  final String assetName;
  final String condition;
  final String type;
  final double? width;

  const CardWeather({
    super.key,
    required this.color,
    required this.assetName,
    required this.condition,
    required this.type,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.3,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(assetName),
              height: MediaQuery.sizeOf(context).height * 0.21,
            ),
            Text(
              condition,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
            ),
            Text(type, style: TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
