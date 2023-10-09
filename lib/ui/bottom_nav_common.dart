import 'package:fashionsense/const/app_colors.dart';
import 'package:fashionsense/ui/bootm_nav_pages/cart.dart';
import 'package:fashionsense/ui/bootm_nav_pages/favourite.dart';
import 'package:fashionsense/ui/bootm_nav_pages/home.dart';
import 'package:fashionsense/ui/bootm_nav_pages/profile.dart';
import 'package:fashionsense/ui/pickup_points.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavCommmon extends StatefulWidget {
  const BottomNavCommmon({Key? key}) : super(key: key);

  @override
  _BottomNavCommmonState createState() => _BottomNavCommmonState();
}

class _BottomNavCommmonState extends State<BottomNavCommmon> {
  final _pages = [
    const Home(),
    const Favourite(),
    const Cart(),
    const Profile(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PickupPoints()));
            },
            icon: FaIcon(
              FontAwesomeIcons.mapMarkedAlt,
              color: Colors.black54,
            ),
          )
        ],
        title: const Text(
          "Fashion : Sense",
          style: TextStyle(color: AppColors.kPrimaryColor),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.kPrimaryColor,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
