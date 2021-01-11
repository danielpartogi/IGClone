//
//  FeedTableViewCell.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

	static var cellName = "feedCell"

	@IBOutlet var feedImageView: UIImageView!
	@IBOutlet var feedUserLabel: UILabel!
	@IBOutlet var feedUserImageView: UIImageView!
	@IBOutlet var feedDesc: UILabel!
	@IBOutlet var feedHeightConstraint: NSLayoutConstraint!



	var indexPath: IndexPath = []
	var prefixText: String = ""
	var handler: ((IndexPath) -> Void)?
	var feed: Feed?

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
		

		self.feedDesc.isUserInteractionEnabled = true
		self.feedDesc.addGestureRecognizer(gesture)
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}

	func setup(feed: Feed, height: CGFloat, isExpanded: Bool) {
		feedImageView.loadImage(at: feed.download_url)
		self.feed = feed
		self.prefixText = feed.author
		if isExpanded {
			feedDesc.attributedText = feed.desc.getAllText(prefixText: self.prefixText)
		} else {
			feedDesc.attributedText = feed.desc.getSmallText(prefixText: self.prefixText, suffixText: "More", length: 100)
		}
		updateHeight(height: height)
	}

	func updateHeight(height: CGFloat) {
		feedHeightConstraint.constant = height
	}

	

	@objc func didTap() {
		feedDesc.attributedText = feed?.desc.getAllText(prefixText: self.prefixText)

		handler?(indexPath)

	}


}
