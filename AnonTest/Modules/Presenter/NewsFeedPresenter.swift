//
//  NewsFeedPresenter.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//

import Foundation


class NewsFeedPresenter {
    var interactor: NewsFeedInteractorInput!
    weak var viewController: NewsFeedPresenterOutput!
    var router: NewsFeedWireframeInput!
    
    // MARK: Presentation Logic
    

}

extension NewsFeedPresenter: NewsFeedModuleInput {

}

extension NewsFeedPresenter: NewsFeedPresenterInput {
	func setup(){
		self.interactor.setup()
	}
}

extension NewsFeedPresenter: NewsFeedInteractorOutput {
	func onNewsFeed(news: [News]) {
		
	}
	
	
}
