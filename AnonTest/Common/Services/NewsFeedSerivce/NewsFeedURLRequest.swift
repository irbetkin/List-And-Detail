//
//  NewsFeedURLRequest.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation
import Alamofire

enum NewsFeedURLRequest: URLRequestConvertible {
	case getPosts(type: NewsFeedType, page: Int)
	
	static let perPage = 20 // news per page
	static let baseURLString = "http://dev.apianon.ru:3000/"
	
	var path: String{
		switch self {
		case .getPosts:
			return "posts/get"
		}
	}
	var method: HTTPMethod{
		switch self {
		case .getPosts:
			return .post
		}
	}
	var headers: HTTPHeaders {
		switch self {
		case .getPosts:
			return [
				"Content-Type": "application/json"]
		}
	}
	var parameters: [String: Any]?{
		switch self {
		case .getPosts(let type, let page):
			if page > 0 {
				return ["type":type.rawValue, "count": NewsFeedURLRequest.perPage, "offset": NewsFeedURLRequest.perPage * page]
			} else {
				return ["type":type.rawValue, "count":NewsFeedURLRequest.perPage, "offset":0]
			}
		}
	}
	
	func asURLRequest() throws -> URLRequest {
		let url = try NewsFeedURLRequest.baseURLString.asURL()
		var urlRequest = URLRequest(url: url.appendingPathComponent(path))
		urlRequest.httpMethod = method.rawValue
		urlRequest.allHTTPHeaderFields = headers
		switch method {
		case .get:
			urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
		case .post:
			urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
		default:
			break
		}
		return urlRequest
	}
}
