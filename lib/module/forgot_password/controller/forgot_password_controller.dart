
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/forgot_password_view.dart';

class ForgotPasswordController extends State<ForgotPasswordView> {
  static late ForgotPasswordController instance;
  late ForgotPasswordView view;

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
    