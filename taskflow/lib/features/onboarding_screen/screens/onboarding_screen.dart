import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskflow/common/buttons/custom_continue_button.dart';
import 'package:taskflow/constants/Pallete.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class OnBoard {
  final String image, title, description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> data = [
  OnBoard(
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVyaRJGo3Vm-m78De42-NPI2MMCD4Wt6tptQ&usqp=CAU",
      title: "Organizations -> connections become easy!",
      description: "You can join/create organizations effectively."),
  OnBoard(
      image:
          "https://images.unsplash.com/photo-1586281380117-5a60ae2050cc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHRhc2tzfGVufDB8fDB8fHww",
      title: "Tasks become friends!",
      description:
          "Your tasks become your friends, kill tasks with simplicity!"),
  OnBoard(
      image:
          "https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dGVhbXxlbnwwfHwwfHx8MA%3D%3D",
      title: "Team work does the dream work!",
      description: "Connect with your team, do work in real time and done!"),
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Background gradient
        decoration: BoxDecoration(
          color: Pallete().bgColor,
        ),
        child: Column(
          children: [
            // Carousel area
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: data[index].title,
                  description: data[index].description,
                  image: data[index].image,
                ),
              ),
            ),
            // Indicator area
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Privacy policy area
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("By proceeding you agree to our Privacy Policy."),
              ],
            ),
            // White space
            const SizedBox(
              height: 16,
            ),
            // Button area
            CustomContinueButton(
                bgColor: Pallete().buttonColor,
                onTap: () {},
                text: "Continue",
                textColor: Pallete().buttonTextColor),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Spacer(),
        Image.network(image),
        const Spacer(),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 191, 158, 158),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        border: isActive ? null : Border.all(color: Colors.blue),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
