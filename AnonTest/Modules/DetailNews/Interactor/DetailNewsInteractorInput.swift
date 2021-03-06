//
//  DetailNewsInteractorInput.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import Foundation

protocol DetailNewsInteractorInput: class {
	func config(with news: News)
	var news: News? { get }
}
