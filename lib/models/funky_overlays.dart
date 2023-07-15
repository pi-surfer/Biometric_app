import 'package:flutter/material.dart';

class FunkyOverlay extends StatefulWidget {
  final AssetImage mainImage;
  final String title;
  final String subtitle;
  final String body;
  final bool isSelectable;
  final bool isSelected;

  const FunkyOverlay({
    Key? key,
    required this.mainImage,
    required this.title,
    required this.subtitle,
    required this.body,
    this.isSelected = false,
    this.isSelectable = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FunkyOverlay();
}

class _FunkyOverlay extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
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
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(children: [
                Container(
                  height: pageHeight * 3 / 10,
                  width: pageWidth - 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.mainImage,
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            SizedBox(height: 5),
                            Text(widget.subtitle,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(widget.body)
                  ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
