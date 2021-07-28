import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/widgets/controlButton.dart';

class DetailHadithPage extends StatelessWidget {
  const DetailHadithPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _Control(),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: Color(0xFF1A645B),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Arabic Tes 123456789101112131415",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Serif",
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Divider(
                          height: 50,
                          thickness: 1.5,
                          color: Color(0xFF1A645B),
                        ),
                        Text(
                          "IDN",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Serif",
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Control extends StatelessWidget {
  const _Control({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ControlButton(
          icon: CupertinoIcons.chevron_left,
        ),
        Text(
          "No. 1",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        ControlButton(
          icon: CupertinoIcons.chevron_right,
        ),
      ],
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
      width: double.infinity,
      height: 74,
      color: Color(0xFF1A645B),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              CupertinoIcons.chevron_left,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Text(
            "H.R. Malik",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
