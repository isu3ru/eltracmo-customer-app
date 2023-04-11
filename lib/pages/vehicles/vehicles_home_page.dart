import 'package:eltracmo_customers/common/app_theme.dart';
import 'package:eltracmo_customers/widgets/info_banner.dart';
import 'package:eltracmo_customers/widgets/vehicle_summary_card_horizontal.dart';
import 'package:flutter/material.dart';

class VehiclesHomePage extends StatefulWidget {
  const VehiclesHomePage({super.key});

  @override
  State<VehiclesHomePage> createState() => _VehiclesHomePageState();
}

class _VehiclesHomePageState extends State<VehiclesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vehicles'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          // light blue colored info card saying to click the plus icon to add a new vehicle
          InfoBanner(
            title: 'Add a new vehicle',
            text: 'Click the plus icon below to add a new vehicle',
            icon: Icons.add,
          ),

          // vehicle card
          VehicleSummaryCardHorizontal(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.appBarColor,
        onPressed: () {
          Navigator.of(context).pushNamed('/vehicles/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
