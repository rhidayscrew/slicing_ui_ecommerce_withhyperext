
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/checkout_view.dart';

class CheckoutController extends State<CheckoutView> {
  static late CheckoutController instance;
  late CheckoutView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    