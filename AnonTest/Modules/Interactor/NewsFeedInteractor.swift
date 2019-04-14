//
//  NewsFeedInteractor.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit


class NewsFeedInteractor {
    weak var presenter: NewsFeedInteractorOutput!
	var newsFeedService: NewsFeedSerivce!
		
    
    
    // MARK: Do something
    

}


extension NewsFeedInteractor: NewsFeedInteractorInput {
	
	func setup() {
		self.newsFeedService.fetchNewsFeed(type: .new, page: 0).done { (newsFeed) in
			self.presenter.onNewsFeed(news: newsFeed)
			}.catch { (error) in
				print(error)
		}
	}
	
	
}
