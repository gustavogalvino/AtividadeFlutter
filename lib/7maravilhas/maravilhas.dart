import 'package:ac03/7maravilhas/primeira.dart';
import 'package:ac03/7maravilhas/segunda.dart';
import 'package:ac03/7maravilhas/terceira.dart';
import 'package:ac03/7maravilhas/quarta.dart';
import 'package:ac03/7maravilhas/quinta.dart';
import 'package:ac03/7maravilhas/sexta.dart';
import 'package:ac03/7maravilhas/setima.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';


class Maravilhas extends StatefulWidget {
  const Maravilhas({Key? key}) : super(key: key);

  @override
  _Maravilhas createState() => _Maravilhas();
}


class _Maravilhas extends State<Maravilhas> {
  final pages = [
    FirstPageView(),
    SecondPageView(),
    ThirdPageView(),
    FourthPageView(),
    FifthPageView(),
    SixthPageView(),
    SeventhPageView()
  ];


  final pageController = PageController();
  double? _currentPage = 0.0;

  final pageTransitionDuration = Duration(milliseconds: 300);

  final pageTransitionCurve = Curves.ease;


  void precacheImages() {
    precacheImage(AssetImage('imagens/muralha.png'), context);
    precacheImage(AssetImage('imagens/petra.png'), context);
    precacheImage(AssetImage('imagens/coliseu.png'), context);
    precacheImage(AssetImage('imagens/chichen.png'), context);
    precacheImage(AssetImage('imagens/cristo.png'), context);
    precacheImage(AssetImage('imagens/machupicchu.png'), context);
    precacheImage(AssetImage('imagens/tajmahal.png'), context);
  }


  void uiOverlaySettings() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
    ));
  }


  Widget backButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.white,
      onPressed: () {
        pageController.previousPage(
          duration: pageTransitionDuration,
          curve: pageTransitionCurve,
        );
      },
    );
  }

  Widget forwardButton() {
    return IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Colors.white,
      onPressed: () {
        pageController.nextPage(
          duration: pageTransitionDuration,
          curve: pageTransitionCurve,
        );
      },
    );
  }

  Widget continueButton() {
    return IconButton(
      icon: Icon(Icons.check),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Widget leftButton() {
    if (_currentPage == 0) {
      return Container(
        height:
        0,
      );
    } else {
      return backButton();
    }
  }

  Widget rightButton() {
    if ((_currentPage! > 5.1) && (_currentPage! <= 6.0)) {
      return continueButton();
    } else {
      return forwardButton();
    }
  }

  Widget navigatorWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Row(
          children: [
            leftButton(),
            Spacer(),
            rightButton(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      precacheImages();
    });

    uiOverlaySettings();

    super.initState();
  }


  @override
  void didChangeDependencies() {
    //precacheImages();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                pageController.addListener(() {
                  setState(() {
                    _currentPage = pageController.page;
                  });
                });
                return pages[index];
              }),
          navigatorWidget(),
        ],
      ),
    );
  }
}