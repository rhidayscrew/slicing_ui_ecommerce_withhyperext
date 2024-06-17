import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/profile_view.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;

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

  List menuItems = [
    {
      "label": "Edit Profile",
      "view": const EditProfileView(),
    },
    {
      "label": "Change Password",
      "view": const ChangePasswordView(),
    },
    {
      "label": "Settings",
      "view": const EditProfileView(),
    },
    {
      "label": "Help",
      "view": const EditProfileView(),
    },
    {
      "label": "FAQ",
      "view": const EditProfileView(),
    },
    {
      "label": "Privacy Polcy",
      "view": const EditProfileView(),
    },
    {
      "label": "TOS",
      "view": const EditProfileView(),
    },
    {
      "label": "Log out",
      "view": const EditProfileView(),
    },
  ];
}
