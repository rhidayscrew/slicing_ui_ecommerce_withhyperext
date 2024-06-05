import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  Widget build(context, ProfileController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //1 add circrl_image
              const CircleAvatar(
                radius: 64.0,
                backgroundImage: NetworkImage(
                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044979/nr7gt66alfhmu9vaxu2u.png",
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              const Text(
                "Screw",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              const Text(
                "UI/UX Designer at UXX Store",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),

              // list_tile_row
              const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("OTHER INFORMATION"),
              ),

              for (var item in controller.menuItems)
                //bisa pakai listviewbuilder
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(item["label"]),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: 24.0,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (item["view"])),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
