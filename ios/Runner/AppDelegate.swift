import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    private let methodChannelName = "com.example.show"
    private var result: FlutterResult?
    
    private var flutterViewController: FlutterViewController {
        return self.window.rootViewController as! FlutterViewController
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: flutterViewController.binaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] methodCall, result in
            if methodCall.method == "show" {
                let parameters = methodCall.arguments as? String
                self?.result = result
                self?.launchNativeScreen(parameters)
            } else {
                result(FlutterError(code: "ErrorCode", message: "ErrorMessage", details: nil))
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func launchNativeScreen(_ parameters: String?) {
        let viewController = RunnerViewController(parameters: parameters)
        viewController.delegate = self
        flutterViewController.present(viewController, animated: true, completion: nil)
    }
}

extension AppDelegate: RunnerViewControllerDelegate {
    func runnerViewControllerSendMessage(_ viewController: RunnerViewController, result: String?) {
        self.result?(result)
    }
}