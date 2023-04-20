import 'package:cell_calendar/cell_calendar.dart';
import 'package:eltracmo_customers/common/app_theme.dart';
import 'package:eltracmo_customers/pages/appointments/appointment_create_page.dart';
import 'package:eltracmo_customers/pages/common/dialogs.dart';
import 'package:eltracmo_customers/widgets/rounded_button.dart';
import 'package:eltracmo_customers/widgets/rounded_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentsHome extends StatefulWidget {
  const AppointmentsHome({super.key});

  @override
  State<AppointmentsHome> createState() => _AppointmentsHomeState();
}

class _AppointmentsHomeState extends State<AppointmentsHome> {
  DateTime selectedDate = DateTime.now();

  final howToText =
      'Swipe left / right in the calendar to navigate to the desired month and tap on the selected date to view appointments.\n\nClick on the + button to add a new appointment for the selected date.';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) =>
            Dialogs.getAlertDialog(context, 'How to?', howToText),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              height: 400,
              child: CellCalendar(
                todayMarkColor: AppTheme.primaryColor,
                events: [
                  CalendarEvent(eventName: "Car 1", eventDate: DateTime.now()),
                  CalendarEvent(
                    eventName: "Car 2",
                    eventDate: DateTime.now().add(
                      const Duration(days: 2),
                    ),
                  ),
                ],
                onCellTapped: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          RoundedButton(
            buttonText:
                'Make Appointment on ${DateFormat.yMMMMd().format(selectedDate)}',
            onPressed: () {
              // go to add appointment page
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AppointmentCreatePage(
                    selectedDate: selectedDate,
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
