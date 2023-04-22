import 'package:eltracmo_customers/models/appointment.dart';
import 'package:eltracmo_customers/services/common/api_service.dart';
import 'package:eltracmo_customers/services/common/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService {
  static Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  static Future<Appointment?> saveAppointment(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    headers.addAll({'Authorization': 'Bearer $token'});

    var response = await ApiService.postRequest(
      addAppointmentRoute,
      data,
      headers,
    );

    if (response == null) {
      return null;
    }

    return Appointment.fromJson(response);
  }
}
