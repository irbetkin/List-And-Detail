//
//  DetailNewsViewController.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 14/04/2019.
//  Copyright (c) 2019 irbetkin. All rights reserved.
//


import UIKit
import PureLayout

class DetailNewsViewController: UIViewController {
    var presenter: DetailNewsPresenterInput!
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var newsLikeBtn: UIButton!
	@IBOutlet weak var newsDislikeBtn: UIButton!
	@IBOutlet weak var newsCommetnBtn: UIButton!
	@IBOutlet weak var newsWatchCount: UILabel!
	@IBOutlet weak var newsText: UILabel!
	@IBOutlet weak var newsDate: UILabel!
	@IBOutlet weak var newsAuthor: UILabel!
	@IBOutlet weak var authorImage: UIImageView!{
		didSet{
			authorImage.makeRoundFrame(byValue: 2)
		}
	}


    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		self.newsImage.autoSetDimension(.width, toSize: self.view.bounds.width)
        setNews()
    }
    
    // MARK: Action
	func setNews() {
		if let photo = self.presenter.photo {
			newsImage.sd_setImage(with: URL(string: photo), placeholderImage: UIImage(named: "user.png"))
			newsImage.backgroundColor = UIColor.clear
		}
		
		newsText.text = self.presenter.text
		
		newsLikeBtn.setTitle(self.presenter.likes, for: .normal)
		newsDislikeBtn.setTitle(self.presenter.dislikes, for: .normal)
		newsCommetnBtn.setTitle(self.presenter.comments, for: .normal)
		newsWatchCount.text = self.presenter.postviews
		
		newsDate.text = self.presenter.postDate
		newsAuthor.text = self.presenter.owner_name
		if let authorPhoto = self.presenter.authorImage {
			authorImage.sd_setImage(with: URL(string: authorPhoto), placeholderImage: UIImage(named: "user.png"))
		}
    }
}

// MARK: Setup
extension DetailNewsViewController {

}

extension DetailNewsViewController: DetailNewsPresenterOutput {

}
