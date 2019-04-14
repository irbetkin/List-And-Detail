//
//  NewsFeed.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation

struct News: Codable {
	var id: Int
	var date: Int
	var postviews: Counting
	
	var text: String?
	var lang: String?
	var owner_photo: String?
	var likes: Counting
	var dislikes: Counting
	var comments: Counting
	var attachments: [Attachment]?
	var owner_name: String?
	var owner_id: Int?
	
	var dateString: String{
		return  Date().timestampToString(unixDate: date)
	}
	
	var shortText: String {
		return String(text?.suffix(100) ?? "") 
	}
}

struct Counting: Codable{
	var count: Int
	var my: Int
}

struct Attachment: Codable{
	var link: String?
	var photo: Photo?
}

struct Photo: Codable {
	var photo_big: String?
	var photo_medium: String?
	var photo_small: String?
}

enum NewsFeedType: Int{
	case popular = 1
	case new = 2
}
