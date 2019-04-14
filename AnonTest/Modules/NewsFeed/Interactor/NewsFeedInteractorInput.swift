//
//  NewsFeedInteractorInput.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import Foundation

protocol NewsFeedInteractorInput: class {
	func setup()
	var newsFeed: [News] { get }
}
