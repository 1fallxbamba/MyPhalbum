import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'package:myphalbum/services/storage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: 'My Phalbum',
        styleTitle: GoogleFonts.rockSalt(
          color: Colors.white,
          fontSize: 25
        ),
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        styleDescription: GoogleFonts.montserratAlternates(
          color: Colors.white,
          fontSize: 30
        ),
        pathImage: "assets/images/logo_main.png",
        backgroundColor: Colors.green,
      ),
    );
    slides.add(
      Slide(
        title: "Some Text",
        styleTitle: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 25
        ),
        description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        styleDescription: GoogleFonts.montserratAlternates(
            color: Colors.white,
            fontSize: 30
        ),
        pathImage: "assets/images/logo_main.png",
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "Some other Text",
        styleTitle: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 25
        ),
        description: "It has survived not only five centuries, but also the leap into electronic typesetting.",
        styleDescription: GoogleFonts.montserratAlternates(
            color: Colors.white,
            fontSize: 30
        ),
        pathImage: "assets/images/logo_main.png",
        backgroundColor: const Color(0xff9932CC),
      ),
    );
  }

  void slideFinished() async {
    saveLocalData('sliderStatus', 'VIEWED');
    Navigator.popAndPushNamed(context, '/register');
  }

  Widget nextButton() {
    return const Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget skipButton() {
    return Text(
      "Passer",
      style: GoogleFonts.montserrat(
        color: Colors.white
      ),
    );
  }

  Widget doneButton() {
    return const Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      renderNextBtn: nextButton(),
      renderSkipBtn: skipButton(),
      renderDoneBtn: doneButton(),
      onDonePress: slideFinished,
    );
  }
}