//
//  DetailNewsViewController.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit

class DetailNewsViewController: UIViewController {
    var presenter: DetailNewsPresenterInput!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Action
    func someAction() {
        
    }
}

// MARK: Setup
extension DetailNewsViewController {
    private func setup() {
    }
}

extension DetailNewsViewController: DetailNewsPresenterOutput {
    func displaySomething() {
    }
}
