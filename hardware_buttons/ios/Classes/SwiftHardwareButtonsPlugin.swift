import Flutter
import UIKit

enum ChannelName {
    static let hardware = "com.the28awg.hardware_buttons"
}

public class SwiftHardwareButtonsPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let hardwareInstance = HardwareButtonStreamHandler()
        let hardwareStream = FlutterEventChannel(name: ChannelName.hardware,
                                               binaryMessenger: registrar.messenger())
        hardwareStream.setStreamHandler(hardwareInstance)
    }

    public func handle(_ call: FlutterMethodCall,
                       result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
    
}
