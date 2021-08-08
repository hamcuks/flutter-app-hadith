import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hadith_app/iconsax_icons.dart';
import 'package:flutter_hadith_app/pages/widgets/controlButton.dart';
import 'package:flutter_hadith_app/pages/widgets/load_lottie_animation.dart';
import 'package:flutter_hadith_app/provider/detail_hadith_provider.dart';
import 'package:flutter_hadith_app/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateProvider<int>((_) => 1);

class DetailHadithPage extends ConsumerWidget {
  const DetailHadithPage({
    Key? key,
    required this.hadithId,
    required this.pageNum,
    required this.hadithName,
  }) : super(key: key);

  final String hadithId;
  final String hadithName;
  final int pageNum;

  @override
  Widget build(BuildContext context, watch) {
    final page = watch(pageProvider);
    final detailHadith = watch(
      detailHadithData(
        DetailHadithParams(hadithId: hadithId, page: page.state),
      ),
    );

    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _Header(
                name: hadithName,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _searchController,
                  onSubmitted: (val) {
                    context.read(pageProvider).state = int.parse(val);
                  },
                  decoration: InputDecoration(
                    labelText: 'Masukkan nomor hadith',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Color(0xFF1A645B),
                      ),
                    ),
                    suffixIcon: Icon(CupertinoIcons.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _Control(
                      number: page.state,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    detailHadith.when(
                      data: (data) {
                        return Container(
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
                                  height: 1.6,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () => Center(
                        child: LoadLottieAnim(
                          fileName: 'loading',
                          width: 150,
                        ),
                      ),
                      error: (e, s) => Center(
                        child: LoadLottieAnim(
                          fileName: 'not_found',
                          width: 350,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
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
            onPressed: () =>
                number <= 1 ? null : context.read(pageProvider).state--),
        Text(
          "No. $number",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        ControlButton(
          icon: CupertinoIcons.chevron_right,
          onPressed: () {
            context.read(pageProvider).state++;
          },
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
            onPressed: () {
              context.read(pageProvider).state = 1;
              Navigator.of(context).pop();
            },
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
