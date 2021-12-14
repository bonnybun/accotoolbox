import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Uint8List generateKey(List data) => Uint8List.fromList(
    data.map((byte) => int.parse(byte.toString(), radix: 16)).toList());

String decryptDotEnv(List data, String dotEnvKey) {
  final encryptedValue = dotenv.get(dotEnvKey);
  final key = generateKey(data);
  return decrypt(key, encryptedValue);
}

String decrypt(Uint8List keyBytes, String base64) {
  final key = encrypt.Key(keyBytes);
  final encrypter = encrypt.Encrypter(encrypt.AES(
    key,
    mode: encrypt.AESMode.ecb,
  ));
  return encrypter.decrypt64(base64);
}
