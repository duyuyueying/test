import 'package:flutter/material.dart';
import 'package:flutter_zoo/util/rem.dart';

class ZooGaps{
  static const double gap_dp10 = 10;
  static const double gap_dp20 = 20;
  static const double gap_dp80 = 80;

  static Widget vGap10 = SizedBox(
    height: Rem.getPxToRem(gap_dp10),
  );
  static Widget vGap20 = SizedBox(
    height: Rem.getPxToRem(gap_dp20),
  );

  static Widget hGap10 = SizedBox(
    width: Rem.getPxToRem(gap_dp10),
  );
  static Widget hGap20 = SizedBox(
    width: Rem.getPxToRem(gap_dp20),
  );
  static Widget hGap80 = SizedBox(
    width: Rem.getPxToRem(gap_dp80),
  );
}