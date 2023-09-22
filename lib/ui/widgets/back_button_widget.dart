import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wtf_gym_assignment/core/helpers/routes/route_helper.dart';

class BackButtonWidget extends StatelessWidget {
  final bool exitApp;
  const BackButtonWidget({super.key, this.exitApp = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (exitApp) {
          SystemNavigator.pop();
        } else {
          RouteHelper.pop();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: const Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.arrow_back_rounded,
                  color: Colors.black, size: 15, weight: 5),
            ),
          ),
        ],
      ),
    );
  }
}
