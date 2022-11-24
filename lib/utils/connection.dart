import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  static var sharedInstance = Connection();

  Future<ConnectivityResult> checkConnectivity() {
    var connectivityResult = (Connectivity().checkConnectivity());
    return connectivityResult;
  }
}
