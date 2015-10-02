//
//  CamerasViewController.swift
//  Filmgrain
//
//  Created by Kevin McGladdery on 10/1/15.
//  Copyright © 2015 Kevin McGladdery. All rights reserved.
//

import UIKit

class CamerasViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      print(UIFont.familyNames())
      print(UIFont.fontNamesForFamilyName("Concourse T4"))
      navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "ConcourseT4", size: 20)!]
      self.navigationItem.leftBarButtonItem = self.editButtonItem()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToTable(segue: UIStoryboardSegue) {
      tableView.reloadData()
    }
  
  @IBAction func unwindAndAddCamera(segue: UIStoryboardSegue) {
    let source = segue.sourceViewController as! AddCameraController
    
    guard let newName = source.newCameraName else {
      tableView.reloadData()
      return
    }
    if newName.characters.count == 0 {
      tableView.reloadData()
      return }
    else {
    CameraStore.store += [Camera(name: newName)]
    CameraStore.save()
    tableView.reloadData()
    }
  }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CameraStore.store.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cameracell", forIndexPath: indexPath) as! CameraCell
        let camera = CameraStore.store[indexPath.row]
        // Configure the cell...
      
        cell.name.text = camera.name
        cell.notes.text = camera.notes
        cell.camera = camera
        cell.parentController = self
      
      if camera.loaded {
          let unloadColor = UIColor.init(red:0.804, green:0.000, blue:0.078, alpha:1.000)
          cell.loadingButton.setTitle("Unload", forState: UIControlState.Normal)
          cell.loadingButton.layer.borderWidth = 1
          cell.loadingButton.layer.cornerRadius = 15
          cell.loadingButton.layer.borderColor = unloadColor.CGColor
          cell.loadingButton.setTitleColor(unloadColor, forState: .Normal)
      } else {
          let loadColor = UIColor.init(red:0.086, green:0.651, blue:0.341, alpha:1.000)
          cell.loadingButton.setTitle("Load", forState: UIControlState.Normal)
          cell.loadingButton.layer.borderWidth = 1
          cell.loadingButton.layer.cornerRadius = 15
          cell.loadingButton.layer.borderColor = loadColor.CGColor
          cell.loadingButton.setTitleColor(loadColor, forState: .Normal)
      }

        return cell
    }

  func loadCamera(camera: Camera) {
    performSegueWithIdentifier("loadCameraSegue", sender: camera)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "loadCameraSegue" {
      let cam = sender as! Camera
      let dest = segue.destinationViewController as! LoadCameraController
      dest.camera = cam
    }
  }
  
  func unloadCamera(camera: Camera) {
    camera.loaded = false
    camera.notes = "empty"
    tableView.reloadData()
  }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
  
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            CameraStore.store.removeAtIndex(indexPath.row)
            CameraStore.save()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let movingCamera = CameraStore.store[fromIndexPath.row]
        CameraStore.store.removeAtIndex(fromIndexPath.row)
        CameraStore.store.insert(movingCamera, atIndex: toIndexPath.row)
        CameraStore.save()
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
