import 'package:flutter/material.dart';

class NoResultFoundWidget extends StatelessWidget {
  const NoResultFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 4),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 60,
          ),
          Text("No Result Found")
        ],
      ),
    );
  }
}
