import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import '../view/order_list_view.dart';

class OrderListController extends State<OrderListView> {
  static late OrderListController instance;
  late OrderListView view;

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

  List<Map<String, dynamic>> orderList = [
    {
      "id": 124,
      "created_at": "2023-08-26 11:00:00",
      "shipping_address": {
        "name": "John Doe",
        "detail": "Jalan Merdeka NO 45 Kota XYZ",
      },
      "courier": {
        "name": "Pos Indonesia",
        "detail": "Express Shipping",
      },
      "payment_method": {
        "name": "Bank Transfer",
        "detail": "Mandiri ending in  1234",
      },
      "items": [
        {"id": 11, "product_name": "Speaker", "qty": 1, "price": 300.0},
        {"id": 12, "product_name": "Headphone", "qty": 3, "price": 150.0},
        {"id": 13, "product_name": "Mouse", "qty": 5, "price": 50.0},
      ],
      "total": 950.0,
      "status": "Shipped",
    },
    {
      "id": 125,
      "created_at": "2023-08-27 12:00:00",
      "shipping_address": {
        "name": "Jane Smith",
        "detail": "Jalan Mangga NO 99 Kota DEF",
      },
      "courier": {
        "name": "SiCepat",
        "detail": "Same Day Delivery",
      },
      "payment_method": {
        "name": "PayPal",
        "detail": "john@example.com",
      },
      "items": [
        {"id": 14, "product_name": "Tablet", "qty": 2, "price": 500.0},
        {"id": 15, "product_name": "Smartphone", "qty": 4, "price": 700.0},
      ],
      "total": 3800.0,
      "status": "Delivered",
    },
    {
      "id": 126,
      "created_at": "2023-08-28 13:00:00",
      "shipping_address": {
        "name": "Alice Johnson",
        "detail": "Jalan Melati NO 77 Kota GHI",
      },
      "courier": {
        "name": "Tiki",
        "detail": "Overnight Shipping",
      },
      "payment_method": {
        "name": "Credit Card",
        "detail": "Mastercard ending in  5678",
      },
      "items": [
        {"id": 16, "product_name": "Camera", "qty": 1, "price": 1000.0},
        {"id": 17, "product_name": "Tripod", "qty": 1, "price": 150.0},
      ],
      "total": 1150.0,
      "status": "Pending",
    },
    {
      "id": 127,
      "created_at": "2023-08-29 14:00:00",
      "shipping_address": {
        "name": "Bob Brown",
        "detail": "Jalan Sakura NO 88 Kota JKL",
      },
      "courier": {
        "name": "J&T Express",
        "detail": "Regular Shipping",
      },
      "payment_method": {
        "name": "Debit Card",
        "detail": "BNI ending in  9101",
      },
      "items": [
        {"id": 18, "product_name": "Monitor", "qty": 2, "price": 400.0},
        {"id": 19, "product_name": "Keyboard", "qty": 3, "price": 70.0},
      ],
      "total": 910.0,
      "status": "Delivered",
    },
    {
      "id": 128,
      "created_at": "2023-08-30 15:00:00",
      "shipping_address": {
        "name": "Charlie Green",
        "detail": "Jalan Anggrek NO 101 Kota MNO",
      },
      "courier": {
        "name": "GoSend",
        "detail": "Instant Delivery",
      },
      "payment_method": {
        "name": "Gopay",
        "detail": "charlie@example.com",
      },
      "items": [
        {"id": 20, "product_name": "Desk", "qty": 1, "price": 200.0},
        {"id": 21, "product_name": "Chair", "qty": 1, "price": 150.0},
      ],
      "total": 350.0,
      "status": "Pending",
    },
    {
      "id": 129,
      "created_at": "2023-08-31 16:00:00",
      "shipping_address": {
        "name": "David Black",
        "detail": "Jalan Mawar NO 202 Kota PQR",
      },
      "courier": {
        "name": "AnterAja",
        "detail": "Next Day Delivery",
      },
      "payment_method": {
        "name": "Credit Card",
        "detail": "Amex ending in  3456",
      },
      "items": [
        {"id": 22, "product_name": "Watch", "qty": 2, "price": 250.0},
        {"id": 23, "product_name": "Sunglasses", "qty": 1, "price": 100.0},
      ],
      "total": 600.0,
      "status": "Shipped",
    },
    {
      "id": 130,
      "created_at": "2023-09-01 17:00:00",
      "shipping_address": {
        "name": "Eva White",
        "detail": "Jalan Teratai NO 303 Kota STU",
      },
      "courier": {
        "name": "Ninja Express",
        "detail": "Standard Delivery",
      },
      "payment_method": {
        "name": "PayPal",
        "detail": "eva@example.com",
      },
      "items": [
        {"id": 24, "product_name": "Backpack", "qty": 1, "price": 120.0},
        {"id": 25, "product_name": "Shoes", "qty": 2, "price": 200.0},
      ],
      "total": 520.0,
      "status": "Delivered",
    },
    {
      "id": 131,
      "created_at": "2023-09-02 18:00:00",
      "shipping_address": {
        "name": "Frank Blue",
        "detail": "Jalan Kenanga NO 404 Kota VWX",
      },
      "courier": {
        "name": "Lion Parcel",
        "detail": "Regular Shipping",
      },
      "payment_method": {
        "name": "Debit Card",
        "detail": "BCA ending in  7890",
      },
      "items": [
        {"id": 26, "product_name": "Lamp", "qty": 3, "price": 60.0},
        {"id": 27, "product_name": "Bookshelf", "qty": 1, "price": 150.0},
      ],
      "total": 330.0,
      "status": "Pending",
    },
    {
      "id": 132,
      "created_at": "2023-09-03 19:00:00",
      "shipping_address": {
        "name": "Grace White",
        "detail": "Jalan Flamboyan NO 505 Kota YZA",
      },
      "courier": {
        "name": "Wahana",
        "detail": "Regular Shipping",
      },
      "payment_method": {
        "name": "OVO",
        "detail": "grace@example.com",
      },
      "items": [
        {"id": 28, "product_name": "TV", "qty": 1, "price": 1000.0},
        {"id": 29, "product_name": "Remote Control", "qty": 2, "price": 50.0},
      ],
      "total": 1100.0,
      "status": "Pending",
    },
    {
      "id": 133,
      "created_at": "2023-09-04 08:00:00",
      "shipping_address": {
        "name": "Liam Brown",
        "detail": "Jalan Merpati NO 307 Kota UVW",
      },
      "courier": {
        "name": "SiCepat",
        "detail": "Best Shipping",
      },
      "payment_method": {
        "name": "Gopay",
        "detail": "liam@example.com",
      },
      "items": [
        {"id": 30, "product_name": "Smartphone", "qty": 2, "price": 500.0},
        {"id": 31, "product_name": "Earphones", "qty": 4, "price": 25.0},
        {"id": 32, "product_name": "Charger", "qty": 3, "price": 30.0},
        {"id": 33, "product_name": "Power Bank", "qty": 1, "price": 100.0},
      ],
      "total": 1230.0,
      "status": "Shipped",
    }
  ];

  List<Map<String, dynamic>> get pendingOrderItems {
    return orderList.where((i) => i["status"] == "Pending").toList();
  }

  List<Map<String, dynamic>> get shippedOrderItems {
    return orderList.where((i) => i["status"] == "Shipped").toList();
  }

  List<Map<String, dynamic>> get deliveredOrderItems {
    return orderList.where((i) => i["status"] == "Delivered").toList();
  }
}
