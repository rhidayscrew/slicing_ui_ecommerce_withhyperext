import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/cart_view.dart';

class CartController extends State<CartView> {
  static late CartController instance;
  late CartView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "photo":
          "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045560/mq2o8cqtmvaobrnil7xi.png",
      "product_name": "Frenzy Pizza",
      "price": 25,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 20,
      "qty": 2,
      "is_favorite": false,
    },
    {
      "id": 2,
      "photo":
          "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045565/cvx59ia4kvqj2ratfkjs.png",
      "product_name": "Beef Burger",
      "price": 22,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 18,
      "qty": 4,
      "is_favorite": true,
    },
    {
      "id": 3,
      "photo":
          "https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "product_name": "Seperait",
      "price": 33,
      "category": "Drink",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 28,
      "qty": 9,
      "is_favorite": false,
    },
    {
      "id": 4,
      "photo":
          "https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      "product_name": "Fried Rice",
      "price": 31,
      "category": "Food",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "discount_price": 25,
      "qty": 5,
      "is_favorite": true,
    },
  ];
// Logic membuat plus minus bisa di klik
  increaseQty(Map item) {
    item["qty"]++;
    setState(() {});
  }

  decreaseQty(Map item) {
    if (item["qty"] == 0) return; // logick agar tidak minus angka nya
    {
      item["qty"]--;
    }
    setState(() {});
  }

  double get total {
    double productsTotal = 0;
    for (var item in products) {
      // diconvert dulu kedoble
      productsTotal += double.parse(item["qty"].toString()) *
          double.parse(item["price"].toString());
    }
    return productsTotal;
  }

  double get totalQty {
    double total = 0;
    for (var item in products) {
      total += item["qty"];
    }
    return total;
  }
}
