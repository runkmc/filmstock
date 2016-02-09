//
//  LoadCameraController.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import UIKit

class LoadCameraController: UIViewController {

	var camera: Camera?
	@IBOutlet weak var cameraName: UILabel!
	@IBOutlet weak var notesField: UITextView!
	@IBOutlet weak var cancelButton: UIButton!
	@IBOutlet weak var loadButton: UIButton!

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let button = sender as! UIButton

		if button.titleForState(.Normal) == "Load Camera" {
			camera?.loaded = true
            camera?.notes = notesField.text ?? ""
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		cameraName.text = camera?.name
		loadButton.layer.borderWidth = 1
		loadButton.layer.cornerRadius = 22
		loadButton.layer.borderColor = UIColor.init(red:0.086, green:0.651, blue:0.341, alpha:1.000).CGColor
		cancelButton.layer.borderWidth = 1
		cancelButton.layer.cornerRadius = 22
		cancelButton.layer.borderColor = UIColor.init(red:0.804, green:0.000, blue:0.078, alpha:1.000).CGColor

		let tapper = UITapGestureRecognizer.init(target: self, action: "dismiss")
		tapper.cancelsTouchesInView = false
		self.view.addGestureRecognizer(tapper)

		// Do any additional setup after loading the view.
	}

	func dismiss() {
		self.view.endEditing(true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/

}
