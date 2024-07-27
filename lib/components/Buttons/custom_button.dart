// Imports
import 'package:flutter/material.dart';

// Components

// Images

// Styles

class CustomButton extends StatelessWidget {
  // Properties
  final String text;
  final bool isLoading;
  final String loadingType;
  final String loadingTypeValor;
  final VoidCallback? onPressed;
  final Map<String, dynamic> style;

  // Constructor
  const CustomButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.loadingType,
    required this.loadingTypeValor,
    required this.onPressed,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Style values
    final double width = style['width']?.toDouble() ?? 0.0;
    final double height = style['height']?.toDouble() ?? 0.0;
    final Color backgroundColor = style['backgroundColor'] ?? Colors.transparent;
    final double borderWidth = style['borderWidth']?.toDouble() ?? 0.0;
    final double borderRadius = style['borderRadius']?.toDouble() ?? 0.0;
    final Color borderColor = style['borderColor'] ?? Colors.transparent;
    final double fontSize = style['fontSize']?.toDouble() ?? 0.0;
    final Color fontColor = style['textColor'] ?? Colors.black;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (isLoading && loadingType == loadingTypeValor)
          ? null
          : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        ),
        child: isLoading
          ? const Text("loading")
          : Text(
              text,
              // style: Theme.of(context).textTheme.fontStyle?.copyWith(
              //   fontSize: fontSize,
              //   color: fontColor,
              // )
              style: TextStyle(
                // fontFamily: ,
                // fontWeight: ,
                fontSize: fontSize,
                color: fontColor,
              )
            ),
      ),
    );
  }
}