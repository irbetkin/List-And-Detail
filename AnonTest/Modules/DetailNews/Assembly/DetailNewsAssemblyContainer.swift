//
//  DetailNewsAssemblyContainer.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class DetailNewsAssemblyContainer: Assembly {
    func assemble(container: Container) {
		
		container.register(DetailNewsInteractor.self) { (r, presenter: DetailNewsPresenter) in
			let interactor = DetailNewsInteractor()
			interactor.presenter = presenter
			
			return interactor
		}
		
		container.register(DetailNewsRouter.self) { (r, viewController: DetailNewsViewController) in
			let router = DetailNewsRouter()
			router.transitionHandler = viewController
			return router
		}
		
		container.register(DetailNewsPresenter.self) { (r, viewController: DetailNewsViewController) in
			let presenter = DetailNewsPresenter()
			
			presenter.viewController = viewController
			presenter.interactor = r.resolve(DetailNewsInteractor.self, argument: presenter)
			presenter.router = r.resolve(DetailNewsRouter.self, argument: viewController)
			
			return presenter
		}
		
		container.storyboardInitCompleted(DetailNewsViewController.self) { r, controller in
			controller.presenter = r.resolve(DetailNewsPresenter.self, argument: controller)
		}
		
    }
}
