import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/product_list_controller.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  Widget build(context, ProductListController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        // 7 add title dibungkus dgb colum
        title: const Column(
          children: [
            //8 add texb16
            Text(
              "Flash Sale",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            //9 add text12
            Text(
              "13.4K Item",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //2 add row
              Row(
                children: [
                  //3 add button_row_icon
                  Expanded(
                    //4 kursore di Sizebox, dibungkus expanded : alt+e
                    child: SizedBox(
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          //5 add shaperpudedredtangradius 8
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
                  // 6 add copy expanded yg diatas di baawah ini lanjutan nya
                  Expanded(
                    //4 kursore di Sizebox, dibungkus expanded : alt+e
                    child: SizedBox(
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          //5 add shaperpudedredtangradius 8
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
                ],
              ),
              // 7 add Jarak sh12
              const SizedBox(
                height: 12.0,
              ),
              // 1 add grid2
              GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0 / 1.4, // 13 edit menjadi ini
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: controller.products
                    .length, // 10 add controller.products.length untuk mengkonsum
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.products[
                      index]; // 11 add   var item = controller.products[index]; untuk mengkonsum controler
                  return Container(
                    decoration: BoxDecoration(
                      // 14 add radius 8
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      // 12 add decoration - box decoration
                      // 13 add decorationimage
                      image: DecorationImage(
                        image: NetworkImage(
                          item["photo"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        //19 add con+tab, dibawah children
                        Container(
                          decoration: const BoxDecoration(
                            // color: Colors.black
                            //     .withOpacity(0.4), // 20 add withOpacity(0.4)
                            // atau bisa pake gradient
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black54,
                                Colors.black45,
                                Colors.black38,
                                Colors.black26,
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 8,
                          top: 8,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16.0,
                            ),
                          ),
                        ),
                        // 16 add colum, colum dibungkus container diganti sizebox
                        Container(
                          //21  ganti jadi container
                          padding:
                              const EdgeInsets.all(12.0), // 22 add pading12
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            // 17 add MainAxisAlignment.end
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // 18 add texb16, tex12, texb16
                              Text(
                                item[
                                    "product_name"], // 21 add konsume controler
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                item["category"],
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${item["price"]}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
