import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/order_detail_controller.dart';

class OrderDetailView extends StatefulWidget {
  final Map<String, dynamic> item;
  const OrderDetailView({
    super.key,
    required this.item,
  });

  Widget build(context, OrderDetailController controller) {
    controller.view = this;
    List productList = item["items"];

    return Scaffold(
      appBar: AppBar(
        title: Text("#${item["id"]}"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Cart Item",
                  )),
              ListView.builder(
                itemCount: productList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = productList[index];
                  double total = double.parse(item["qty"].toString()) *
                      double.parse(item["price"].toString());
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item["photo"] ??
                            "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                      ),
                    ),
                    title: Text(item["product_name"]),
                    subtitle:
                        Text("QTY: ${item["qty"]}  Price: \$${item["price"]} "),
                    trailing: Text("\$$total"),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CheckoutOption(
                title: "Shipeed Addres",
                subtitle1: "Rumah",
                subtitle2: "Jln xxx No 34",
              ),
              const CheckoutOption(
                title: "Shipeed Method",
                subtitle1: "JNE - YES",
              ),
              const CheckoutOption(
                title: "Payment",
                subtitle1: "MasterCard **** 2342 ****",
              ),
              const CheckoutOption(
                title: "Promo Code",
                subtitle1: "No promo code",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          width: 1.0,
          color: Colors.grey[400]!,
        ))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subtotal : \$24",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Shipping: \$27",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Tax: 10%",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Promo Code: 50%",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          "\$109",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 20.0,
              ),
              QButton(label: "Print", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<OrderDetailView> createState() => OrderDetailController();
}
