//
//  ApplicationAssembly.swift
//  Consultation
//
//  Created by Сергей Ирбеткин on 13/03/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {

	// default dependencies
	class var assembler: Assembler {
		return Assembler(
			[
				ServicesAssemblyContainer(),
				NewsFeedAssemblyContainer()
		]
		)
	}
	
	var assembler: Assembler
	
	init(with assemblies: [Assembly]) {
		assembler = Assembler(assemblies)
	}

}

extension SwinjectStoryboard {
	@objc class func setup() {
		defaultContainer = ApplicationAssembly.assembler.resolver as! Container
	}
}
