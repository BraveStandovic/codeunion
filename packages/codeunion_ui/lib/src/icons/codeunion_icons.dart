import 'package:codeunion_ui/src/colors/codeunion_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:codeunion_ui/src/generated/assets.gen.dart';

abstract class CODEUNIONIcon {
  ///Returns the feed icon
  SvgPicture feedIcon({double? size, Color? color}) {
    return Assets.icons.feedIcon.svg(
      theme: SvgTheme(currentColor: color ?? CODEUNIONColors.black),
      height: size ?? 14,
      width: size ?? 14,
      color: color ?? CODEUNIONColors.black,
    );
  }

  ///Returns the map outline icon
  SvgPicture mapIcon({double? size, Color? color}) {
    return Assets.icons.mapIcon.svg(
      theme: SvgTheme(currentColor: color ?? CODEUNIONColors.black),
      height: size ?? 14,
      width: size ?? 14,
      color: color ?? CODEUNIONColors.black,
    );
  }

  ///Returns the map outline icon
  SvgPicture favoriteIcon({double? size, Color? color}) {
    return Assets.icons.favoriteIcon.svg(
      theme: SvgTheme(currentColor: color ?? CODEUNIONColors.black),
      height: size ?? 14,
      width: size ?? 14,
      color: color ?? CODEUNIONColors.black,
    );
  }

  ///Returns the map outline icon
  SvgPicture profileIcon({double? size, Color? color}) {
    return Assets.icons.profileIcon.svg(
      theme: SvgTheme(currentColor: color ?? CODEUNIONColors.black),
      height: size ?? 14,
      width: size ?? 14,
      color: color ?? CODEUNIONColors.black,
    );
  }
}
