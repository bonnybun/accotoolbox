import 'dart:math';

import 'package:accotoolbox/constants/default_constants.dart';

export '../extensions/default_extensions.dart';
export 'crypt_utils.dart';
export 'geo_utils.dart';
export 'io_utils.dart';
export 'ui_utils.dart';


int generateID() => Random.secure().nextInt(INT_MAX_VALUE);
