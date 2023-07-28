import 'package:getx_testing/error/failure.dart';

class ServerExecption implements Failure {
  String message;
  ServerExecption({required this.message});
}
