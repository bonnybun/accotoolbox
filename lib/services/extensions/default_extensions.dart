export 'hexcolor.dart';
export 'image_type.dart';
export 'number_extensions.dart';

extension EnumName on dynamic {
  String enumName() {
    return toString().replaceFirst("${runtimeType.toString()}.", "");
  }
}
