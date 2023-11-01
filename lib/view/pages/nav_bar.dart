import 'package:flutter/material.dart';
import 'package:traveloka_clone/controller/bloc/nav_bar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveloka_clone/view/pages/booking/booking_page.dart';
import 'package:traveloka_clone/view/pages/home/home_page.dart';
import 'package:traveloka_clone/view/pages/myaccount/myaccount_page.dart';
import 'package:traveloka_clone/view/pages/saved/saved_page.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarBloc(),
      child: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: botNavPages[state.tabIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: botNavItems,
              currentIndex: state.tabIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) => BlocProvider.of<NavBarBloc>(context).add(
                NavBarTabChangeEvt(tabIndex: index),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<BottomNavigationBarItem> botNavItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Booking'),
  BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Saved'),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'My Acount'),
];

List<Widget> botNavPages = [
  HomePage(),
  BookingPage(),
  SavedPage(),
  MyAccountPage(),
];
