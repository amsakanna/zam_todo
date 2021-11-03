import '../../_view.imports.dart';

class LoadingIndicatorContainer extends StatelessWidget {
  const LoadingIndicatorContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 120),
      alignment: Alignment.topCenter,
      child: const LoadingIndicator(),
    );
  }
}
