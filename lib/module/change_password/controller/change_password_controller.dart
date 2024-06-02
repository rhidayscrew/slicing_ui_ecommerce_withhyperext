
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/change_password_view.dart';

class ChangePasswordController extends State<ChangePasswordView> {
  static late ChangePasswordController instance;
  late ChangePasswordView view;

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
    