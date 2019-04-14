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
	var currentPage: Int = 0
	
	private var newsList: [News] = [News]()
    
    


}


extension NewsFeedInteractor: NewsFeedInteractorInput {
	func dowloadNextPage() {
		self.currentPage += 1
		self.newsFeedService.fetchNewsFeed(type: .new, page: currentPage).done { (data) in
			
			let indexPaths = ((self.newsList.count) ..< (self.newsList.count + data.count)).map { IndexPath(row: $0, section: 0) }
			self.newsList = self.newsList + data
			self.presenter.insertRows(at: indexPaths)
			}.catch { (error) in
				print(error)
		}

	}
	
	var newsFeed: [News] {
		print("news count = \(newsList.count)")
		return newsList
	}
	
	
	func setup() {
		self.newsFeedService.fetchNewsFeed(type: .new, page: currentPage).done { (data) in
			print("donwload news feed count \(data.count)")
			self.newsList = data
			self.presenter.updateNewsFeed()
			}.catch { (error) in
				print(error)
		}
	}
	
	
}
