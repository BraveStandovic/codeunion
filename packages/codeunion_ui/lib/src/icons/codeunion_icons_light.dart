import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CODEUNIONIconsLight extends CODEUNIONIcon {
  @override
  SvgPicture feedIcon({double? size, Color? color}) {
    return super.feedIcon(
      color: color ?? CODEUNIONColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture mapIcon({double? size, Color? color}) {
    return super.mapIcon(
      color: color ?? CODEUNIONColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture favoriteIcon({double? size, Color? color}) {
    return super.favoriteIcon(
      color: color ?? CODEUNIONColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture profileIcon({double? size, Color? color}) {
    return super.profileIcon(
      color: color ?? CODEUNIONColors.black,
      size: size ?? 14,
    );
  }
}
