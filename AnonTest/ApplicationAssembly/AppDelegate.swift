//
//  AppDelegate.swift
//  Consultation
//
//  Created by Сергей Ирбеткин on 13/03/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import UIKit
import PluggableApplicationDelegate

@UIApplicationMain
class AppDelegate: PluggableApplicationDelegate {

	override var services: [ApplicationService] {
		return [
			RootWindowService()
		]
	}

	override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return super.application(application, didFinishLaunchingWithOptions: launchOptions)
	}


}

