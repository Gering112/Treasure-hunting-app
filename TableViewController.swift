//
//  TableViewController.swift
//  IOS Final
//
//  Created by Gering Dong on 2/13/19.
//  Copyright © 2019 Gering Dong. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tbtCell: UITableView!
    
    struct info:Codable {
        let title: String
        let hint:String
        let latitude:Double
        let longitude:Double
    }
    var dictionary = JSON()//JSON()
    
 
    
    var hint_title = ""
    var latitude = ""
    var longitude = ""
    var hint = ""
    var key = ""
    var check = 0
    
    var selectIndex = 0
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton_huntItems.sharedInstance.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = singleton_huntItems.sharedInstance.items[indexPath.row].title!
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this recipe?", preferredStyle: .alert)
//        let delete = UIAlertAction(title: "Yes", style: .default){(action) in
//            singleton_huntItems.sharedInstance.items.remove(at: indexPath.row)
//            self.tbtCell?.deleteRows(at: [indexPath], with: .automatic)
//        }
//        let cancelAction = UIAlertAction(title:"No", style: .default, handler: nil)
//        alert.addAction(delete)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
//
//        return [delete]
//
//    }
//    

    

    

    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // gets the data

        UserDefaults.standard.set(self.key, forKey: "key")
        
        print("key is " + self.key)
        let parameters = ["key": self.key]
        //let base_url = "http://www.tageninformatics.com/client/jwu/hunt/retrieve"
        AF.request("http://www.tageninformatics.com/client/jwu/hunt/retrieve", method: .get, parameters:parameters).response { response in
            
            print(response)
            var r = JSON (response.result.value as Any)
            self.dictionary = JSON(response.data!)
            DispatchQueue.main.async {
                self.tbtCell.reloadData()
            }
            self.post = r["title"]
            print(r)
            }.resume()
        
    }
//        let riddle = huntItems(title: hint_title, hint: hint, latitude: Double(latitude)!, longitude: Double(longitude)!)
//
//        var riddle2 = huntItems(title: hint_title, hint: hint, latitude: Double(latitude)!, longitude: Double(longitude)!)
//        singleton_huntItems.sharedInstance.items.append(riddle)
//        singleton_huntItems.sharedInstance.items.append(riddle2)
//        print("hiiii")
//        print(singleton_huntItems.sharedInstance.items)
//
//
        

        // Do any additional setup after loading the view.


}
