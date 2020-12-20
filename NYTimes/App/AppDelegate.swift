//
//  AppDelegate.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerDependencies()
        return true
    }

    private func registerDependencies() {
        let container = Container()
        container.registerDataDependencies()
        container.registerDomainDependencies()
        container.registerAppDependencies()
        DependencyInjection.shared.setContainer(container)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
