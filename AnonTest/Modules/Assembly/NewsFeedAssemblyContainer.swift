//
//  NewsFeedAssemblyContainer.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class NewsFeedAssemblyContainer: Assembly {
    func assemble(container: Container) {
		
		container.register(NewsFeedInteractor.self) { (r, presenter: NewsFeedPresenter) in
			let interactor = NewsFeedInteractor()
			interactor.presenter = presenter
			interactor.newsFeedService = r.resolve(NewsFeedSerivce.self)
			return interactor
		}
		
		container.register(NewsFeedRouter.self) { (r, viewController: NewsFeedViewController) in
			let router = NewsFeedRouter()
			router.transitionHandler = viewController
			return router
		}
		
		container.register(NewsFeedPresenter.self) { (r, viewController: NewsFeedViewController) in
			let presenter = NewsFeedPresenter()
			
			presenter.viewController = viewController
			presenter.interactor = r.resolve(NewsFeedInteractor.self, argument: presenter)
			presenter.router = r.resolve(NewsFeedRouter.self, argument: viewController)
			
			return presenter
		}
		
		container.storyboardInitCompleted(NewsFeedViewController.self) { r, controller in
			controller.presenter = r.resolve(NewsFeedPresenter.self, argument: controller)
		}
		
    }
}
