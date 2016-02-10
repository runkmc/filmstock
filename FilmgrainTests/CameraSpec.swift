//
//  CameraSpec.swift
//  Filmstock
//
//  Created by Kevin McGladdery on 2/10/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Filmstock

class CameraSpec: QuickSpec {
    override func spec() {
        describe("A Camera") {
            let cam = Camera(name:"Nikon 1", notes:"Dropped it in a pool", loaded:true)
            
            it("has properties") {
                expect(cam.name) == "Nikon 1"
                expect(cam.notes) == "Dropped it in a pool"
                expect(cam.loaded) == true
            }
        }
    }
}
