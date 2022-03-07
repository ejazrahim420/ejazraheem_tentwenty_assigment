// Future<T> decodeInBackground<T>(dynamic data, dynamic jsonDecode) async {
//   final p = ReceivePort();
//   await Isolate.spawn(_decodeDataInBackground, [p.sendPort, data, jsonDecode]);

//   return await p.first;
// }

// void _decodeDataInBackground(List<dynamic> args) async {
//   SendPort responsePort = args[0];
//   dynamic data = args[1];
//   dynamic jsonDecodeMethod = args[2];
//   try {
//     final decodedData = jsonDecodeMethod(data);
//     Isolate.exit(responsePort, decodedData);
//   } catch (e) {
//     print(e);
//     Isolate.exit(responsePort, null);
//   }
// }