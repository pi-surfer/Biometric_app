import 'package:flutter/material.dart';

/*class Discount extends StatefulWidget {
  final AssetImage mainImage;
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final int validityDays;
  final bool isExpired = true;

  const Discount({
    Key? key,
    required this.mainImage,
    required this.title,
    required this.subtitle,
    this.validityDays = 0,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Discount();
}

class _Discount extends State<Discount> {

  bool isExpired = false;
  Timer validity = Timer(Duration(days: widget.validityDays), () { });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 6),
            blurRadius: 8,
          )
        ],
      ),
      child: Center(),
    );
  }
}

class QrCode extends StatefulWidget {
  final AssetImage qrImage;

  const QrCode({
    Key? key,
    required this.qrImage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrCode();
}

class _QrCode extends State<QrCode> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  double pageHeight = 600;
  double pageWidth = 390;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          alignment: Alignment.topCenter,
          scale: scaleAnimation,
          child: Container(
            height: pageHeight,
            width: pageWidth,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              /*border: Border.all(
                              width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Container(
                height: pageHeight * 3 / 10,
                width: pageWidth - 50,
                //margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.qrImage,
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  /*border: Border.all(
                                width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),*/
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/