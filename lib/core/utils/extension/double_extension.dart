import '../size_fit.dart';

extension DoubleFit on double {
  double get px {
    return OPSizeFit.setPx(this);
  }

  double get rpx {
    return OPSizeFit.setRpx(this);
  }
}
