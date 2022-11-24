import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/utils/connection.dart';
import 'package:http/http.dart' as http;

import '../utils/alert.dart';

// class Services {
//   static Future<Model> apiCall(
//       String api, String id, String token, BuildContext context) async {
//     var connectivityResult =
//         await Connection.sharedInstance.checkConnectivity();

//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       try {
//         Map<String, String> body = {'id': id};
//         Map<String, String> header = {
//           HttpHeaders.authorizationHeader: 'token $token'
//         };

//         final response =
//             await http.post(Uri.parse(api), body: body, headers: header);
//         print(response.body);
//         print(response.statusCode);

//         if (response.statusCode == 200) {
//           Model jsonResponse = modelFromJson(response.body);
//           return jsonResponse;
//         } else if (response.statusCode == 401) {
//           final errorMessage = jsonDecode(response.body);
//           Alert.showSnackBar(context, errorMessage['errorMessage']);
//           return null;
//         } else {
//           Map<String, dynamic> errorMessage = json.decode(response.body);
//           Alert.showSnackBar(context, errorMessage['errorMessage']);
//           return null;
//         }
//       } on SocketException catch (e) {
//         print(e.toString());
//         Alert.showSnackBar(context, 'Connection timed out!');
//         return null;
//       } catch (e) {
//         print(e.toString());
//         Alert.showSnackBar(context, e.toString());
//         return null;
//       }
//     } else {
//       Alert.showSnackBar(context, 'No Internet!');
//     }
//   }
// }
