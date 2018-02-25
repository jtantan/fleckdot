//============================================
// Author: Jonathan Søyland-Lier
// The response object from the restAPI
//============================================

import 'dart:convert';

class ConnectorResponse {
  String response;
  int sourceStatusCode;
  String sourceMessage;

  ConnectorResponse(this.response, this.sourceStatusCode, this.sourceMessage);

  Map toMap() {
    Map map = new Map();
    map['response'] = new Map();
    map['response'].addAll(JSON.decode(response));
    map['sourceCode'] = sourceStatusCode;
    map['sourceMessage'] = sourceMessage;
    return map;
  }
}
