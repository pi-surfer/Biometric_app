import 'package:flutter/material.dart';
import 'package:app_project/widgets/borders.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.title,
    required this.onPressed,
    width = 150,
    this.height = 49,
    this.elevation = 1,
    this.borderRadius = 24,
    this.color = const Color.fromARGB(255, 254, 251, 228),
    this.borderSide = Borders.defaultPrimaryBorder,
    required this.textStyle,
    //this.icon,
    this.hasIcon = false,
  });

  final VoidCallback onPressed;
//  final double width;
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;
  //final Widget icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      minWidth: MediaQuery.of(context).size.width*0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),

      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //hasIcon ? icon : Container(),
          hasIcon ? const SizedBox(width: 8) : Container(),
          title != null
              ? Text(
                  title,
                  style: textStyle,
                )
              : Container(),
        ],
      ),
    );
  }
}