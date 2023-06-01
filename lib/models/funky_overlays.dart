import 'package:flutter/material.dart';

class FunkyOverlayYourProject extends StatefulWidget {
  const FunkyOverlayYourProject({super.key});

  @override
  State<StatefulWidget> createState() => _FunkyOverlayYourProject();
}

class _FunkyOverlayYourProject extends State<FunkyOverlayYourProject>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
            height: 500,
            width: 350,
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
              padding: const EdgeInsets.only(top: 20,left: 25, right: 25),
              child: Column(children: [
                Container(
                  height: 150.0,
                  width: 300.0,
                  //margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/arnie.png'),
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LoremIpsum',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          SizedBox(height: 5),
                          Text('The way of the bees',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                        ],
                      ),
                      SizedBox(width: 100),
                      Icon(Icons.info),
                    ],
                  ),
                SizedBox(height: 30,),
                Text('Tityre, tu patulae recubans sub tegmine fagi silvestrem tenui Musam meditaris avena; nos patriae finis et dulcia linquimus arva. nos patriam fugimus; tu, Tityre, lentus in umbra formosam resonare doces Amaryllida silvas.')
                ]),
              )]),
            ),
          ),
        ),
      ),
    );
  }
}

class FunkyOverlayWeeklyProject extends StatefulWidget {
  const FunkyOverlayWeeklyProject({super.key});

  @override
  State<StatefulWidget> createState() => _FunkyOverlayWeeklyProject();
}

class _FunkyOverlayWeeklyProject extends State<FunkyOverlayWeeklyProject>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
            height: 500,
            width: 350,
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
              padding: const EdgeInsets.all(50.0),
              child: Text("Daje Roma Daje!"),
            ),
          ),
        ),
      ),
    );
  }
}

class FunkyOverlayWeeklyPartner extends StatefulWidget {
  const FunkyOverlayWeeklyPartner({super.key});

  @override
  State<StatefulWidget> createState() => _FunkyOverlayWeeklyPartner();
}

class _FunkyOverlayWeeklyPartner extends State<FunkyOverlayWeeklyPartner>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
            height: 500,
            width: 350,
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
              padding: const EdgeInsets.all(50.0),
              child: Text("Enzomma!"),
            ),
          ),
        ),
      ),
    );
  }
}
