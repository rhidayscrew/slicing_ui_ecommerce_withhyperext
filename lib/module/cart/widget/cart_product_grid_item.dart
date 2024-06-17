// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/module/cart/controller/cart_controller.dart';

class CartProductGridItem extends StatelessWidget {
  // 1 add row() dari list view
  // 2 add final Map item;  dan required this.item
  final Map item;
  const CartProductGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller =
        CartController.instance; // 3 add ini untuk acces file cart_controller
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item["photo"],
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              // add child stack, lalu children[circle_icon]
              child: const Stack(
                children: [
                  // add dibungkus Positioned, alt+c diubah kePositioned
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            item["product_name"],
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item["category"],
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
          Text(
            "\$${item["price"]}",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => controller.increaseQty(item),
                icon: const Icon(
                  MdiIcons.plusBox,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 20,
                height: 40,
                child: Center(
                  child: Text(
                    "${item["qty"]}", // controler map 1
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                // add controler map 3 onPressed: () => controller.decreaseQty(item),
                onPressed: () => controller.decreaseQty(item),
                icon: const Icon(
                  // controler map 2. ubah menjadi iccon button
                  MdiIcons.minusBox,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
