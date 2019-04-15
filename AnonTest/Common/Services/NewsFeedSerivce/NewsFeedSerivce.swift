//
//  NewsFeedSerivce.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation
import PromiseKit

protocol NewsFeedSerivce {
	func fetchNewsFeed(type: NewsFeedType, page: Int)->Promise<[News]>
	func retrievedCachedNews()->[News]
	func cacheObject(news: [News])
}
