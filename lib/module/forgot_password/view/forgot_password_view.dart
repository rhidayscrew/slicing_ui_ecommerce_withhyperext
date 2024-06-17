import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  Widget build(context, ForgotPasswordController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        // leading: Container(), // hapus tombol back di atas
        // leadingWidth: 0.0, // hapus tombol back di atas
        title: const Text("Forgot Password"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              QTextfield(
                label: "email",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              QButton(label: "save", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ForgotPasswordView> createState() => ForgotPasswordController();
}
