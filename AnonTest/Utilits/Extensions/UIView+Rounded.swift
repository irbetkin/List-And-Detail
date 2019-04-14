//
//  UIView+Rounded.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import UIKit

extension UIView {
	
	func makeRoundFrame(byValue: CGFloat) {
		self.layer.cornerRadius = self.frame.size.width / byValue
		self.clipsToBounds = true
	}
}
