import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/core/theme/theme_config.dart';
import 'package:slicing_ui_one/core/widget/button/button.dart';
import 'package:slicing_ui_one/core/widget/textfield/textfield.dart';
import '../controller/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  Widget build(context, RegisterController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true, //add center title true
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          // pakain SingleChildScrollView ini agar bisa di scroll pada saat keyboard muncul
          // klo pake spacher gak bisa pakai SingleChildScrollView, disini body: SingleChildScrollView( dihapus dgn cara ctrl+alt+shift+r

          padding: const EdgeInsets.all(
              30.0), // padding itu batas di samping keseluruhan
          width: MediaQuery.of(context).size.width, //add w100
          child: Column(
            children: [
              Image.asset(
                // add imagasst
                "asset/icon/icon.png",
                width: 120.0,
                height: 120.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                //add sh20
                height: 40.0,
              ),
              QTextfield(
                //add q_textfield pilih yg ini baru diubah ke Qtexfield
                label: "Full Name",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QTextfield(
                //add q_textfield pilih yg ini baru diubah ke Qtexfield
                label: "Name",
                onChanged: (value) {},
              ),
              const SizedBox(
                // add sh12
                height: 12.0,
              ),
              QTextfield(
                //add q_textfield pilih yg ini baru diubah ke Qtexfield
                label: "Password",
                onChanged: (value) {},
              ),
              const SizedBox(
                // add sh20
                height: 20.0,
              ),
              QButton(
                  label: "Create an Account", onPressed: () {}), //add QButton
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                // add richtext
                textAlign: TextAlign.center, // add textAlign - textAlign center
                text: TextSpan(
                  text: '',
                  style: const TextStyle(), // add atau ganti dng TextStyle
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By signing up, you agree to out \n',
                      style: TextStyle(
                        // add TextStyle - lalu masukan  color: disabledTextColor di dalam kurung TextStyle
                        color: disabledTextColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Term',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        // add TextStyle - lalu masukan  color: disabledTextColor di dalam kurung TextStyle
                        color: disabledTextColor,
                      ),
                    ),
                    TextSpan(
                      text: 'privacy',
                      style: TextStyle(
                          // add TextStyle - lalu masukan  color: disabledTextColor di dalam kurung TextStyle
                          fontWeight: FontWeight.bold, // add bold
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
      // add bottomNavigationBar, add container, add p20, di bungkus row, add maincenter
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              ),
              child: Text(
                "I have an account",
                style: TextStyle(
                  fontSize: 15.0,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
