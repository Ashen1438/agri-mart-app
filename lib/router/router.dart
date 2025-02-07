// FILE: router_class.dart
import 'package:agri_mart/screens/get_started.dart';
import 'package:agri_mart/screens/login.dart';
import 'package:agri_mart/screens/sign_up.dart';
import 'package:agri_mart/screens/user_panel/add_new_item_screen.dart';
import 'package:agri_mart/screens/user_panel/cart_screen.dart';
import 'package:agri_mart/screens/user_panel/chat_screen.dart';
import 'package:agri_mart/screens/user_panel/fruits_screen.dart';
import 'package:agri_mart/screens/user_panel/home.dart';
import 'package:agri_mart/screens/user_panel/invoice_screen.dart';
import 'package:agri_mart/screens/user_panel/message_section.dart';
import 'package:agri_mart/screens/user_panel/notification_screen.dart';
import 'package:agri_mart/screens/user_panel/order_confirmation_screen.dart';
import 'package:agri_mart/screens/user_panel/order_histry.dart';
import 'package:agri_mart/screens/user_panel/order_tracking_screen.dart';
import 'package:agri_mart/screens/user_panel/others_screen.dart';
import 'package:agri_mart/screens/user_panel/payment_screen.dart';
import 'package:agri_mart/screens/user_panel/product_detail_screen.dart';
import 'package:agri_mart/screens/user_panel/product_screen.dart';
import 'package:agri_mart/screens/user_panel/profile_screen.dart';
import 'package:agri_mart/screens/user_panel/todays_price_screen.dart';
import 'package:agri_mart/screens/user_panel/vegetables_screen.dart';
import 'package:get/get.dart';

class RouterClass {
  List<GetPage> get routes => [
        GetPage(
          name: '/',
          page: () => const GetStarted(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUp(),
        ),
        GetPage(
          name: '/login',
          page: () => const Login(),
        ),
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
        GetPage(name: '/user_panel/profile', page: () => ProfileScreen()),
        GetPage(name: '/user_panel/cart', page: () => CartScreen()),
        GetPage(name: '/user_panel/vegetables', page: () => VegetablesScreen()),
        GetPage(name: '/user_panel/fruites', page: () => FruitsScreen()),
        GetPage(name: '/user_panel/others', page: () => OthersScreen()),
        GetPage(
            name: '/user_panel/today_price', page: () => TodaysPriceScreen()),
        GetPage(name: '/user_panel/message', page: () => MessageSection()),
        GetPage(name: '/user_panel/chat', page: () => ChatScreen()),
        GetPage(name: '/user_panel/product', page: () => ProductScreen()),
        GetPage(
            name: '/user_panel/order_confirmation',
            page: () => OrderConfirmationScreen()),
        GetPage(
            name: '/user_panel/invoice_screen', page: () => InvoiceScreen()),
        GetPage(name: '/user_panel/payment', page: () => PaymentScreen()),
        GetPage(
            name: '/user_panel/odertrack', page: () => OrderTrackingScreen()),
        GetPage(
            name: '/user_panel/add_new_item_screen',
            page: () => AddNewItemScreen()),
        GetPage(
            name: '/user_panel/order_history',
            page: () => const OrderHistory()),
        GetPage(
            name: '/user_panel/notification', page: () => NotificationScreen()),
        GetPage(
            name: '/user_panel/product_detail', page: () => ProductDetail()),
      ];
}
