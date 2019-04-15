//
//  NewsFeedRouter.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit


class NewsFeedRouter: NewsFeedWireframeInput {
	
	
	
	weak var transitionHandler: TransitionHandler!
	
	struct Segue {
		static let detail = "detail"
	}
	
	func showDetail(news: News) {
		DispatchQueue.main.async {
			try? self.transitionHandler
				.forSegue(identifier: Segue.detail, to: DetailNewsPresenter.self)
				.then { moduleInput in
					moduleInput.config(with: news)
					return true
			}
			
		}
	}
}
