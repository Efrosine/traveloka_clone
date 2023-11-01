import 'package:flutter/material.dart';
import 'package:traveloka_clone/data/models/request_booking_model.dart';
import 'package:traveloka_clone/view/pages/Auth/login_page.dart';
import 'package:traveloka_clone/view/pages/home/booking_hotels_page.dart';
import 'package:traveloka_clone/view/pages/home/list_hotels_page.dart';
import 'package:traveloka_clone/view/pages/nav_bar.dart';

import '../view/pages/home/detail_hotels_page.dart';

class AppRoute {
  static Route onGenerateRoutes(RouteSettings settings) {
    dynamic arg = settings.arguments;
    switch (settings.name) {
      case '/':
        return _materialRoute(LoginPage());
      case '/Navbar':
        return _materialRoute(const Navbar());
      case '/BHPage':
        return _materialRoute(BookingHotelsPage());
      case '/LHPage':
        return _materialRoute(ListHotelsPage(reqBook: arg));
      case '/DHPage':
        return _materialRoute(DetailHotelsPage(
          model: arg,
        ));
      default:
        return _errorRoute();
    }
  }

  static Route _materialRoute(
    Widget views,
  ) {
    return MaterialPageRoute(builder: (_) => views);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
