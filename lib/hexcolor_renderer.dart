library hexcolor_renderer;

import 'dart:ui';

class HexColorValue extends Color {
  static int _getColorFromHex(String hexColor, OpacityValue opacity, double? lightenColorAmount) {

    if(lightenColorAmount != null) {
      hexColor = hexColor.replaceAll('#', '');

      int colorValue = int.parse(hexColor, radix: 16);
      int red = (colorValue >> 16) & 0xFF;
      int green = (colorValue >> 8) & 0xFF;
      int blue = colorValue & 0xFF;

      red = (red + ((255 - red) * lightenColorAmount)).round().clamp(0, 255);
      green = (green + ((255 - green) * lightenColorAmount)).round().clamp(0, 255);
      blue = (blue + ((255 - blue) * lightenColorAmount)).round().clamp(0, 255);

      String lightenedHexColor = ((red << 16) + (green << 8) + blue).toRadixString(16).padLeft(6, '0');
      return int.parse(lightenedHexColor, radix: 16);
    }

    final Map<OpacityValue, String> opacityMap = {
      OpacityValue.fullOpacity : "FF",
      OpacityValue.highOpacity : "BF",
      OpacityValue.midOpacity : "8C",
      OpacityValue.lowOpacity : "0D",
      OpacityValue.zeroOpacity : "00"
    };

    String opacityKey = opacityMap[opacity] ?? "";
    hexColor = "$opacityKey$hexColor";
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColorValue(final String hexColor) : super(_getColorFromHex(hexColor, OpacityValue.fullOpacity, null));
  HexColorValue.transparent(final String hexColor, [OpacityValue opacityValue = OpacityValue.fullOpacity]) : super(_getColorFromHex(hexColor, opacityValue, null));
  HexColorValue.lighten(final String hexColor, [double? lightenColor]) : super(_getColorFromHex(hexColor, OpacityValue.fullOpacity, lightenColor));
}

enum OpacityValue{
  fullOpacity,
  highOpacity,
  midOpacity,
  lowOpacity,
  zeroOpacity
}