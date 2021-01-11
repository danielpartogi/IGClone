//
//  ViewController.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import UIKit

class ViewController: UITableViewController {

	lazy var feeds: [Feed] = {
		return loadJson()
	}()

	var cachedHeight: [IndexPath : CGFloat] = [:]
	var expandedRow:[IndexPath] = []

	override func viewDidAppear(_ animated: Bool) {
		view.backgroundColor = .blue

	}

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.navigationBar.isHidden = true
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
		return feeds.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.cellName, for: indexPath) as! FeedTableViewCell
		let feed = feeds[indexPath.row]
		cell.indexPath = indexPath
		cell.selectionStyle = UITableViewCell.SelectionStyle.none
		cell.setup(feed: feed, height: getCachedHeight(indexPath: indexPath), isExpanded: expandedRow.contains(indexPath))
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
		let feed = feeds[indexPath.row]

		// calculate the height for view
		let newHeight = (((UIScreen.main.bounds.width * feed.height) / feed.width))

		cachedHeight[indexPath] = newHeight
		return cachedHeight[indexPath] ?? 0
	}
	
}





