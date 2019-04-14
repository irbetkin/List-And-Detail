//
//  RootWindowService.swift
//  Consultation
//
//  Created by Сергей Ирбеткин on 13/03/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import PluggableApplicationDelegate


enum RouteGate: String {

	case NewsFeed = "NewsFeedViewController"
	
}

final class RootWindowService: NSObject, ApplicationService{

	var window: UIWindow?
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
			
		initializeRootController()

		return true
	}

	private func initializeRootController() {
		window = UIWindow(frame: UIScreen.main.bounds)
		let _ = ApplicationAssembly.assembler.resolver as! Container

		var viewController: UIViewController?
		viewController = newsfeedViewController()

		updateRootController(with: viewController)
	}
	

	
	
	func updateRootController(with controller: UIViewController?) {
		window?.rootViewController = nil
		window?.rootViewController = controller
		window?.makeKeyAndVisible()
	}
	
	private func newsfeedViewController() -> UIViewController {
		let storyboard = SwinjectStoryboard.create(name: RouteGate.NewsFeed.rawValue, bundle: nil, container: SwinjectStoryboard.defaultContainer)
		return storyboard.instantiateInitialViewController()!
	}

}
