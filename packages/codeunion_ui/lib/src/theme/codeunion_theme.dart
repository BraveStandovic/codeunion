import 'package:flutter/material.dart';
import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/services.dart';

class CODEUNIONTheme {
  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CODEUNIONColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: CODEUNIONColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      dividerColor: CODEUNIONColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CODEUNIONColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: CODEUNIONColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: CODEUNIONColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: CODEUNIONColors.skyBlue,
      primaryContainer: CODEUNIONColors.lightBlue200,
      onPrimaryContainer: CODEUNIONColors.oceanBlue,
      secondary: CODEUNIONColors.paleSky,
      onSecondary: CODEUNIONColors.white,
      secondaryContainer: CODEUNIONColors.lightBlue200,
      onSecondaryContainer: CODEUNIONColors.oceanBlue,
      tertiary: CODEUNIONColors.secondary.shade700,
      onTertiary: CODEUNIONColors.white,
      tertiaryContainer: CODEUNIONColors.secondary.shade300,
      onTertiaryContainer: CODEUNIONColors.secondary.shade700,
      error: CODEUNIONColors.red,
      errorContainer: CODEUNIONColors.red.shade200,
      onErrorContainer: CODEUNIONColors.redWine,
      background: _backgroundColor,
      onBackground: CODEUNIONColors.onBackground,
      surfaceVariant: CODEUNIONColors.surface,
      onSurfaceVariant: CODEUNIONColors.grey,
      inversePrimary: CODEUNIONColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: CODEUNIONColors.black,
        onBackground: CODEUNIONColors.white,
        surface: CODEUNIONColors.black,
        onSurface: CODEUNIONColors.lightGrey,
        primary: CODEUNIONColors.purple,
        onPrimary: CODEUNIONColors.oceanBlue,
        primaryContainer: CODEUNIONColors.oceanBlue,
        onPrimaryContainer: CODEUNIONColors.lightBlue200,
        secondary: CODEUNIONColors.paleSky,
        onSecondary: CODEUNIONColors.lightGrey,
        secondaryContainer: CODEUNIONColors.liver,
        onSecondaryContainer: CODEUNIONColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => CODEUNIONColors.grey;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: CODEUNIONColors.white,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: CODEUNIONColors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: CODEUNIONColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: CODEUNIONColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: CODEUNIONColors.outlineLight,
      space: CODEUNIONSpacing.lg,
      thickness: CODEUNIONSpacing.xxxs,
      indent: CODEUNIONSpacing.lg,
      endIndent: CODEUNIONSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: CODEUNIONColors.white,
      displayColor: CODEUNIONColors.white,
      decorationColor: CODEUNIONColors.white,
    );
  }

  /// The UI text theme based on [CODEUNIONTextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: CODEUNIONTextStyle.headline1,
    displayMedium: CODEUNIONTextStyle.headline2,
    displaySmall: CODEUNIONTextStyle.headline3,
    titleMedium: CODEUNIONTextStyle.subtitle1,
    titleSmall: CODEUNIONTextStyle.subtitle2,
    bodyLarge: CODEUNIONTextStyle.bodyText1,
    bodyMedium: CODEUNIONTextStyle.bodyText2,
    labelLarge: CODEUNIONTextStyle.button,
    bodySmall: CODEUNIONTextStyle.caption,
    labelSmall: CODEUNIONTextStyle.overline,
  ).apply(
    bodyColor: CODEUNIONColors.black,
    displayColor: CODEUNIONColors.black,
    decorationColor: CODEUNIONColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: CODEUNIONColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: CODEUNIONColors.secondary.shade700,
      secondarySelectedColor: CODEUNIONColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle:
          CODEUNIONTextStyle.button.copyWith(color: CODEUNIONColors.black),
      secondaryLabelStyle:
          CODEUNIONTextStyle.labelSmall.copyWith(color: CODEUNIONColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _darkChipTheme {
    return _chipTheme.copyWith(
      backgroundColor: CODEUNIONColors.white,
      disabledColor: _backgroundColor,
      selectedColor: CODEUNIONColors.secondary.shade700,
      secondarySelectedColor: CODEUNIONColors.secondary.shade700,
      labelStyle: CODEUNIONTextStyle.button.copyWith(
        color: CODEUNIONColors.secondary.shade700,
      ),
      secondaryLabelStyle: CODEUNIONTextStyle.labelSmall.copyWith(
        color: CODEUNIONColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: CODEUNIONColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CODEUNIONSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: CODEUNIONSpacing.lg),
      buttonColor: CODEUNIONColors.purple,
      disabledColor: CODEUNIONColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [ElevatedButtonThemeData] based on the current theme.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: CODEUNIONSpacing.lg,
          horizontal: CODEUNIONSpacing.xlg,
        ),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: CODEUNIONFontWeight.bold,
        ),
        backgroundColor: CODEUNIONColors.purple,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: CODEUNIONFontWeight.light,
        ),
        foregroundColor: CODEUNIONColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: CODEUNIONFontWeight.light,
        ),
        foregroundColor: CODEUNIONColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: CODEUNIONColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CODEUNIONSpacing.lg),
          topRight: Radius.circular(CODEUNIONSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: CODEUNIONColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: CODEUNIONColors.onBackground,
      contentPadding: EdgeInsets.all(CODEUNIONSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return CODEUNIONColors.darkAqua;
        }
        return CODEUNIONColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return CODEUNIONColors.primaryContainer;
        }
        return CODEUNIONColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: CODEUNIONColors.purple,
      circularTrackColor: CODEUNIONColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: CODEUNIONTextStyle.button,
      labelColor: CODEUNIONColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: CODEUNIONSpacing.lg,
        vertical: CODEUNIONSpacing.md + CODEUNIONSpacing.xxs,
      ),
      unselectedLabelStyle: CODEUNIONTextStyle.button,
      unselectedLabelColor: CODEUNIONColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: CODEUNIONColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: CODEUNIONColors.white,
      selectedItemColor: CODEUNIONColors.purple,
      unselectedItemColor: CODEUNIONColors.black.withOpacity(0.74),
      // selectedLabelStyle: CODEUNIONTextStyle.labelSmall.copyWith(
      //   color: CODEUNIONColors.purple,
      // ),
      selectedIconTheme: const IconThemeData(
        color: CODEUNIONColors.purple,
      ),
      unselectedIconTheme: const IconThemeData(
        color: CODEUNIONColors.black,
      ),
      unselectedLabelStyle: CODEUNIONTextStyle.labelSmall.copyWith(
        color: CODEUNIONColors.black,
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => CODEUNIONColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: CODEUNIONSpacing.xlg,
            vertical: CODEUNIONSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? CODEUNIONTextStyle.button.copyWith(
                  color: CODEUNIONColors.black,
                  fontWeight: FontWeight.w500,
                )
              : CODEUNIONTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? CODEUNIONColors.black
                      : CODEUNIONColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => CODEUNIONColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: CODEUNIONColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: CODEUNIONSpacing.xlg,
            vertical: CODEUNIONSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? CODEUNIONTextStyle.button.copyWith(
                  color: CODEUNIONColors.white,
                  fontWeight: FontWeight.w500,
                )
              : CODEUNIONTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? CODEUNIONColors.black
                      : CODEUNIONColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
