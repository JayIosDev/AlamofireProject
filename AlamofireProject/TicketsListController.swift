//
//  TicketsListController.swift
//  AlamofireProject
//
//  Created by Jayaram G on 06/02/19.
//  Copyright © 2019 Jayaram G. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class TicketsListController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoadingTickets()
        // Do any additional setup after loading the view.
      self.tableViewOutlet.register(UINib(nibName: "TicketsCell", bundle: nil), forCellReuseIdentifier: "TicketsCell1")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketsCell1", for: indexPath) as! TicketsCell
        print(titleArray[indexPath.row])
        print(titleArray[indexPath.row])
        cell.TicketNumberlabel.text = titleArray[indexPath.row]
        
        return cell
    }
    
    
    var titleArray = [String]()
    
    func LoadingTickets(){
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { (response) in
            

            print(JSON())
            switch response.result {
            case .success(let value):
                let json = JSON(value)
              //  print(json)

                for jsonData in json.arrayValue{
                   
                   let titleValue = jsonData["title"].stringValue
                  // let idValue = jsonData["id"].intValue
                    self.titleArray.append(titleValue)
                  //  print(self.titleArray)

                }
                
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }

            //   print(json)
            case .failure(let error ):
                print(error.localizedDescription)

            }
        }
        
        
        
    }

}
