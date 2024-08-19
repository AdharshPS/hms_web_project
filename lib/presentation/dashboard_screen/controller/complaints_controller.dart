import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintsController with ChangeNotifier {
  List<String> designationList = [];
  designations() async {
    String uri = "https://cybot.avanzosolutions.in/hms/designations.php";
    try {
      var res = await http.get(Uri.parse(uri));
      designationList = List<String>.from(await jsonDecode(res.body));
      print(res.body);
      print("----------------------$designationList");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  complaintRegistration({
    required String empcode,
    required String date,
    required String towhom,
    required String complaints,
  }) async {
    String uri = "https://cybot.avanzosolutions.in/hms/complaintreg.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'empcodecontroller': empcode,
        'complaintcontroller': complaints,
        'datecontroller': date,
        'towhomcontroller': towhom
      });
      print(res.body);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
