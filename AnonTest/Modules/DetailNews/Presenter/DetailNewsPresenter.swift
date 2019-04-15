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
    

}

extension DetailNewsPresenter: DetailNewsModuleInput {
	
	func config(with news: News) {
		print("config presenter")
		self.interactor.config(with: news)
	}
	

}

extension DetailNewsPresenter: DetailNewsPresenterInput {
	var likes: String {
		return String(self.interactor.news?.likes.count ?? 0)
	}
	
	var dislikes: String {
		return String(self.interactor.news?.dislikes.count ?? 0)
	}
	
	var comments: String {
		return String(self.interactor.news?.comments.count ?? 0)
	}
	
	var postviews: String {
		return String(self.interactor.news?.postviews.count ?? 0)
	}
	
	var postDate: String {
		return self.interactor.news?.dateString ?? "..."
	}
	
	var owner_name: String {
		return self.interactor.news?.owner_name ?? "..."
	}
	
	var authorImage: String? {
		return	self.interactor.news?.owner_photo
	}
	
	var text: String {
		guard let text = self.interactor.news?.text else {
			return ""
		}
		return text
	}
	
	var photo: String? {
		return self.interactor.news?.attachments?.first?.photo?.photo_medium
	}
	

	

}

extension DetailNewsPresenter: DetailNewsInteractorOutput {
	
}
