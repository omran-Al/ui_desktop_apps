import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../models/doctors_model.dart';

class DoctorServices {
  static getDector() async {
    dynamic data = await rootBundle
        .loadString("assets/test.json")
        .then((jsonStr) => jsonDecode(jsonStr));

    List doctors = data.map((e) => DoctorsModel.fromJson(e)).toList();
    return doctors;
  }
}
