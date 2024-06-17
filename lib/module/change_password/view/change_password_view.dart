import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  Widget build(context, ChangePasswordController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangePassword"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextfield(
                label: "Email",
                onChanged: (value) => () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              QTextfield(
                label: "Password",
                onChanged: (value) => () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              QButton(
                  label: "Change Password",
                  onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardView()),
                      ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ChangePasswordView> createState() => ChangePasswordController();
}
