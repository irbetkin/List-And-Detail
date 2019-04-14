//
//  NewsFeedPresenterInput.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import Foundation


protocol NewsFeedPresenterInput {
	func setup()
	var tableViewRowCount: Int { get }
	func news(by indexPath: IndexPath)-> News
	func didSelectNews(at indexPath: IndexPath)
}

