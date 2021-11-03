import '../_.imports.dart';

class AdaptiveScaffoldBody extends StatelessWidget {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double adjustmentWidth;
  final double adjustmentHeight;
  final AlignmentGeometry? alignment;
  final Widget child;

  const AdaptiveScaffoldBody({
    Key? key,
    this.minWidth = 400,
    this.maxWidth = 600,
    this.minHeight = 400,
    this.adjustmentWidth = 0,
    this.adjustmentHeight = 0,
    this.alignment = Alignment.topCenter,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width - adjustmentWidth;
    final screenHeight = screenSize.height - adjustmentHeight - 24;
    final minWidthAfterAdjustment = minWidth - adjustmentWidth;
    final minHeightAfterAdjustment = minHeight - adjustmentHeight - 24;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: screenWidth,
        height: screenHeight,
        alignment: alignment,
        constraints: BoxConstraints(
          minWidth: minWidthAfterAdjustment,
          minHeight: minHeightAfterAdjustment,
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
