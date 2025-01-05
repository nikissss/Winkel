import 'package:flutter/material.dart';
import 'package:multi_vendor_app/views/buyers/navscreen.dart/searchscreen.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search For Products',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(14.0),
            //   child: SvgPicture.asset(
            //     'assets/icons/search.svg',
            //     width: 10,
            //   ),

            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // You can define the action for the search button here
                print('Search button pressed');
              },
            ),
          ),
        ),
      ),
    );
  }
}
