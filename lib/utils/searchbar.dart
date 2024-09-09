import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/services/google_maps_service.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final MyGoogleMapsController _controller = Get.find<MyGoogleMapsController>();
  final MyGoogleMapsService placesService = MyGoogleMapsService();

  final RxList<String> _suggestions = <String>[].obs;

  void _onTextChanged(String input) async {
    if (input.isEmpty) {
      _suggestions.clear();
    } else {
      final suggestions = await placesService.getPlaceSuggestions(input);
      _suggestions.value = suggestions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReUsableContainer(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: _controller.searchController,
              onChanged: _onTextChanged,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: AppColors.blackTextColor,
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Search for Places',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.blackTextColor,
                ),
                prefixIcon: Icon(
                  LucideIcons.search,
                  color: AppColors.blackTextColor,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    _suggestions.clear();
                    _controller.searchController.clear();
                  },
                  child: Icon(
                    LucideIcons.circleX,
                    color: AppColors.blackTextColor,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white38),
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8.0)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.errorColor),
                    borderRadius: BorderRadius.circular(8.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.errorColor),
                    borderRadius: BorderRadius.circular(8.0)),
                errorStyle: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColors.errorColor),
              ),
            ),
          )),
        ),
        Obx(() => _suggestions.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReUsableContainer(
                  color: AppColors.buttonColor.withOpacity(0.2),
                  verticalPadding: 0.0,
                  padding: EdgeInsets.zero,
                  showBackgroundShadow: true,
                  // height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          LucideIcons.mapPinned,
                          color: AppColors.blackTextColor,
                        ),
                        trailing: Icon(
                          LucideIcons.navigation,
                          color: AppColors.blackTextColor,
                        ),
                        title: CustomTextWidget(text: _suggestions[index]),
                        onTap: () async {
                          FocusManager.instance.primaryFocus
                              ?.unfocus(); //   // Handle the tap on a suggestion
                          //   debugPrint('Selected Place: ${_suggestions[index]}');
                          // Get the selected place details (latitude, longitude)
                          final placeDetails = await placesService
                              .getPlaceDetails(_suggestions[index]);

                          if (placeDetails != null) {
                            // Update the marker position on the map
                            Get.find<MyGoogleMapsController>()
                                .addSingleMarker(placeDetails);

                            // Update the map's camera position
                            Get.find<MyGoogleMapsController>()
                                .googleMapsController
                                ?.animateCamera(
                                    CameraUpdate.newLatLng(placeDetails));
                          }
                          // You can set the selected location, update markers, etc. here
                          // Set the search text and clear suggestions
                          _controller.searchController.text =
                              _suggestions[index];
                          _suggestions.clear();
                        },
                      );
                    },
                  ),
                ),
              )
            : const SizedBox()), // Show empty if no suggestions
      ],
    );
  }
}
