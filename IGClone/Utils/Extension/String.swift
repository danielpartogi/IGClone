//
//  String.swift
//  IGClone
//
//  Created by Daniel Partogi on 12/01/21.
//

import UIKit

extension String {
	func getSmallText(prefixText: String, suffixText: String, length: Int) -> NSMutableAttributedString {
		var newText = prefixText + String(self.prefix(length)) + "..."
		newText += suffixText

		let mutableText = NSMutableAttributedString(string: newText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 400)), NSAttributedString.Key.foregroundColor: UIColor.black])

		mutableText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: NSRange(location:newText.count - suffixText.count,length:suffixText.count))

		mutableText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 700))], range: _NSRange(location: 0, length: prefixText.count))
		return mutableText

	}

	func getAllText(prefixText: String) -> NSMutableAttributedString {

		let newText = prefixText + self

		let mutableText = NSMutableAttributedString(string: newText, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(500)), NSAttributedString.Key.foregroundColor: UIColor.darkGray])

		mutableText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black ,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: UIFont.Weight(700))], range: _NSRange(location: 0, length: prefixText.count))
		return mutableText
	}
}
