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
	private var newsList: [News] = [News]()
    
    
    // MARK: Do something
    

}


extension NewsFeedInteractor: NewsFeedInteractorInput {
	var newsFeed: [News] {
		print("news count = \(newsList.count)")
		return newsList
	}
	
	
	func setup() {
		self.newsFeedService.fetchNewsFeed(type: .new, page: 0).done { (data) in
			print("donwload news feed count \(data.count)")
			self.newsList = data
			self.presenter.updateNewsFeed()
			}.catch { (error) in
				print(error)
		}
	}
	
	
}
