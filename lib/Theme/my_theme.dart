import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return FlexColorScheme.light(
      scheme: FlexScheme.material,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      bottomAppBarElevation: 14.5,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        sliderTrackHeight: 14,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        bottomSheetRadius: 50.0,
        bottomNavigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        bottomNavigationBarElevation: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    ).toTheme;
  }

  static ThemeData darkTheme(BuildContext context) {
    return FlexColorScheme.dark(
      scheme: FlexScheme.material,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        sliderTrackHeight: 14,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        bottomSheetRadius: 50.0,
        bottomNavigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        bottomNavigationBarElevation: 12.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    ).toTheme;
  }
}
