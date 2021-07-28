import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/widgets/card.dart';
import 'package:flutter_hadith_app/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final hadiths = watch(hadithData);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            // Center(
            //   child: hadiths.when(
            //     data: (data) {
            //       print(data!.data!.length);
            //     },
            //     loading: () => CircularProgressIndicator(),
            //     error: (e, s) => Text('$e'),
            //   ),
            // ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: hadiths.when(
                  data: (data) {
                    //print("Data: ${data!.length}");
                    return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, index) => CardHadith(
                        data: data[index],
                      ),
                    );
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e, s) => Center(
                    child: Text('$e'),
                  ),
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
