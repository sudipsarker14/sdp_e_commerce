import 'package:flutter/material.dart';

import 'curved_edges.dart';

class SdpCurvedEdgeWidget extends StatelessWidget {
  const SdpCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SdpCustomCurvedEdges(),
      child: child,
    );
  }
}
