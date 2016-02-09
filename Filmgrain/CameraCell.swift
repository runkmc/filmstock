//
//  CameraCell.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import UIKit

class CameraCell: UITableViewCell {

	@IBOutlet weak var loadingButton: UIButton!
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var notes: UILabel!
	var camera: Camera?
	weak var parentController: CamerasViewController?

	@IBAction func cellButtonTapped(sender: UIButton) {
		if sender.titleForState(.Normal) == "Unload" {
			self.parentController!.unloadCamera(self.camera!)
		} else {
			self.parentController!.loadCamera(self.camera!)
		}
	}


	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
