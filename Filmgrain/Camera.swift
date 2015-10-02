//
//  Camera.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import Foundation

class Camera {
  
  var name: String
  var notes: String
  var loaded: Bool
  
  init(name: String) {
    self.name = name
    notes = "empty"
    loaded = false
  }
}