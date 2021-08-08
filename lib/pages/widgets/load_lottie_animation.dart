import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadLottieAnim extends StatelessWidget {
  const LoadLottieAnim({
    Key? key,
    required this.fileName,
    required this.width,
  }) : super(key: key);

  final String fileName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/$fileName.json', width: width),
    );
  }
}
