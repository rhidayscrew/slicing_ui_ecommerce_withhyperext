import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/module/cart/widget/cart_product_grid_item.dart';
import 'package:slicing_ui_one/module/cart/widget/cart_product_list_item.dart';
import '../controller/cart_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  Widget build(context, CartController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blueGrey[900],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text("Sory By"),
                          ),
                          Icon(
                            Icons.sort,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text("Filter"),
                          ),
                          Icon(
                            Icons.tune,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                ),
                IconButton(
                  // method ketika di klik icon berubag menjadi gridmode
                  onPressed: () => controller.updateMode(),
                  icon: Icon(
                    controller.gridMode ? Icons.grid_3x3 : Icons.list,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),

            // 4 add listview builder, hapus SingleChildScrollView agar bisa scrol dan serch nya diam diatas, tambahaakan Expanded(kursor focus ke ListView )
            if (controller.gridMode == false)
              Expanded(
                child: ListView.builder(
                  itemCount: controller.products
                      .length, // 9.1 add controller.products.length unutk memunculkan data dari controler
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller
                        .products[index]; // 9.2 add ini dari controler
                    // 5 change card menjadi row, add conimage didalam []
                    return CartProductListItem(
                        item: item); // ada dari cart_product_list_item
                  },
                ),
              ),
            // disini gridMode nya
            if (controller.gridMode)
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0 / 1.6,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: controller.products.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.products[index];
                    return CartProductGridItem(
                        item: item); // ada dari cart_product_grid_item
                  },
                ),
              ),
          ],
        ),
      ),
      // add bottum disini
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Colors.grey[400]!,
            ),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Items",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "${controller.products.length}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total (Qty)",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "${controller.totalQty}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "${controller.total}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 12.0,
            ),
            QButton(
                label: "CheckOut",
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutView()),
                    )),
          ],
        ),
      ),
    );
  }

  @override
  State<CartView> createState() => CartController();
}
