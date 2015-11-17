//
//  Camera.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import Foundation

class Camera: NSObject, NSCoding {
  
  var name: String {
    didSet {
      if name.characters.count == 0 && oldValue.characters.count > 0
        { name = oldValue }
    }
  }
  var notes: String
  var loaded: Bool
  
  init(name: String, notes: String, loaded: Bool) {
    self.name = name
    self.notes = notes
    self.loaded = loaded
  }
  
  convenience init(name: String) {
    self.init(name: name, notes: "empty", loaded:false)
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeBool(self.loaded, forKey: "loaded")
    aCoder.encodeObject(self.notes, forKey: "notes")
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    let n = aDecoder.decodeObjectForKey("name") as! String
    let l = aDecoder.decodeBoolForKey("loaded")
    let no = aDecoder.decodeObjectForKey("notes") as! String
    
    self.init(name:n, notes:no, loaded:l)
  }
}