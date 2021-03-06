import 'package:ac03/7maravilhas/animacao/text_slide_transition.dart';
import 'package:ac03/7maravilhas/animacao/text_tween_builder.dart';
import 'package:flutter/material.dart';

class FirstPageView extends StatefulWidget {
  const FirstPageView({Key? key}) : super(key: key);

  @override
  _FirstPageViewState createState() => _FirstPageViewState();
}

class _FirstPageViewState extends State<FirstPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> firstTextAnimation;
  late Animation<Offset> secondTextAnimation;
  late Animation<Offset> thirdTextAnimation;
  late Animation<Offset> fourthTextAnimation;
  late Animation<Offset> fifthTextAnimation;
  late Animation<Offset> sixthTextAnimation;

  final image = AssetImage('imagens/muralha.png');

  final buildTextSlideTransition = TextSlideTransitionImpl();


  void buildTextTweens() {
    final buildTextTween = TextTweenBuilderImpl();

    firstTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.0, 0.1),
    );

    secondTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.1, 0.2),
    );

    thirdTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.2, 0.3),
    );

    fourthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.3, 0.4),
    );

    fifthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.4, 0.5),
    );
  }


  List<Widget> firstTextGroup() {
    return [
      buildTextSlideTransition(
        position: firstTextAnimation,
        text: Strings.firstText,
      ),
    ];
  }


  List<Widget> secondTextGroup() {
    return [
      buildTextSlideTransition(
        position: secondTextAnimation,
        text: Strings.secondText,
      ),
      buildTextSlideTransition(
        position: thirdTextAnimation,
        text: Strings.thirdText,
      ),
      buildTextSlideTransition(
        position: fourthTextAnimation,
        text: Strings.fourthText,
      ),
      buildTextSlideTransition(
        position: fifthTextAnimation,
        text: Strings.fifthText,
      ),
    ];
  }

  void initAnimationController() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );
  }

  @override
  void initState() {
    initAnimationController();
    buildTextTweens();
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: firstTextGroup(),
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: secondTextGroup(),
              )
            ],
          ),
        )
      ],
    );
  }
}


class Strings {
  static final firstText =  "Grande Muralha da China";
  static final secondText = "Fortifica????o feita para proteger";
  static final thirdText =  "o Imp??rio Chin??s de invas??es.";
  static final fourthText = "Foi constru??da entre os anos";
  static final fifthText =  "220 e 206 a.C.";
}
