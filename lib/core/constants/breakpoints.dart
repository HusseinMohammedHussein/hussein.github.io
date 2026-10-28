enum AppBreakpoint { mobile, tablet, desktop, largeDesktop }

abstract final class Breakpoints {
  static const double mobile = 700;
  static const double tablet = 1024;
  static const double desktop = 1440;

  static AppBreakpoint ofWidth(double width) {
    if (width < mobile) return AppBreakpoint.mobile;
    if (width < tablet) return AppBreakpoint.tablet;
    if (width < desktop) return AppBreakpoint.desktop;
    return AppBreakpoint.largeDesktop;
  }

  static bool isCompact(double width) => width < tablet;
}
