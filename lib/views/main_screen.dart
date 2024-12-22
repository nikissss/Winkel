import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/accountscreen.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/cartscreen.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/categoryscreen.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/homescreen.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/searchscreen.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/storescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex =0;

  List<Widget> _pages =[
Homescreen(),
CategoryScreen(),
StoreScreen(),
CartScreen(),
SearchScreen(),
AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, //navigation bar page sangai change hunna
      currentIndex: pageIndex,
      onTap: (value) {
        setState(() {
          pageIndex = value;
        }); //currentindex ma pageindex xa jun ma click garyo page ko value change hunxa tap garda
      },
    unselectedItemColor: Colors.black,
    selectedItemColor:const Color.fromARGB(255, 30, 39, 97),
    items: [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label:"Home"),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/explore.svg',width:20),
              label:"Categories"),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                'assets/icons/store.svg',width:20),
                    label:"Store"),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                'assets/icons/cart.svg',width:20),
                          label:"Cart"),
                              BottomNavigationBarItem(
                                icon:SvgPicture.asset(
                'assets/icons/search.svg',width:20),
                                label:"Search"),
                                 BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                'assets/icons/account.svg',width:20),
                                label:"Account"),
                              
     ],
     ),
     body:_pages[pageIndex],
    );
  }
}