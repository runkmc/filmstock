//
//  AddCameraController.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import UIKit

class AddCameraController: UIViewController {

  @IBOutlet weak var cameraField: UITextField!
  @IBOutlet weak var createButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!
  var newCameraName: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.borderWidth = 1
        createButton.layer.cornerRadius = 22
        createButton.layer.borderColor = UIColor.init(red:0.086, green:0.651, blue:0.341, alpha:1.000).CGColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.cornerRadius = 22
        cancelButton.layer.borderColor = UIColor.init(red:0.804, green:0.000, blue:0.078, alpha:1.000).CGColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if self.newCameraName?.characters.count == 0 {
      self.newCameraName = nil }
    else {
      self.newCameraName = cameraField.text
    }
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
