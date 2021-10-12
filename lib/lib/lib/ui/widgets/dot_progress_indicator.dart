
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../colors.dart';

class DotProgressIndicator extends StatelessWidget {
  const DotProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(size: 18.0, color: colorPurple),
    );
  }
}
