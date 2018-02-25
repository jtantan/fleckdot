//============================================
// Author: Jonathan Søyland-Lier
// Connects input with external RestAPI
//============================================

import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:fleckdot/models/pathpair.dart';
import 'package:fleckdot/models/connector_response.dart';
import 'package:fleckdot/business_logic/client_connector.dart';

class Connector {
  Connector();

  Future<ConnectorResponse> connect(String httpMethod, String action,
      List<PathPair> pathParams, Map body) async {
    ClientConnector cc = new ClientConnector();
    http.Response response =
        await cc.connectToExternal(httpMethod, pathParams, body);
    return new ConnectorResponse(response.body, response.statusCode, 'OK');
  }
}
