//
//  Date+.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation

extension Date{
	
	func timestampToString(unixDate: Int)->String{
		let date = Date(timeIntervalSince1970: TimeInterval(unixDate))
		let dateFormatter = DateFormatter()
		dateFormatter.locale = NSLocale.current
		dateFormatter.dateFormat = "yyyy-MM-dd"
		return dateFormatter.string(from: date)
	}
}
