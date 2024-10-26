import 'package:flutter/material.dart';

import '../../../apps/configs/injection.dart';
import '../../../apps/configs/service_location.dart';
import '../header.widget.dart';

class RouteAwareWidget extends StatefulWidget {
  final Widget child;
  final HeaderWidget? headerWidget;
  const RouteAwareWidget({
    super.key,
    required this.child,
    this.headerWidget,
  });

  @override
  State<RouteAwareWidget> createState() => _RouteAwareWidgetState();
}

class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    getIt<NavigationService>().routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.headerWidget != null)...
          {
            widget.headerWidget!
          },
        Expanded(child: widget.child),
      ],
    );
  }
}
