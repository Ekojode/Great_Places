const accessToken =
    'pk.eyJ1IjoiZWtvam9kZSIsImEiOiJjbDYxeTEwbmEwYm95M2pwbjk1MjJ0Y2syIn0.oIh61hWlaLBeC9WFdX7UWQ';

class LocationHelper {
  static String getLocationPreviewImg(
      {required double longitude, required double latitude}) {
    return "https://api.mapbox.com/styles/v1/mapbox/light-v10/static/pin-s-l+000(-87.0186,32.4055)/$longitude,$latitude,15/500x300?access_token=$accessToken";
  }
}
