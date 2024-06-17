import 'package:flutter/material.dart';
import 'package:slicing_ui_one/core.dart';
import 'package:slicing_ui_one/module/order_list/widget/order_list_delivered_item.dart';
import 'package:slicing_ui_one/module/order_list/widget/order_list_pending_item.dart';
import 'package:slicing_ui_one/module/order_list/widget/order_list_shipped_item.dart';
import '../controller/order_list_controller.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  Widget build(context, OrderListController controller) {
    controller.view = this;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Shipped",
              ),
              Tab(
                text: "Delivered",
              ),
            ],
          ),
          title: const Text('Order List'),
        ),
        body: TabBarView(
          children: [
            OrderListPendingItem(
              items: controller.pendingOrderItems, // add ini
            ),
            OrderListShippedItem(
              items: controller.shippedOrderItems, // add ini
            ),
            OrderListDeliveredItem(
              items: controller.deliveredOrderItems, // add ini
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OrderListView> createState() => OrderListController();
}
