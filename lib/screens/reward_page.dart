import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//import 'package:app_project/screens/login_page.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {

 final _pageController = PageController(viewportFraction: 0.8);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 228),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.green),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.green),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 6),
                          blurRadius: 8,)],
                      ),
                      child: Center(child: Text('Page $index'),),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
