import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_gym_assignment/cubit/gym_location_cubit.dart';
import 'package:wtf_gym_assignment/helpers/routes/route_helper.dart';
import 'package:wtf_gym_assignment/helpers/routes/routes.dart';
import 'package:wtf_gym_assignment/models/nearest_gym_location_model.dart';
import 'package:wtf_gym_assignment/ui/widgets/back_button_widget.dart';
import 'package:wtf_gym_assignment/ui/widgets/custom_search_bar.dart';
import 'package:wtf_gym_assignment/ui/widgets/gym_category_header_widget.dart';
import 'package:wtf_gym_assignment/ui/widgets/gym_details_card.dart';
import 'package:wtf_gym_assignment/ui/widgets/no_result_found_widget.dart';
import 'package:wtf_gym_assignment/utils/color_constants.dart';
import 'package:wtf_gym_assignment/utils/widgets_and_attributes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GymLocationCubit gymLocationCubit;
  late final TextEditingController _searchTextEditingController;

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    gymLocationCubit = context.read<GymLocationCubit>();
    _searchTextEditingController = TextEditingController();
    await gymLocationCubit.getGymCities();
    await gymLocationCubit.getNearestGymLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.blue.shade300,
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
      centerTitle: true,
      title: InkWell(
        onTap: () async {
          RouteHelper.push(Routes.GYM_LOCATION_SEARCH);
        },
        child: BlocBuilder<GymLocationCubit, GymLocationState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.black,
                      size: 22,
                    ),
                    Text(
                      gymLocationCubit.selectedLocationModel?.city ?? "Noida",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ],
                ),
                Text(
                  gymLocationCubit.selectedLocationModel?.locationName ??
                      "Sector 62",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          CustomSearchBar(
            onChanged: (value) {
              gymLocationCubit.searchGymByName(value);
            },
            searchController: _searchTextEditingController,
            hint: "Search by gym name",
          ),
          BlocBuilder<GymLocationCubit, GymLocationState>(
            builder: (context, state) {
              if (state is NearestGymLocationLoading) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 3),
                  child: const CircularProgressIndicator(),
                );
              }
              return Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const GymCategoryHeaderWidget(),
                  (gymLocationCubit.nearestGymLocationList?.isEmpty ?? false)
                      ? const NoResultFoundWidget()
                      : _gymDetailsView(gymLocationCubit)
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _gymDetailsView(GymLocationCubit gymLocationCubit) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: gymLocationCubit.nearestGymLocationList?.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GymDetailsCard(
            nearestGymLocationData:
                gymLocationCubit.nearestGymLocationList?[index] ??
                    NearestGymLocation(),
          );
        },
        separatorBuilder: (context, index) => sizedBoxH20,
      ),
    );
  }
}
