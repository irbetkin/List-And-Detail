//
//  NewsFeedViewController.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 10/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit

class NewsFeedViewController: UIViewController {
    var presenter: NewsFeedPresenterInput!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Action

}

// MARK: Setup
extension NewsFeedViewController {
    private func setup() {
		self.presenter.setup()
    }
}

extension NewsFeedViewController: NewsFeedPresenterOutput {

}
