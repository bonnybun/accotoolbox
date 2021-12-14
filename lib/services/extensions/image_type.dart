import 'package:accotoolbox/constants/default_constants.dart';

extension ImageType on String {
  bool isPNG() {
    return endsWith(PNG_EXTENSION);
  }

  bool isJPG() {
    return endsWith(JPG_EXTENSION);
  }

  bool isSVG() {
    return endsWith(SVG_EXTENSION);
  }
}
