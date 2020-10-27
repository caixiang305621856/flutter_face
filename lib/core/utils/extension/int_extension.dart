import '../size_fit.dart';

extension IntFit on int {
  double get px {
    return OPSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return OPSizeFit.setRpx(this.toDouble());
  }
}