import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/intro_view.dart';

class IntroController extends State<IntroView> {
  static late IntroController instance;
  late IntroView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
}
