// lib/presentation/custom_button.dart
import 'package:flutter/material.dart';

enum IconPosition { top, left }

class CustomPressedInButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSmall;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final IconPosition iconPosition;

  const CustomPressedInButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isSmall = false,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    required this.iconPosition,
  });

  @override
  CustomPressedInButtonState createState() => CustomPressedInButtonState();
}

class CustomPressedInButtonState extends State<CustomPressedInButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onPressed();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.isSmall ? 120 : MediaQuery.of(context).size.width * 0.8,
        height: widget.isSmall ? 40 : 60,
        decoration: BoxDecoration(
          color: widget.backgroundColor ??
              const Color(0xFF36393B), // Tamna siva pozadina
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6), // Unutrašnja sjena
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2), // Svjetlija sjena
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Vanjska sjena
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2), // Svjetlija sjena
                    offset: const Offset(-4, -4),
                    blurRadius: 10,
                  ),
                ],
          border: Border.all(
              color: widget.textColor ?? Colors.grey, // Siva boja obruba
              width: 2),
        ),
        child: widget.iconPosition == IconPosition.left
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget.icon,
                      color: widget.iconColor ?? Colors.blue, // Plava ikona
                      size: widget.isSmall ? 16 : 24,
                    ),
                    SizedBox(
                      width: widget.isSmall
                          ? 10
                          : 40, // Razmak između ikone i teksta
                    ),
                    Text(
                      widget.label,
                      style: TextStyle(
                        color:
                            widget.textColor ?? Colors.grey, // Siva boja teksta
                        fontSize: widget.fontSize ?? 16,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.iconColor ?? Colors.blue, // Plava ikona
                    size: widget.isSmall ? 16 : 24,
                  ),
                  SizedBox(
                    height:
                        widget.isSmall ? 3 : 8, // Razmak između ikone i teksta
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color:
                          widget.textColor ?? Colors.grey, // Siva boja teksta
                      fontSize: widget.fontSize ?? 16,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
