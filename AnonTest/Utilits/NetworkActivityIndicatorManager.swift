//
//  networkIndicator.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Foundation
import UIKit

class NetworkActivityIndicatorManager: NSObject {
	private static var loadingCount = 0
	
	class func networkOperationStarted() {
		if loadingCount == 0 {
			UIApplication.shared.isNetworkActivityIndicatorVisible = true
		}
		loadingCount += 1
	}
	
	class func  networkOperationFinished() {
		if loadingCount > 0 {
			loadingCount -= 1
		}
		
		if loadingCount == 0 {
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
		}
	}
}
