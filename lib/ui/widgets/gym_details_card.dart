import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wtf_gym_assignment/models/nearest_gym_location_model.dart';
import 'package:wtf_gym_assignment/core/utils/color_constants.dart';
import 'package:wtf_gym_assignment/core/utils/widgets_and_attributes.dart';

class GymDetailsCard extends StatelessWidget {
  final NearestGymLocation nearestGymLocationData;
  const GymDetailsCard({super.key, required this.nearestGymLocationData});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/gym_card_bg.jpeg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      // padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 16),
            child: Text(
              nearestGymLocationData.categoryName ?? "",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          sizedBoxH12,
          Center(
            child: CachedNetworkImage(
              imageUrl: nearestGymLocationData.coverImage ??
                  "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637",
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.image),
                );
              },
            ),
          ),
          sizedBoxH12,
          Center(
            child: Text(
              '${nearestGymLocationData.gymName}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          sizedBoxH12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Text(
                '${nearestGymLocationData.distanceText} * ${nearestGymLocationData.address1}, ${nearestGymLocationData.address2}, ${nearestGymLocationData.city}, ${nearestGymLocationData.country}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          sizedBoxH12,
          Container(
            decoration: const BoxDecoration(
              color: ColorConstants.darkGreyBgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                sizedBoxH30,
                Text(
                  'STARTING AT ${nearestGymLocationData.planPrice ?? "1833"} /month',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                sizedBoxH24,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstants.redButtonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: const Text(
                            'FREE FIRST DAY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      sizedBoxW16,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorConstants.greyButtonColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          child: const Text(
                            'BUY NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxH20
              ],
            ),
          ),
        ],
      ),
    );
  }
}
