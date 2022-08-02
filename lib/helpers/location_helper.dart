import 'dart:convert';

import "package:http/http.dart" as http;

const accessToken =
    'pk.eyJ1IjoiZWtvam9kZSIsImEiOiJjbDYxeTEwbmEwYm95M2pwbjk1MjJ0Y2syIn0.oIh61hWlaLBeC9WFdX7UWQ';
const googleApiKey = 'AIzaSyBmpFo8AvUFlAWPTdG5U3B1doXRSzhwBG8';

class LocationHelper {
  static String getLocationPreviewImg(
      {required double longitude, required double latitude}) {
    return "https://api.mapbox.com/styles/v1/mapbox/light-v10/static/pin-s-l+000(-87.0186,32.4055)/$longitude,$latitude,15/500x300?access_token=$accessToken";
  }

  static Future<String> getPlaceAddress(
      {required double lat, required double lon}) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=$googleApiKey');
    final response = await http.get(url);
    final responseData =
        jsonDecode(response.body)['results'][0]['formatted_address'] as String;
    return responseData;
  }
}
