import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/cubit/gym_location_cubit.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({super.key});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  final List<String> textList = ["test", "this_is_a111111_long_text"];
  String? _currentItemSelected;
  late final GymLocationCubit _gymLocationCubit;

  @override
  void initState() {
    super.initState();
    _gymLocationCubit = context.read<GymLocationCubit>();
    _currentItemSelected = _gymLocationCubit.selectedGymCity;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return _gymLocationCubit.fetchedCities?.map((str) {
              return PopupMenuItem(
                value: str,
                child: Text(str,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              );
            }).toList() ??
            [];
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(_currentItemSelected ?? "Noida",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600)),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        ],
      ),
      onSelected: (v) {
        setState(() {
          _currentItemSelected = v;
          _gymLocationCubit.selectedGymCity = v;
          _gymLocationCubit.selectPopularLocationOfTheCity();
        });
      },
    );
  }
}
