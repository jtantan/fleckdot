import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';

import 'package:fleckdot/restapi.dart';

main(List<String> args) async {
  try {
    final server = new Jaguar(port: 10000, multiThread: true);
    server.addApi(reflect(new RestApi()));
    await server.serve();

    print('=========================');
    print('serving on : ' + server.address + ':' + server.port.toString());
    print('=========================');
  }catch(e){
    print('=========================');
    print('Fail: ' + e.toString());
    print('=========================');
  }
}
