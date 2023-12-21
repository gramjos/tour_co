import 'package:flutter/material.dart';

class PlatformInfo {
  static Map<String, dynamic> getPlatformInfo(BuildContext context) {
    // Check the platform
    // Define a threshold for mobile screen width
    const double mobileWidthThreshold = 500; // This can be adjusted
    const double tabletWidthThreshold = 690; // This can be adjusted

    // Get the current screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double pWidth, pHeight, pSpace, pFontSize;
    String browserType;
    if (screenWidth <= mobileWidthThreshold) {
      browserType = "Mobile Browser";
      pWidth = 120;
      pHeight = 120;
      pSpace = 0;
      pFontSize = 30;
    } else if (screenWidth <= tabletWidthThreshold) {
      browserType = "Tablet Browser";
      pWidth = 260;
      pHeight = 260;
      pSpace = 0;
      pFontSize = 40;
    } else {
      browserType = "Desktop Browser";
      pWidth = 400;
      pHeight = 400;
      pSpace = 170;
      pFontSize = 40;
    }

    String platform = 'Running on: $browserType';

    return {
      'platform': platform,
      'pWidth': pWidth,
      'pHeight': pHeight,
      'pSpace': pSpace,
      'pFontSize': pFontSize,
    };
  }
}
