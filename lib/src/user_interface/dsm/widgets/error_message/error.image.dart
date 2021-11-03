import '../_.imports.dart';

class ErrorImage extends StatelessWidget {
  final String path;

  const ErrorImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 400,
      height: 200,
    );
  }
}
