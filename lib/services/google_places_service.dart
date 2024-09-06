import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GooglePlacesService {
  final String apiKey;

  GooglePlacesService(this.apiKey);

  Future<List<String>> getPlaceSuggestions(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey';

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
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$placeDescription&inputtype=textquery&fields=geometry&key=$apiKey';

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
}
