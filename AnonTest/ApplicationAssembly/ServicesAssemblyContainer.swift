//
//  ServicesAssemblyContainer.swift
//  Consultation
//
//  Created by Сергей Ирбеткин on 21/03/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//



import Swinject
import SwinjectStoryboard


final class ServicesAssemblyContainer: Assembly {

	func assemble(container: Container) {
	
		container.register(NewsFeedSerivce.self) {r in
			let newsFeedSerivce = NewsFeedSerivceImpl()
			return newsFeedSerivce
		}

	}


}
