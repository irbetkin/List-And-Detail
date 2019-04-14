//
//  DetailNewsPresenter.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//

import Foundation


class DetailNewsPresenter {
    var interactor: DetailNewsInteractorInput!
    weak var viewController: DetailNewsPresenterOutput!
    var router: DetailNewsWireframeInput!
    
    // MARK: Presentation Logic
    
    func presentSomething() {
		
    }
}

extension DetailNewsPresenter: DetailNewsModuleInput {

}

extension DetailNewsPresenter: DetailNewsPresenterInput {
	func someActionTriggered() {
		
	}
}

extension DetailNewsPresenter: DetailNewsInteractorOutput {
	
}