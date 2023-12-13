import 'dart:developer' as devtools show log;
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webcrypto/webcrypto.dart';

class LoginScreenProvider {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void reset() {
    _email = '';
    _password = '';
  }

  bool get isValid => _email.isNotEmpty && _password.isNotEmpty;

  void login() {
    generateKeys();
    // final algorithm = X25519();
    // devtools.log("algorithm: $algorithm");
    // final aliceKeyPair = await algorithm.newKeyPair();
    // devtools.log("aliceKeyPair: $aliceKeyPair");
    // final bobKeyPair = await algorithm.newKeyPair();
    // devtools.log("bobKeyPair: $bobKeyPair");
    // final bobPublicKey = await bobKeyPair.extractPublicKey();
    // final sharedSecret = await algorithm.sharedSecretKey(
    //   keyPair: aliceKeyPair,
    //   remotePublicKey: bobPublicKey,
    // );
    // devtools.log("sharedSecret: $sharedSecret");
    // final sharedSecretBytes = await sharedSecret.extractBytes();
    // devtools.log("sharedSecretBytes: $sharedSecretBytes");
    // final sharedSecretBase64 = base64Encode(sharedSecretBytes);
    // devtools.log("sharedSecretBase64: $sharedSecretBase64");
    // final sharedSecretBase64Bytes = base64Decode(sharedSecretBase64);
    // devtools.log("sharedSecretBase64Bytes: $sharedSecretBase64Bytes");
  }

  Future<void> generateKeys() async {
    //1. Generate keys
    KeyPair<EcdhPrivateKey, EcdhPublicKey> keyPair =
        await EcdhPrivateKey.generateKey(EllipticCurve.p256);
    devtools.log('keypair: $keyPair');
    Map<String, dynamic> publicKeyJwk =
        await keyPair.publicKey.exportJsonWebKey();
    devtools.log('publicKeyJwk: $publicKeyJwk');
    Map<String, dynamic> privateKeyJwk =
        await keyPair.privateKey.exportJsonWebKey();
    devtools.log('privateKeyJwk: $privateKeyJwk');

    //Generate a Crypto Key

    //1. Alice's public key
    Map<String, dynamic> publicjwk = publicKeyJwk;
    EcdhPublicKey ecdhPublicKey =
        await EcdhPublicKey.importJsonWebKey(publicjwk, EllipticCurve.p256);
    devtools.log('publicjwk: $ecdhPublicKey');

    //2. Bob's private key
    Map<String, dynamic> privatejwk = privateKeyJwk;
    EcdhPrivateKey ecdhPrivateKey =
        await EcdhPrivateKey.importJsonWebKey(privatejwk, EllipticCurve.p256);
    devtools.log('privatejwk: $ecdhPrivateKey');

    //3. Generating cryptokey called deriveBits
    Uint8List derivedBits = await ecdhPrivateKey.deriveBits(256, ecdhPublicKey);
    devtools.log('derivedBits: $derivedBits');
    encrypt('my message', derivedBits);
  }

  final Uint8List iv = Uint8List.fromList('Initialization Vector'.codeUnits);

  Future<String> encrypt(String message, Uint8List derivedBits) async {
    // 1.
    final aesGcmSecretKey = await AesGcmSecretKey.importRawKey(derivedBits);

    // 2.
    List<int> list = message.codeUnits;
    Uint8List data = Uint8List.fromList(list);

    // 3.
    Uint8List encryptedBytes = await aesGcmSecretKey.encryptBytes(data, iv);

    // 4.
    String encryptedString = String.fromCharCodes(encryptedBytes);
    devtools.log('encryptedString $encryptedString');
    decrypt(encryptedString, derivedBits);
    return encryptedString;
  }

  Future<String> decrypt(String encryptedMessage, Uint8List derivedBits) async {
    // 1.
    final aesGcmSecretKey = await AesGcmSecretKey.importRawKey(derivedBits);

    // 2.
    List<int> message = Uint8List.fromList(encryptedMessage.codeUnits);

    // 3.
    Uint8List decryptdBytes = await aesGcmSecretKey.decryptBytes(message, iv);

    // 4.
    String decryptdString = String.fromCharCodes(decryptdBytes);
    devtools.log('decryptdString $decryptdString');
    return decryptdString;
  }
}

final loginScreenProvider = Provider((ref) => LoginScreenProvider());
