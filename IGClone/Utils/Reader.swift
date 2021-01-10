//
//  Reader.swift
//  IGClone
//
//  Created by Daniel Partogi on 10/01/21.
//

import Foundation


func loadJson<T: Codable>() -> [T] {

	do {
		let url = Bundle.main.url(forResource: "dummy", withExtension: "json")!

		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let allBlogPosts = try decoder.decode([T].self, from: data)
		return allBlogPosts
	} catch {
		print(error)
	}
	return []
}
