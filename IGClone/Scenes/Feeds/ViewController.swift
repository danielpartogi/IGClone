//
//  ViewController.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController {

	lazy var imageData: [FeedImage] = {
		return loadJson()
	}()

	var cachedHeight: [IndexPath : CGFloat] = [:]
	var expandedRow:[IndexPath] = []

	override func viewDidAppear(_ animated: Bool) {
		view.backgroundColor = .blue

	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .blue
		self.tableView.rowHeight = UITableView.automaticDimension
		self.tableView.estimatedRowHeight = 200
		self.tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: FeedTableViewCell.cellName)

		
	}
}

// MARK: - TABLE VIEW FUNCTION

extension ViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		tableView.separatorStyle = .none
		return imageData.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellName, for: indexPath) as! FeedTableViewCell
		let image = imageData[indexPath.row]
		cell.indexPath = indexPath
		cell.selectionStyle = UITableViewCell.SelectionStyle.none
		cell.setup(image: image, height: getCachedHeight(indexPath: indexPath), isExpanded: expandedRow.contains(indexPath))
		cell.handler = { iPath in
			self.refreshIndexPath(iPath)
		}
		
		return cell
	}

	func refreshIndexPath(_ indexPath: IndexPath) {
		self.tableView.beginUpdates()
		if !expandedRow.contains(indexPath) {
			expandedRow.append(indexPath)
		}
		self.tableView.endUpdates()
	}
}

// MARK: - PRIVATE FUNCTION
private extension ViewController {
	func getCachedHeight(indexPath: IndexPath) -> CGFloat {

		if 	let height = cachedHeight[indexPath] {
			return height
		}
		let image = imageData[indexPath.row]

		// calculate the height for view
		let newHeight = ((UIScreen.main.bounds.width * image.height) / image.width) + 50

		cachedHeight[indexPath] = newHeight
		return cachedHeight[indexPath] ?? 0
	}
	
}


class FeedImage : Codable{
	var id : String
	var author : String
	var width : CGFloat
	var height : CGFloat
	var download_url: String

	init (id : String, author: String, width: CGFloat, height: CGFloat, download_url: String){
		self.id = id
		self.author = author
		self.width = width
		self.height = height
		self.download_url = download_url
	}
}



