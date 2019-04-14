//
//  NewsFeedSerivceImpl.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import PromiseKit


class NewsFeedSerivceImpl: NewsFeedSerivce{
	
	
	func fetchNewsFeed(type: NewsFeedType, page: Int)->Promise<[News]>{
		NetworkActivityIndicatorManager.networkOperationStarted()
		return Promise{seal in
			Alamofire.request(NewsFeedURLRequest.getPosts(type: type, page: page))
	
				.response(completionHandler: { (response) in
				debugPrint(response)
				NetworkActivityIndicatorManager.networkOperationFinished()
				if let error = response.error {
					seal.reject(error)
				} else {
					if let data = response.data  {
						do {
							let result = try JSONDecoder().decode(DefaultResponse<[News]>.self, from: data)
							if !result.error {
									seal.fulfill(result.data!)
							} else {
								let error = NSError(domain: result.message ?? "Error", code: result.code, userInfo: nil)
								seal.reject(error)
							}
						} catch(let error){
							
							seal.reject(error)
						}
					}
				}
			})
		}
	}
	
	
	private func printJSONResponse(response: DataResponse<Any>){
		switch response.result{
		case .success(let value):
			print(JSON(value))
		case .failure(let error):
			print(error)
		}
	}
}
