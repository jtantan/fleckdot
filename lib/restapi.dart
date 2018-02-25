//============================================
// Author: Jonathan Søyland-Lier
// General purpose api
// RestAPI returns JSON results
// Takes in an Action and Parameter(s)
//============================================

library restapi;

import 'dart:async';
import 'package:jaguar/jaguar.dart';

import 'package:fleckdot/models/pathpair.dart';
import 'package:fleckdot/business_logic/connector.dart';
import 'package:fleckdot/models/connector_response.dart';

@Api(path: '/api')
class RestApi {
  @GetJson(path: '/:action')
  @GetJson(path: '/:action/:param1')
  @GetJson(path: '/:action/:param1/:param2')
  @GetJson(path: '/:action/:param1/:param2/:param3')
  Future<Response<String>> getAction(Context ctx) async {
    String act = ctx.pathParams.get('action', 'empty');
    List<PathPair> patPar = getPathParams(ctx.pathParams);

    //Connect
    Connector con = new Connector();
    ConnectorResponse result = await con.connect('GET', act, patPar, null);
    return Response.json(result.toMap());
  }

  //post
  @PostJson(path: '/:action')
  @PostJson(path: '/:action/:param1')
  @PostJson(path: '/:action/:param1/:param2')
  @PostJson(path: '/:action/:param1/:param2/:param3')
  Future<Response<String>> postAction(Context ctx) async {
    String act = ctx.pathParams.get('action', 'empty');
    List<PathPair> patPar = getPathParams(ctx.pathParams);
    Map body = await ctx.req.bodyAsJsonMap();

    //Connect
    Connector con = new Connector();
    ConnectorResponse result = await con.connect('POST', act, patPar, body);
    return Response.json(result.toMap());
  }

  //Helper method
  List<PathPair> getPathParams(Map map) {
    List<PathPair> patPar = new List<PathPair>();
    map.forEach((k, v) {
      if (k != 'action') {
        patPar.add(new PathPair(k, v));
      }
    });

    return patPar;
  }
}
