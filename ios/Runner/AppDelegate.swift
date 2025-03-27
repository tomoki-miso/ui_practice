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
        GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")//TODO: ここにAPIキーを入力

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
            if call.method == "showMap" {
                let mapVC = MapViewController()
                self?.navigationController?.pushViewController(mapVC, animated: true)
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
