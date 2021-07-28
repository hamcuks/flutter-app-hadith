import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) => CardHadith(
                    namaHadith: "H.R. Malik",
                    jumlahData: 5888,
                  ),
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

class _Header extends StatelessWidget {
  const _Header({
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
