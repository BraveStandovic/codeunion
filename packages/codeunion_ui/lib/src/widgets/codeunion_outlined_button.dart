import 'package:codeunion_ui/codeunion_ui.dart';
import 'package:flutter/material.dart';

class CODEUNIONOutlinedButton extends StatelessWidget {
  const CODEUNIONOutlinedButton({
    super.key,
    this.backgroundColor,
    this.darkBackgroundColor,
    required this.text,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
    this.shape = const StadiumBorder(),
  });

  /// Primary button which background color is the primary color of the theme
  const CODEUNIONOutlinedButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.shape = const StadiumBorder(),
  })  : backgroundColor = CODEUNIONColors.lightBlue200,
        darkBackgroundColor = CODEUNIONColors.purple,
        borderColor = CODEUNIONColors.white,
        textColor = CODEUNIONColors.black;

  /// Secondary button which background color is the secondary color of the theme
  const CODEUNIONOutlinedButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.shape = const StadiumBorder(),
  })  : backgroundColor = CODEUNIONColors.grey,
        darkBackgroundColor = CODEUNIONColors.grey,
        borderColor = CODEUNIONColors.white,
        textColor = CODEUNIONColors.white;

  /// Text on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Background color of the button in dark mode
  final Color? darkBackgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border color of the button
  final Color? borderColor;

  /// Icon on the button
  final Widget? icon;

  // Method that constructs an outlined button [ButtonStyle] given simple values.
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    final isInactive = onPressed == null;
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: shape,
        disabledBackgroundColor: theme.colorScheme.background,
        backgroundColor: backgroundColor,
        side: borderColor == null
            ? null
            : BorderSide(
                color: onPressed == null
                    ? (theme.colorScheme.onBackground)
                    : borderColor!,
              ),
        padding: const EdgeInsets.symmetric(
          horizontal: CODEUNIONSpacing.md,
          vertical: CODEUNIONSpacing.md,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          SizedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: CODEUNIONTextStyle.button.copyWith(
                color:
                    isInactive ? (theme.colorScheme.onBackground) : textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
