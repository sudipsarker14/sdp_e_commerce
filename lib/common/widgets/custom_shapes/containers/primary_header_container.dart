import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class SdpPrimaryHeaderContainer extends StatelessWidget {
  const SdpPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SdpCurvedEdgeWidget(
      child: Container(
        color: SdpColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: SdpCircularContainer(
                      backgroundColor: SdpColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: -100,
                  right: -300,
                  child: SdpCircularContainer(
                      backgroundColor: SdpColors.textWhite.withOpacity(0.1))),
              // If ['size.isFinite': is not true.in stack] error occured ->
              // Readme.md file atgithub t channel]
            ],
          ),
        ),
      ),
    );
  }
}
