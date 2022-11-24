import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final Function onTap;

  const InfoCard(
      {Key key,
      @required this.title,
      @required this.value,
      this.isActive = false,
      @required this.onTap,
      this.topColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: isActive ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 16),
      duration: Duration(microseconds: 250),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: topColor ?? active,
                  height: 5,
                ))
              ],
            ),
            // Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("$title\n",
                        style: TextStyle(
                            fontSize: 16,
                            color: isActive ? active : lightGrey)),
                    Text("$value",
                        style: TextStyle(
                            fontSize: 40, color: isActive ? active : dark)),
                  ]),
            ),
            // Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
