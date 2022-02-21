import 'package:flutter/material.dart';

class myNavBar extends StatefulWidget {
  const myNavBar({Key? key}) : super(key: key);

  @override
  _myNavBarState createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFF383838)),
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.home,
                    size: 40.0,
                    color: Color(0xFFa3de70),
                  ),
                  Icon(
                    Icons.school,
                    size: 40.0,
                    color: Color(0xFFa3de70),
                  ),
                  SizedBox
                      .shrink(), //* to make sufficient gap for floating action button
                  Icon(
                    Icons.business_center,
                    size: 40.0,
                    color: Color(0xFFa3de70),
                  ),
                  Icon(
                    Icons.contact_phone,
                    size: 40.0,
                    color: Color(0xFFa3de70),
                  ),
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
