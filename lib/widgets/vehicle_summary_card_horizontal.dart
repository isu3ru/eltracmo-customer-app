import 'package:flutter/material.dart';

class VehicleSummaryCardHorizontal extends StatelessWidget {
  final Image? image;

  const VehicleSummaryCardHorizontal({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.23),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/icons/car.png',
              width: 96.0,
              height: 96.0,
              cacheHeight: 96,
              cacheWidth: 96,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'My First Vehicle',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'WP XXX-XXXX',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Mitsubishi Lancer',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Evolution',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
