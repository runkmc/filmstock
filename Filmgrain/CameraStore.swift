//
//  CameraStore.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import Foundation

class CameraStore {

	static var store = [Camera]()

	static func path() -> String {
		let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		return "\(dirs[0])items.archive"
	}

	static func save() -> Bool {
		return NSKeyedArchiver.archiveRootObject(self.store, toFile: self.path())
	}

	static func load() {
		guard let s = NSKeyedUnarchiver.unarchiveObjectWithFile(self.path()) as? [Camera]
		else { return }

		self.store = s
	}
}
