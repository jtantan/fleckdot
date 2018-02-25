//============================================
// Author: Jonathan Søyland-Lier
// Connects to external rest api
//============================================

import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:fleckdot/models/pathpair.dart';

class ClientConnector {
  http.Client client;

  ClientConnector() {
    client = new http.Client();
  }

  Future<http.Response> connectToExternal(
      String httpMethod, List<PathPair> pathParams, Map body) async {
    final http.Response resp =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return resp;
  }
}
