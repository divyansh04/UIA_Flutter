import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/info_card.dart';
import 'package:get/get.dart';

class OverviewCardsLargeScreen extends StatefulWidget {
  @override
  State<OverviewCardsLargeScreen> createState() =>
      _OverviewCardsLargeScreenState();
}

class _OverviewCardsLargeScreenState extends State<OverviewCardsLargeScreen> {
  String imageAddress = 'assets/images/commercial.png';
  int selectedVal = 1;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                ),
                isExpanded: true,
                hint: const Text(
                  'Select Country',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: menuController.countryValues
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  menuController.countryValue.value = value.toString();
                  menuController.getStates(value.toString());
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select State',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: menuController.stateValues
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    menuController.stateValue.value = value.toString();
                    menuController.getCities(value.toString());
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Select City',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: menuController.cityValues
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  menuController.cityValue.value = value.toString();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        Obx(() {
          return !menuController.isCitySelected()
              ? Container()
              : Container(
                  height: _height * 0.5,
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: _height * 0.5,
                        width: _width * 0.5,
                        color: Colors.white,
                        child: Image.asset(imageAddress),
                      ),
                      Expanded(
                        child: Container(
                          width: 400,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              // InfoCard(
                              //   title: "Rides in progress",
                              //   value: "7",
                              //   onTap: () {},
                              //   topColor: Colors.orange,
                              // ),
                              // SizedBox(
                              //   width: _width / 64,
                              // ),
                              InfoCard(
                                title: "Commercial",
                                value: "1",
                                isActive: selectedVal == 1,
                                topColor: Colors.blue,
                                onTap: () {
                                  imageAddress = 'assets/images/commercial.png';
                                  selectedVal = 1;
                                  setState(() {});
                                },
                              ),
                              SizedBox(height: 16),
                              InfoCard(
                                  title: "Industrial",
                                  value: "2",
                                  isActive: selectedVal == 2,
                                  topColor: Colors.redAccent,
                                  onTap: () {
                                    imageAddress =
                                        'assets/images/industrial.png';
                                    selectedVal = 2;
                                    setState(() {});
                                  }),
                              SizedBox(height: 16),
                              InfoCard(
                                title: "Residential ",
                                value: "3",
                                topColor: Colors.amber,
                                isActive: selectedVal == 3,
                                onTap: () {
                                  imageAddress =
                                      'assets/images/residential.png';
                                  selectedVal = 3;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ],
    );
  }
}
