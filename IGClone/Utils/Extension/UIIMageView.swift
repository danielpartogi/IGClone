//
//  UIIMageView.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import UIKit
import Nuke

extension UIImageView {

	func loadImage(at urlPath: String) {

		guard let url = URL(string: urlPath) else {
			return
		}

		let options = ImageLoadingOptions(
			transition: .none
		)
		Nuke.loadImage(with: url, options: options, into: self)
	}
}
