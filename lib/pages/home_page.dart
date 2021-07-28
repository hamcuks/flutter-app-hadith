import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) => CardHadith(),
                  itemCount: 9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 74,
      color: Color(0xFF1A645B),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            scale: 1.8,
          ),
          SizedBox(
            width: 14,
          ),
          Text(
            "HADITH",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class CardHadith extends StatelessWidget {
  const CardHadith({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Iconsax.book,
            size: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "HR. Malik",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Dengan Jumlah 1587 Hadith",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
