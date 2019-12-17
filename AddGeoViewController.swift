//
//  AddGeoViewController.swift
//  IOS Final
//
//  Created by Gering Dong on 2/14/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import UIKit

class AddGeoViewController: UIViewController {

 
    @IBOutlet weak var tblTitle: UILabel!
    @IBOutlet weak var txt_title: UITextField!
    @IBOutlet weak var tblLatitude: UILabel!
    @IBOutlet weak var txt_latitude: UITextField!
    @IBOutlet weak var tblLongitude: UILabel!
    @IBOutlet weak var txt_longitude: UITextField!
    @IBOutlet weak var txtCreate_hint: UITextView!
    
    
    var hint_description: String = "Hint:"
    var hint_title_input: String = ""
    var hint_latitude_input: String = ""
    var hint_longitude_input: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txt_title?.text = hint_title_input
        self.txt_latitude?.text = hint_latitude_input
        self.txt_longitude?.text = hint_longitude_input
        self.txtCreate_hint?.text = hint_description
        
    }
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "back_to_tabController", sender: self)
        let riddle = huntItems(title: txt_title.text!, hint: txtCreate_hint.text!, latitude: Double(txt_latitude.text as! String)!, longitude: Double(txt_longitude.text as! String)!)
        
//        let riddle2 = huntItems(title: txt_title.text!, hint: txtCreate_hint.text!, latitude: Double(txt_latitude.text as! String)!, longitude: Double(txt_longitude.text as! String)!)
//
        singleton_huntItems.sharedInstance.items.append(riddle)
//        singleton_huntItems.sharedInstance.items.append(riddle2)
        print("hiiii")
        print(singleton_huntItems.sharedInstance.items)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back_to_tableView"{
            let destinationViewController = segue.destination as! TableViewController
            destinationViewController.hint_title = self.txt_title.text!
            destinationViewController.latitude = self.txt_latitude.text!
            destinationViewController.longitude = self.txt_longitude.text!
            destinationViewController.hint = self.txtCreate_hint.text!
        }
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Cancel", message: "Are you sure you want to discard these changes?", preferredStyle: .alert)
        
        let Yes = UIAlertAction(title: "Yes", style: .default){(action) in
            self.dismiss(animated: true, completion: nil)
        }
        let No = UIAlertAction(title:"No", style: .default, handler: nil)
        
        alert.addAction(Yes)
        alert.addAction(No)
        present(alert, animated: true)
    }
    
    
}
