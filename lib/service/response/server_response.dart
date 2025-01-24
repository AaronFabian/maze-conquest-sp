// enum Status {
//   ok("OK"),
//   fatalError("FATAL_ERROR");

//   final String value;

//   const Status(this.value);

//   // Convert string to enum
//   static Status fromString(String status) {
//     return Status.values.firstWhere((e) => e.value == status, orElse: () => Status.ok);
//   }
// }

import 'package:flutter/material.dart';

class ServerResponse {
  int code;
  String status;
  dynamic data;

  ServerResponse(Map<String, dynamic> def)
      : code = def["code"],
        status = def["status"],
        data = def["data"];

  @override
  String toString() {
    return 'Response{code: $code, status: $status}';
  }

  T? convertData<T>(T Function(Map<String, dynamic>) fromJson) {
    try {
      if (data is Map<String, dynamic>) {
        return fromJson(data as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      debugPrint('Error converting data: $e');
      return null;
    }
  }

  static void snackBarErrorResponse(BuildContext context, String message,
      {int duration = 2, Color color = Colors.redAccent}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
