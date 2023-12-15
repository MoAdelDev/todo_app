import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DefaultSpinKit extends StatelessWidget {
  final double size;

  const DefaultSpinKit({super.key, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: Theme.of(context).colorScheme.primary,
      size: size,
    );
  }
}
