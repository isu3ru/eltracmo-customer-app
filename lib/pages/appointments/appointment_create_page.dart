import 'package:eltracmo_customers/models/vehicle.dart';
import 'package:eltracmo_customers/services/vehicle_service.dart';
import 'package:eltracmo_customers/widgets/form/form_label.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_dropdown.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_timepicker.dart';
import 'package:eltracmo_customers/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class AppointmentCreatePage extends StatefulWidget {
  final DateTime selectedDate;

  const AppointmentCreatePage({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  State<AppointmentCreatePage> createState() => _AppointmentCreatePageState();
}

class _AppointmentCreatePageState extends State<AppointmentCreatePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<DropdownMenuItem<Vehicle>> vehicles = [];

  @override
  void initState() {
    super.initState();
    getVehicles();
  }

  void getVehicles() async {
    VehicleService.getAllVehiclesList().then((vehicles) {
      setState(() {
        this.vehicles = vehicles
            .map(
              (vehicle) => DropdownMenuItem<Vehicle>(
                value: vehicle,
                child: Text(vehicle.title!),
              ),
            )
            .toList();
      });
    });
  }

  void handleSave() {
    if (_formKey.currentState!.saveAndValidate()) {
      final appointmentData = _formKey.currentState!.value;
      // TODO: Save appointment data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Date: ${DateFormat('yyyy-MM-dd').format(widget.selectedDate)}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32.0),
                const FormLabel(text: 'First Name'),
                const SizedBox(
                  height: 8.0,
                ),
                RoundedCornerDropdown<Vehicle>(
                  name: 'Vehicle',
                  errorText: 'A vehicle needs to be selected.',
                  items: vehicles,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const FormLabel(text: 'Time'),
                const SizedBox(
                  height: 8.0,
                ),
                const RoundedCornerTimePicker(
                  name: 'Time',
                  errorText: 'A time needs to be selected.',
                ),
                const SizedBox(height: 32.0),
                RoundedCorneredButton(
                  buttonText: 'Schedule Appointment',
                  onPressed: () {
                    handleSave();
                  },
                  isDisabled: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
