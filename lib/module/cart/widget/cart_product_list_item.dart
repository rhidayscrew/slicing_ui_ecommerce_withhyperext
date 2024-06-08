// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:slicing_ui_one/module/cart/controller/cart_controller.dart';

class CartProductListItem extends StatelessWidget {
  // 1 add row() dari list view
  // 2 add final Map item;  dan required this.item
  final Map item;
  const CartProductListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller =
        CartController.instance; // 3 add ini untuk acces file cart_controller
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64.0,
          width: 64, // 6 add width
          // 7 add mb12
          margin: const EdgeInsets.only(
            bottom: 12.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                item["photo"], // 9.3 add ini item["photo"],
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        // 8 add textb
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //    "${item["product_name"]}${item["product_name"]}",
                "${item["product_name"]}",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item["category"], // 9.3 add ini item["photo"],
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
            ],
          ),
        ),
        Wrap(
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
    );
  }
}
