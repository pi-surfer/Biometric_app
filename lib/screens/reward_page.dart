import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//import 'package:app_project/screens/login_page.dart';

final assets = [
    // lista path assets
];

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  color: Colors.red,
                  //decoration: BoxDecoration(),
                  child: Center(child: Text('Page $index'),),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}



class _VideoScreenState extends State<VideosScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}



class VideoCard extends StatelessWidget {

  final String assetPath;

  const VideoCard({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return const Card();
  }

}