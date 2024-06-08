import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/checkout_controller.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  Widget build(context, CheckoutController controller) {
    controller.view = this;
    final cartController = CartController
        .instance; //1 add code ini unutk mengambil data product sebelum nya
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Cart Item",
                )),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.products.length,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = cartController.products[index];
                  double total = double.parse(item["qty"].toString()) *
                      double.parse(item["price"].toString());
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item["photo"],
                      ),
                    ),
                    title: const Text("product_name"),
                    subtitle:
                        Text("QTY: ${item["qty"]}  Price: \$${item["price"]} "),
                    trailing: Text("\$$total"),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Shipping Address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Rumah"),
              subtitle: Text("Jln xxx no 14"),
              trailing: Icon(
                Icons.chevron_right,
                size: 24.0,
              ),
            ),
            const Divider(),
            const Text(
              "Shipping Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Credit Card"),
              subtitle: Text("City Bank"),
              trailing: Icon(
                Icons.chevron_right,
                size: 24.0,
              ),
            ),
            const Divider(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  State<CheckoutView> createState() => CheckoutController();
}
