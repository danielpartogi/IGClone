//
//  Feed.swift
//  IGClone
//
//  Created by Daniel Partogi on 12/01/21.
//

import UIKit

class Feed : Codable{
	var id : String
	var author : String
	var width : CGFloat
	var height : CGFloat
	var desc: String
	var download_url: String

	init (id : String, author: String, width: CGFloat, height: CGFloat, download_url: String, desc: String){
		self.id = id
		self.author = author
		self.width = width
		self.height = height
		self.desc = desc
		self.download_url = download_url
	}
}
