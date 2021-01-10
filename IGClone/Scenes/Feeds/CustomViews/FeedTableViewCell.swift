//
//  FeedTableViewCell.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import UIKit
import SDWebImage

class FeedTableViewCell: UITableViewCell {

	static var cellName = "feedCell"

	@IBOutlet var feedImageView: UIImageView!
	@IBOutlet var feedUserLabel: UILabel!
	@IBOutlet var feedUserImageView: UIImageView!
	@IBOutlet var feedDesc: UILabel!
	@IBOutlet var feedHeightConstraint: NSLayoutConstraint!

	let suffixText = " See More"

	var dummyText = "ontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professorontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professorontrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."

	var indexPath: IndexPath = []

	var handler: ((IndexPath) -> Void)?

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

	func setup(image: FeedImage, height: CGFloat, isExpanded: Bool) {
		feedImageView.loadImage(at: image.download_url)
		updateHeight(height: height)
		if isExpanded {
			feedDesc.attributedText = getAllText(dummyText)
		} else {
			feedDesc.attributedText = getSmallText(dummyText)
		}
	}

	func updateHeight(height: CGFloat) {
		feedHeightConstraint.constant = height
	}

	func getSmallText(_ text: String) -> NSMutableAttributedString {
		let prefixText = "DANIEL "
		var newText = prefixText + String(text.prefix(100)) + "..."
		newText += suffixText

		let mutableText = NSMutableAttributedString(string: newText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 400)), NSAttributedString.Key.foregroundColor: UIColor.black])

		mutableText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: NSRange(location:newText.count - suffixText.count,length:suffixText.count))

		mutableText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 700))], range: _NSRange(location: 0, length: prefixText.count))
		return mutableText

	}

	@objc func didTap() {
		feedDesc.attributedText = getAllText(dummyText)

		handler?(indexPath)

	}

	func getAllText(_ text: String) -> NSMutableAttributedString {
		let prefixText = "DANIEL "
		let newText = prefixText + text

		let mutableText = NSMutableAttributedString(string: newText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(500)), NSAttributedString.Key.foregroundColor: UIColor.darkGray])

		mutableText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(700))], range: _NSRange(location: 0, length: prefixText.count))
		return mutableText
	}
}
