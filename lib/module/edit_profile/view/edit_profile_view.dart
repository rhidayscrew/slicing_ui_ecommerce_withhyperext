import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/core/theme/theme_config.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  Widget build(context, EditProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("EditProfile"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 24,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 64.0,
                backgroundImage: const NetworkImage(
                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044979/nr7gt66alfhmu9vaxu2u.png",
                ),
                child: Stack(
                  children: [
                    // container di ubah menjadi Positioned
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 16.0,
                        backgroundColor: primaryColor,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              QTextfield(
                label: "Full Name",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QTextfield(
                label: "Name",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QTextfield(
                label: "Email",
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: QButton(label: "Update", onPressed: () {}),
      ),
    );
  }

  @override
  State<EditProfileView> createState() => EditProfileController();
}
