import 'package:flutter/material.dart';
import 'package:code_test_flutter/src/app/core/utils/platform_meta.dart';

class RippleEffect extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final Color splashColor;
  final BorderRadius borderRadius;
  final PlatformMeta platform;

  const RippleEffect({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
    this.splashColor = Colors.white24,
    this.platform = PlatformMeta.instance,
  });

  @override
  Widget build(BuildContext context) {
    final listener = onTap != null ? onTap as void Function()? : () {};
    if (platform.isIos) {
      return GestureDetector(
        onTap: listener,
        child: child,
      );
    } else {
      return Material(
          borderRadius: borderRadius,
          color: Colors.transparent,
          child: InkWell(
            customBorder: RoundedRectangleBorder(borderRadius: borderRadius),
            splashColor: splashColor,
            onTap: listener,
            child: child,
          ));
    }
  }
}
