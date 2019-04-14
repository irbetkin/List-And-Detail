//
//  DetailNewsPresenterInput.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import Foundation


protocol DetailNewsPresenterInput {
	var photo: String? { get }
	var text: String { get }
	var likes: String { get }
	var dislikes: String { get }
	var comments: String { get }
	var postviews: String { get }
	var postDate:  String { get }
	var owner_name: String { get }
	var authorImage: String? { get }
}

