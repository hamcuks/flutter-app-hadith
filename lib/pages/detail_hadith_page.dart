import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/widgets/controlButton.dart';
import 'package:flutter_hadith_app/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = Provider<int>((_) => 1);

class DetailHadithPage extends ConsumerWidget {
  const DetailHadithPage({
    Key? key,
    required this.hadithId,
    required this.pageNum,
  }) : super(key: key);

  final String hadithId;
  final int pageNum;

  @override
  Widget build(BuildContext context, watch) {
    final detailHadith = watch(
      detailHadithData(
        DetailHadithParams(hadithId: hadithId, page: pageNum),
      ),
    );
    final page = watch(pageProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: detailHadith.when(
            data: (data) => Column(
              children: [
                _Header(
                  name: data.name,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      _Control(
                        number: page,
                      ),
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
                              "${data.contents?.arab}",
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
                              "${data.contents?.id}",
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
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) => Center(
              child: Text('$e'),
            ),
          ),
        ),
      ),
    );
  }
}

class _Control extends StatelessWidget {
  const _Control({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ControlButton(
          icon: CupertinoIcons.chevron_left,
          onTap: () => print(number - 1),
        ),
        Text(
          "No. $number",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        ControlButton(
          icon: CupertinoIcons.chevron_right,
          onTap: () => {},
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    this.name,
  }) : super(key: key);

  final String? name;

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
            "$name",
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
