//
//  DetailNewsInteractor.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit


class DetailNewsInteractor {
    weak var presenter: DetailNewsInteractorOutput!
    private var newsFeed: News?
	
}


extension DetailNewsInteractor: DetailNewsInteractorInput {
	var news: News? {
		
		return newsFeed
	}
	
//	var news: News {
//		return newsFeed!
//	}
	

	
	func config(with news: News) {
		
		self.newsFeed = news
		print("config detail \(news.text)")
	}
	
	
}
