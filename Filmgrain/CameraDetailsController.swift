//
//  CameraDetailsController.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/2/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import UIKit

class CameraDetailsController: UITableViewController {

	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var notesField: UITextView!
	var camera: Camera?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.nameField.text = camera!.name
		self.notesField.text = camera!.notes

		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false

		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem()

	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		if nameField.text?.characters.count > 0 {
			camera!.name = nameField.text!
		}

		if notesField.text.characters.count > 0 {
			camera!.notes = notesField.text!
		} else {
			camera!.notes = ""
		}
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
