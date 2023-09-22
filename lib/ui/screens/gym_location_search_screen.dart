import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/cubit/gym_location_cubit.dart';
import 'package:wtf_gym_assignment/helpers/routes/route_helper.dart';
import 'package:wtf_gym_assignment/ui/widgets/back_button_widget.dart';
import 'package:wtf_gym_assignment/ui/widgets/custom_dropdown_widget.dart';
import 'package:wtf_gym_assignment/ui/widgets/custom_search_bar.dart';
import 'package:wtf_gym_assignment/utils/color_constants.dart';
import 'package:wtf_gym_assignment/utils/widgets_and_attributes.dart';

class GymLocationSearchScreen extends StatelessWidget {
  GymLocationSearchScreen({super.key});

  final TextEditingController _searchEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    GymLocationCubit gymLocationCubit = context.read<GymLocationCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(gymLocationCubit),
      body: _buildBody(gymLocationCubit),
    );
  }

  AppBar _buildAppBar(GymLocationCubit gymLocationCubit) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
      centerTitle: false,
      title: const Text(
        'Pick Location',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      actions: const [
        Padding(
            padding: EdgeInsets.only(right: 10), child: CustomDropDownWidget())
      ],
    );
  }

  Widget _buildBody(GymLocationCubit gymLocationCubit) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              onChanged: (value) {
                gymLocationCubit.searchAreaWiseGym(value);
              },
              hint: "Search Location",
              searchController: _searchEditingController,
              haveBgColor: false,
              showSuffixIcon: false,
              showPrefixIcon: true,
              borderRadius: 8,
              outsidePadding: 0,
            ),
            sizedBoxH8,
            _aroundYourLocationWidget(gymLocationCubit),
            sizedBoxH30,
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'AREA ',
                    style: TextStyle(
                      color: ColorConstants.redButtonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '(No. of gyms)',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxH14,
            _gymLocationListWidget(gymLocationCubit)
          ],
        ),
      ),
    );
  }

  Widget _aroundYourLocationWidget(GymLocationCubit gymLocationCubit) {
    return Row(
      children: [
        Flexible(
          child: InkWell(
            onTap: () async {
              bool res = await gymLocationCubit.requestLocationPermission();
              if (res) {
                gymLocationCubit.getNearestGymLocationData();
                RouteHelper.pop();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: ColorConstants.greyBgColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.my_location_rounded,
                    size: 18,
                  ),
                  sizedBoxW8,
                  Text(
                    'Around Your Location',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_right_alt,
                    color: ColorConstants.redButtonColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        sizedBoxW12,
        InkWell(
          onTap: () async {
            bool res = await gymLocationCubit.requestLocationPermission();
            if (res) {
              gymLocationCubit.getNearestGymLocationData();
              RouteHelper.pop();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorConstants.greyBgColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const Icon(
              Icons.edit_location,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _gymLocationListWidget(GymLocationCubit gymLocationCubit) {
    return BlocSelector<GymLocationCubit, GymLocationState, AreaWiseGymData>(
      selector: (state) {
        return AreaWiseGymData(
            areaWiseGymList: gymLocationCubit.areaWiseGymList ?? [],
            areaWiseGymListLength:
                gymLocationCubit.areaWiseGymList?.length ?? 0);
      },
      builder: (context, state) {
        return ListView.separated(
          itemCount: gymLocationCubit.areaWiseGymList?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                gymLocationCubit.selectedGymAreWise(
                    gymLocationCubit.areaWiseGymList?[index] ?? "");
                RouteHelper.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: ColorConstants.greyBgColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                    ),
                    sizedBoxW10,
                    Text(gymLocationCubit.areaWiseGymList?[index] ?? "")
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => sizedBoxH10,
        );
      },
    );
  }
}
