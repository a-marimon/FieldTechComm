import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO => Remove hard coded GoogleMaps API key
    GMSServices.provideAPIKey("AIzaSyDkMl_8FpQuiYMWZp6oBykwt8zwTHnAe1c")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
