import Flutter
import UIKit

public class SwiftFlutterSumPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_sum_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSumPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "sum":
      if let args = call.arguments as? [String: Any],
         let a = args["a"] as? Int,
         let b = args["b"] as? Int {
        result(a + b)
      } else if let args = call.arguments as? [String: Any],
                let aNum = args["a"] as? NSNumber,
                let bNum = args["b"] as? NSNumber {
        result(aNum.intValue + bNum.intValue)
      } else {
        result(FlutterError(code: "INVALID_ARGS", message: "a or b missing or not integer", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
