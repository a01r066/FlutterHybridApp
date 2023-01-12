import 'package:connectivity_plus/connectivity_plus.dart';
import '../values/global_variables.dart';

class NetworkUtils {
  static Future<bool> isNetworkAvailable() async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  static Map<String, dynamic> getConnectDevicesInfo({String? carrierInfo}) {
    late Map<String, dynamic> connectionInfo;
    /// Bluetooth: Device connected via bluetooth
    bool isBluetooth = false;

    /// WiFi: Device connected via Wi-Fi
    bool isWifi = false;

    /// Mobile: Device connected to cellular network
    bool isMobile = false;

    /// VPN: Device connected to a VPN
    bool isVpn = false;

    switch(connectivityResult){
      case ConnectivityResult.bluetooth:
        isBluetooth = true;
        break;
      case ConnectivityResult.wifi:
        isWifi = true;
        break;
      case ConnectivityResult.mobile:
        isMobile = true;
        break;
      case ConnectivityResult.vpn:
        isVpn = true;
        break;
      default:
        break;
    }

    connectionInfo = {
      "bluetooth": isBluetooth,
      "wifi": isWifi,
      "cellular": isMobile,
      "carrier": carrierInfo,
      "is_vpn": isVpn
    };

    return connectionInfo;
  }
}