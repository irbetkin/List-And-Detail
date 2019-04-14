//
//  DefaultResponse.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation

struct DefaultResponse<Response: Codable>: Codable {
	var error: Bool
	var code: Int
	var data: Response?
	var message: String?
	
	
	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		error = try values.decode(Bool.self, forKey: .error)
		code = try values.decode(Int.self, forKey: .code)
		message = try? values.decode(String.self, forKey: .message)
		data = try? values.decode(Response.self, forKey: .data)
		
	}
}
