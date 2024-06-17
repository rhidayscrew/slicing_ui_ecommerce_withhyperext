import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          // add row and image_aset
          children: [
            Image.asset(
              "asset/icon/icon.png",
              width: 32.0,
              height: 32.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 4.0,
            ),
            const Text(
              "E-Stores",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartView()),
              ),
              child: const Badge(
                label: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(10.0), pengen ada jarak paading nya di setipa sisi edit ini
        // remove unecesy Container, kuros ke Container
        child: Column(
          children: [
            //add carousel
            Builder(builder: (context) {
              List images = [
                "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
              ];

              return CarouselSlider(
                options: CarouselOptions(
                  height: 90.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            // add col+tab, kasih padding, kursor focus ke colum : alt +p
            // paste code yg tadi di edit ulang padding nya dari awal
            // edit padding dari awal
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // jangan lupa di kasih crostart
                children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero, // add hilangkan padding
                    title: Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100.00, // add widt 100.00
                      // klo menggunkana trailing : row dibungkus container: alt +c, kursor di row
                      child: Row(
                        // bisa juga memakai wrap,hps sizebox
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 0.3, // atur ini aspecratio
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: controller
                        .categories.length, // add ini untuk konsumsi controler
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.categories[
                          index]; // add ini untuk konsumsi controler
                      return Container(
                        //add decoration, color, radius
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            // add padding row nya : alt+p jadi nya seperti di atas
                            children: [
                              Expanded(
                                child: Text(
                                  // text dikasih expanded agar icon kedorong
                                  item, // masuk disini dari konsumi controler nya
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductListView()),
                    ),
                    contentPadding: EdgeInsets.zero, // add hilangkan padding
                    title: const Text(
                      "Flash sale",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const SizedBox(
                      width: 100.00, // add widt 100.00
                      // klo menggunkana trailing : row dibungkus container: alt +c, kursor di row
                      child: Row(
                        // bisa juga memakai wrap,hps sizebox
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // add grid2
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0 / 1.6, // edit
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: controller.products
                        .length, // konsumsi controler dengan datadumy, PERTAMA EDIT ini
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.products[
                          index]; // KEDUA masukan ini konsumsi controler
                      return InkWell(
                        // umutk modul product detail container ganti InkWell
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailView(
                                    item:
                                        item, // DISINI BERHUBUNGAN LANGSUNG DGN ProductDetailView DI MAP, AGAR BISA DITERUSKAN KEHALAMAN BERIKUT NYA
                                  )),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // crossAxisAlignment start
                          children: [
                            //add conimage
                            Expanded(
                              child: Container(
                                // Container dikasih Expanded
                                height: 160.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      item["photo"], //KETIGA tangkap Item nya
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: const Stack(
                                  // add child stack, circle_icon, children, positioned
                                  children: [
                                    Positioned(
                                      right: 6,
                                      top: 6,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              item[
                                  "product_name"], // konsumsi ini controler nya
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
                              "\$${item["price"]}", //yg ini pake string
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
