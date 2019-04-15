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

	@IBOutlet weak var tableView: UITableView!
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
	func insertRows(at indexPaths: [IndexPath]) {
		self.tableView.insertRows(at: indexPaths, with: .fade)
		self.tableView.endUpdates()
	}

	
	func updateNewsData() {
		self.tableView.reloadData()
	}
	

}

extension NewsFeedViewController: UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.presenter.tableViewRowCount
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsTableViewCell
		cell.configCell(news: self.presenter.news(by: indexPath))
		return cell
	}
	
}

extension NewsFeedViewController: UITableViewDelegate{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.presenter.didSelectNews(at: indexPath)
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == self.presenter.tableViewRowCount - 3 {
			self.presenter.dowloadNextPage()
		}
	}
}
