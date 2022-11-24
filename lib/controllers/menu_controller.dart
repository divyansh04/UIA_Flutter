import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;

  var hoverItem = "".obs;
  var countryValue = "".obs;
  var stateValue = "".obs;
  var cityValue = "".obs;

  final List<String> countryValues = ['India', 'Sierra Leone'];
  final List<String> indianCities = ['Mumbai', 'Delhi'];
  final List<String> africanCities = ['Freetown'];
  final List<String> indianState = ['Maharashtra', 'Delhi'];
  final List<String> africanState = ['Western Area Urban'];
  List<String> stateValues = [];
  List<String> cityValues = [];

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  bool isCitySelected() =>
      cityValue.value == 'Mumbai' ||
      cityValue.value == 'Delhi' ||
      cityValue.value == 'Freetown';

  getStates(String countryName) {
    if (countryName == 'Sierra Leone') {
      stateValues.clear();
      stateValues = africanState;
    } else if (countryName == 'India') {
      stateValues.clear();
      stateValues = indianState;
    } else {
      print('---------------------------------------');
    }
  }

  getCities(String stateName) {
    if (stateName == 'Western Area Urban') {
      cityValues.clear();
      cityValues = africanCities;
    } else if (stateName == 'Delhi') {
      cityValues.clear();
      cityValues = ['Delhi'];
    } else {
      cityValues.clear();
      cityValues = ['Mumbai'];
    }
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageDisplayName:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
