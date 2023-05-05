import './packages/rlp.dart' as Rlp;
import 'dart:typed_data';
import 'dart:convert';
import './packages/utils.dart' as Utils;

void main() {
    var raw = '0xf86d820144843b9aca0082520894b78777860637d56543da23312c7865024833f7d188016345785d8a0000802ba0e2539a5d9f056d7095bd19d6b77b850910eeafb71534ebd45159915fab202e91a007484420f3968697974413fc55d1142dc76285d30b1b9231ccb71ed1e720faae';
    var rawList = Utils.hexToUint8List(raw);
    var decoded = Rlp.decode(rawList);

     var result = {
        "nonce": int.parse(Utils.arrayToHex(decoded[0]), radix: 16),
        "gasPrice": int.parse(Utils.arrayToHex(decoded[1]), radix: 16),
        "gasLimit": int.parse(Utils.arrayToHex(decoded[2]), radix: 16),
        "to": "0x${Utils.arrayToHex(decoded[3])}",
        "value": int.parse(Utils.arrayToHex(decoded[4]), radix: 16),
        "data": Utils.arrayToHex(decoded[5]),
        "v": Utils.arrayToHex(decoded[6]),
        "r": Utils.arrayToHex(decoded[7]),
        "s": Utils.arrayToHex(decoded[8])
    };

    print(jsonEncode(result));
}