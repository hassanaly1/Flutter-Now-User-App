import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/utils/conts.dart';

const String apiKey = GOOGLE_MAPS_API_KEY;
const String baseUrl = 'https://maps.googleapis.com/maps/api/';

class MyGooglePlacesService {
  MyGooglePlacesService();

  Future<List<String>> getPlaceSuggestions(String input) async {
    final url = '${baseUrl}place/autocomplete/json?input=$input&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final predictions = data['predictions'] as List<dynamic>;

        return predictions
            .map((prediction) => prediction['description'] as String)
            .toList();
      } else {
        throw Exception('Failed to fetch suggestions');
      }
    } catch (e) {
      debugPrint('Error fetching place suggestions: $e');
      return [];
    }
  }

  Future<LatLng?> getPlaceDetails(String placeDescription) async {
    // Construct the API call to fetch the place details
    final url =
        '${baseUrl}place/findplacefromtext/json?input=$placeDescription&inputtype=textquery&fields=geometry&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final location = data['candidates'][0]['geometry']['location'];
        return LatLng(location['lat'], location['lng']);
      }
    } catch (e) {
      print('Error fetching place details: $e');
    }

    return null; // Return null if unable to fetch the location
  }

  // Method to calculate the distance and duration between two locations
  Future<Map<String, String>?> getDistanceAndDuration(
      LatLng start, LatLng end) async {
    // Construct the API call to get distance and duration
    final url =
        '${baseUrl}distancematrix/json?units=metric&origins=${start.latitude},${start.longitude}&destinations=${end.latitude},${end.longitude}&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['rows'] != null &&
            data['rows'].isNotEmpty &&
            data['rows'][0]['elements'] != null &&
            data['rows'][0]['elements'].isNotEmpty) {
          final element = data['rows'][0]['elements'][0];
          if (element['status'] == 'OK') {
            final distance = element['distance']['text'];
            final duration = element['duration']['text'];

            return {'distance': distance, 'duration': duration};
          }
        } else {
          throw Exception('No valid elements in response');
        }
      } else {
        throw Exception('Failed to fetch distance and duration');
      }
    } catch (e) {
      debugPrint('Error fetching distance and duration: $e');
      return null;
    }
    return null;
  }
}
