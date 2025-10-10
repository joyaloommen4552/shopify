import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/CustomClass/screen_config.dart';
import 'package:shopify/Screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentpage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentpage == 0 || _currentpage == 1) {
        _controller.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      } else {
        timer.cancel();
        Future.delayed(Duration(seconds: 4), () {
          if (mounted) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
            child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentpage = index;
            });
          },
          children: [
            SlidingWidget(
                image: "assets/images/splash1.png",
                title: "Get groceries at your doorstep",
                subtitle:
                    "Order from anywhere, and we’ll deliver your groceries quickly and safely to your home."),
            SlidingWidget(
              image: "assets/images/splash2.png",
              title: "Save time, save money",
              subtitle:
                  "Shop smarter with exclusive deals, fresh products, and fast delivery at your convenience.",
            ),
            SlidingWidget(
              image: "assets/images/splash3.png",
              title: "Fresh Items With fast delivery grocery",
              subtitle:
                  "We try our best to make sure our customers are happy with fresh grocery items.",
            )
          ],
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 20,
                  activeDotColor: Colors.green,
                  dotColor: const Color(0xFFC8C6C6)),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                if (_currentpage == 0 || _currentpage == 1) {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(ScreenConfig.width * 0.75,
                      ScreenConfig.height * 0.05625),
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                _currentpage == 2 ? "Get Start" : "Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    )));
  }
}

class SlidingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const SlidingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 30,
          // ),
          Image.asset(
            image,
            height: 300,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }
}
