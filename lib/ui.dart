import 'package:floatingbutton/screens/homepage.dart';
import 'package:flutter/material.dart';

get appColor => Color.fromARGB(149, 18, 18, 24);

class FloatButton extends StatefulWidget {
  const FloatButton({Key? key}) : super(key: key);

  @override
  _FloatButtonState createState() => _FloatButtonState();
}

int _currentPage = 0;

class _FloatButtonState extends State<FloatButton> {
  List<Widget> pages = [
    SizedBox(
      child: HomePage(),
    ),
    Column(
      children: const [
        SizedBox(
          child: Center(child: Text("Second Page")),
        ),
      ],
    ),
    const SizedBox(
      child: Center(child: Text("Third Page")),
    ),
    const SizedBox(
      child: Center(child: Text("Fourth Page")),
    ),
  ];

  _onItemTap(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(_currentPage),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => _onItemTap(0),
                    icon: Icon(Icons.wallet_giftcard)),
                IconButton(
                    onPressed: () => _onItemTap(1),
                    icon: Icon(Icons.wallet_giftcard)),
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: e,
                      ))
                  .toList(),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => _onItemTap(2),
                    icon: Icon(Icons.wallet_giftcard)),
                IconButton(
                    onPressed: () => _onItemTap(3),
                    icon: Icon(Icons.wallet_giftcard)),
              ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: e,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
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
