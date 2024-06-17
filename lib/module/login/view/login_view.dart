import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/core/theme/theme_config.dart';
import 'package:slicing_ui_one/core/widget/button/button.dart';
import 'package:slicing_ui_one/core/widget/textfield/textfield.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      body: SafeArea(
        //hapus appbar, wrap center diganti SafeArea
        //hapus SingleChildScrollView, ctrl+alt+shift+r
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // tambahkan crostart
            children: [
              Row(
                // tambahakan row
                children: [
                  const Expanded(
                    //tambahakan expended dgn cara, kursor focus ke colum lalu Alt+e dan save
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // add crostar
                      children: [
                        Text(
                          //add text30
                          "welcome",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          //add text26
                          "to Magic Book",
                          style: TextStyle(
                            fontSize: 26.0,
                          ),
                        ),
                        Text(
                          //add text14
                          "write less do more",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    // add imgasst
                    "asset/icon/icon.png",
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const Spacer(), //add Spacer
              // add textfield email( nanti muncul nya container yg di bawah ini banyak code default,disini di edit lagi karena beda form)
              Container(
                padding: const EdgeInsets.all(16),
                // add decoration - Boxdecoration di dalam (ketik: radius12)
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: disabledColor,
                ),
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                    //add collapsed
                    hintText: 'Email', // ganti dgn hinttext
                    hintStyle: TextStyle(
                      color: secondaryTextColor,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                // add sh20
                height: 20.0,
              ),
              Qtextfield(
                label: "Password",
                prefixIcon: Icons.add,
                suffixIcon: Icons.visibility,
                onSubmitted: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold, // add bold
                    color: primaryColor),
              ),
              const Spacer(),
              QButton(label: "Sign Up", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
