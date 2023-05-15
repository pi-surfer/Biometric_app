import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//import 'package:progetto/widgets/custom_plot.dart';
//import 'package:intl/intl.dart';



class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final int gdp;
}

class finalOBIETTIVI{
  finalOBIETTIVI(this.crediti, this.value);
  final String crediti;
  final double value;
}

class day {
  // this class models the single heart rate data point

  late final DateTime date;
  late final int value;
}

class Activity extends StatefulWidget {
  static const route = '/activity/';
  static const routeDisplayName = 'Activity';
 
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => ActivityState();
}

List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.mapMarkerOutline),
      label: 'Activity',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.tractor),
      label: 'Firm',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.homeOutline),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.humanQueue),
      label: 'Partner',
    ),
    const BottomNavigationBarItem(
      icon: Icon(MdiIcons.shoppingOutline),
      label: 'Promo',
    ),
  ];

class ActivityState extends State<Activity> {
   late List<GDPData> _chartData;
   late TooltipBehavior _tooltipBehavior;
   late List<finalOBIETTIVI> _chartData1;


   @override
  void initState(){
    _chartData = getChartData();
    _chartData1 = getChartData1();
    _tooltipBehavior = TooltipBehavior(enable: true);
    
    super.initState();
  }

  
  
  DateTime day = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    
    
    
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 173, 254, 178),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 6, 95, 9),
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          title: const Text('Your Activity', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Profile()));
                  */},
                  
                  icon: const Icon(
                    MdiIcons.circleBox,
                    size: 40,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                      IconButton(
                        icon: const Icon(Icons.navigate_before, color: Color.fromARGB(255, 6, 95, 9),size:20,),
                        onPressed: () {
                          setState(() {
                            day = day.subtract(const Duration(days: 1));
                            });
                          }),
                        Text(DateFormat('dd MM yyyy').format(day), style: const TextStyle(
                          color: Color.fromARGB(255, 6, 95, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          )
                        ),
                      IconButton(
                        icon: const Icon(Icons.navigate_next, color: Color.fromARGB(255, 6, 95, 9),size: 20, ),
                        onPressed: () {
                          setState(() {
                            day = day.add(const Duration(days: 1));
                            });
                            }),],),

                      const SizedBox(
                        height: 20,
                        ),

                    TextButton.icon(
                      onPressed: () {  },
                      icon: const Icon(MdiIcons.reload, size: 18, color: Color.fromARGB(255,255,255,255)),
                      label: const Text("UPDATE YOUR DATA", style: TextStyle(color: Color.fromARGB(255,255,255,255), fontSize: 16)), 
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28.0),
                            ),
                          ),
                        backgroundColor:const Color.fromARGB(255, 11, 87, 14),
                        )

                    ),
                    
                    const SizedBox(
                      height: 20,
                      ),
                    
                    SfCircularChart(
                      legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap, position:LegendPosition.bottom, 
                      textStyle: const TextStyle(fontSize: 13)),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        RadialBarSeries<GDPData,String>(
                        dataSource: _chartData,
                        
                        xValueMapper: (GDPData data,_) => data.continent,
                        yValueMapper: (GDPData data,_) => data.gdp,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                        maximumValue: 10000
                      )
                    ]),
                
                
                    const SizedBox(
                      height: 20,
                      ),

                    const Text('Oggi hai guadagnato N crediti', style: TextStyle(
                          color: Color.fromARGB(255, 6, 95, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          ),) ,

                    const SizedBox(
                      height: 20,
                      ),

                              

                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      child: SfCircularChart(
                      
                      //textStyle: const TextStyle(fontSize: 13)),
                      //tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        RadialBarSeries<finalOBIETTIVI,String>(
                        pointColorMapper: (finalOBIETTIVI,_) => const Color.fromARGB(255, 10, 159, 12),
                        dataSource: _chartData1,
                        xValueMapper: (finalOBIETTIVI value,_) => value.crediti,
                        yValueMapper: (finalOBIETTIVI value,_) => value.value,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                        maximumValue: 300,
                        
                      )
                    ] 
                    ),

                    ),

                    


                    const SizedBox(
                      height: 15,
                      ),

                    const Text('ti mancano ancora X punti per finanziare',textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromARGB(255, 6, 95, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          ),) ,
                    
                    const Text('LE API DI DARIO',textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromARGB(255, 6, 95, 9),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          ),) ,

                    const SizedBox(
                      height: 20,
                      ),
                    
                ],),),),),
                
    
      

                  bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255,255,255,255),
              fixedColor:  const Color.fromARGB(255, 6, 95, 9),
              items: navBarItems,
              //currentIndex: _selIdx,
              //onTap: _onItemTapped,
                  ),);}
          

                  List<GDPData> getChartData(){
              final List<GDPData> chartData=[
                GDPData('Run', 1600),
                GDPData('Walk', 2490),
                GDPData('Bike', 2900)
              ];
              return chartData;}
            
              List<finalOBIETTIVI> getChartData1(){
                final List<finalOBIETTIVI> chartData1=[
                  finalOBIETTIVI('Crediti', 180),
                ];
                return chartData1;
              }
                  
                   
            
  } //build
 //Page

 