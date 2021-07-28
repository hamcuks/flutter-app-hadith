import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/detail_hadith_page.dart';

class CardHadith extends StatelessWidget {
  const CardHadith(
      {Key? key, required this.namaHadith, required this.jumlahData})
      : super(key: key);

  final String namaHadith;
  final int jumlahData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => DetailHadithPage(),
        ),
      ),
      child: Container(
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
              namaHadith,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dengan Jumlah ${jumlahData} Hadith",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
