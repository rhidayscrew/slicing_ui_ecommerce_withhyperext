
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/order_detail_view.dart';

class OrderDetailController extends State<OrderDetailView> {
  static late OrderDetailController instance;
  late OrderDetailView view;

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
    