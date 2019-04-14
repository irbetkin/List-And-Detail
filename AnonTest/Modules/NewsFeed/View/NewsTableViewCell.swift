//
//  NewsTableViewCell.swift
//  AnonTest
//
//  Created by Сергей Ирбеткин on 13/04/2019.
//  Copyright © 2019 irbetkin. All rights reserved.
//

import UIKit
import SDWebImage


class NewsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var newsLikeBtn: UIButton!
	@IBOutlet weak var newsDislikeBtn: UIButton!
	@IBOutlet weak var newsCommetnBtn: UIButton!
	@IBOutlet weak var newsWatchCount: UILabel!
	@IBOutlet weak var newsText: UILabel!
	@IBOutlet weak var newsDate: UILabel!
	@IBOutlet weak var newsAuthor: UILabel!
	@IBOutlet weak var authorImage: UIImageView!
	
	
	func configCell(news: News){
		if let photo = news.attachments?.first?.photo?.photo_medium{
			newsImage.sd_setImage(with: URL(string: photo), placeholderImage: UIImage(named: "user.png"))
		}
		newsText.text = news.shortText
		newsLikeBtn.setTitle("\(news.likes.count)", for: .normal)
		newsDislikeBtn.setTitle("\(news.dislikes.count)", for: .normal)
		newsCommetnBtn.setTitle("\(news.comments.count)", for: .normal)
		newsWatchCount.text = String(news.postviews.count)
		
		newsDate.text = news.dateString
		newsAuthor.text = news.owner_name
		if let authorPhoto = news.owner_photo {
			authorImage.sd_setImage(with: URL(string: authorPhoto), placeholderImage: UIImage(named: "user.png"))
		}
		authorImage.makeRoundFrame(byValue: 2)

	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
