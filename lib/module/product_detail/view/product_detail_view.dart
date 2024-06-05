import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:slicing_ui_one/core.dart';
import '../controller/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  final Map item;
  const ProductDetailView({
    super.key,
    required this.item,
  });

  Widget build(context, ProductDetailController controller) {
    controller.view = this;
    return Scaffold(
      // 3 add circel_icon
      // 4 add ini untuk gambar naik keatas ke app bar
      // 5 agar gambar naik keatas app bar
      // 6 agar gambar naik keatas app bar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          // 7 mengatur tombol back agar tranparan dan warna putih agar klo gambar hitam tetap kelihatan
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            // 9 kasih padding agar ke kiri sedikit
            backgroundColor: Colors.black.withOpacity(
                0.6), // 7 mengatur tombol back agar tranparan dan warna putih agar klo gambar hitam tetap kelihatan
            child: const BackButton(
              color: Colors.white,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //1  change ke colum : col+tab
        child: Column(
          children: [
            // 2 add conimage, buang radius nya
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item["photo"]), // 8 masukan item photo
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 10 add col+tab dan dikasih pading : p+alt
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // 11 add CrossAxisAlignment start
                children: [
                  Row(
                    children: [
                      // 11 texsb20
                      Expanded(
                        child: Text(
                          item["product_name"],
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // 11 texsb20
                      Text(
                        "\$${item["price"]}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  // 12 add text12
                  Text(
                    item["category"],
                    style: const TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  // 13 add row
                  Row(
                    // 14 add form rating sm
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 20.0,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const Spacer(),
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24.0,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  //15 add listile
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Description"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  //16
                  Text(
                    item["description"],
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: QButton(
                  label: "Wishlist",
                  color: disabledColor,
                  textColor: disabledTextColor,
                  onPressed: () {}),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: QButton(label: "Add to Cart", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<ProductDetailView> createState() => ProductDetailController();
}
