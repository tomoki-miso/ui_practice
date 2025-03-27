import UIKit
import Flutter
import GoogleMaps



@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    var flutterEngine: FlutterEngine!
    var navigationController: UINavigationController?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("") // TODO: 実際のAPIキーを入力

        flutterEngine = FlutterEngine(name: "my_engine")
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)

        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        navigationController = UINavigationController(rootViewController: flutterViewController)
        navigationController?.isNavigationBarHidden = true

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        let methodChannel = FlutterMethodChannel(
            name: "com.example.map",
            binaryMessenger: flutterViewController.binaryMessenger
        )

    methodChannel.setMethodCallHandler { [weak self] call, result in
    if call.method == "showMap",
       let args = call.arguments as? [String: Any],
       let rawStaffList = args["staffList"] as? [[String: Any]] {

        let staffList = rawStaffList.compactMap { dict -> Staff? in
            guard
                let name = dict["name"] as? String,
                let latitude = dict["latitude"] as? Double,
                let longitude = dict["longitude"] as? Double,
                let imageUrl = dict["imageUrl"] as? String
            else {
                return nil
            }
            return Staff(name: name, latitude: latitude, longitude: longitude, imageUrl: imageUrl)
        }

        let mapVC = MapViewController(staffList: staffList)
        self?.navigationController?.pushViewController(mapVC, animated: true)
        result(nil)
    } else {
        result(FlutterMethodNotImplemented)
    }
}

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
