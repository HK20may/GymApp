import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/cubit/gym_location_cubit.dart';
import 'package:wtf_gym_assignment/core/utils/color_constants.dart';

class GymCategoryHeaderWidget extends StatelessWidget {
  const GymCategoryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final gymLocationData = context.read<GymLocationCubit>();

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 14,
      ),
      child: BlocBuilder<GymLocationCubit, GymLocationState>(
        builder: (context, state) {
          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: gymLocationData.gymCategoryList?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      gymLocationData.selectedGymCategoryIndex = index;
                      gymLocationData.filterGymList(
                          gymLocationData.gymCategoryList?[index] ?? "");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.only(
                          top: 12, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          color:
                              index == gymLocationData.selectedGymCategoryIndex
                                  ? Colors.black
                                  : null,
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        gymLocationData.gymCategoryList?[index] == ""
                            ? "WTF Rest"
                            : index == 0
                                ? (gymLocationData.gymCategoryList?[index] ??
                                    "")
                                : "WTF ${gymLocationData.gymCategoryList?[index]}",
                        style: TextStyle(
                            color: index ==
                                    gymLocationData.selectedGymCategoryIndex
                                ? Colors.white
                                : ColorConstants.blue.shade900,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ));
              });
        },
      ),
    );
  }
}
