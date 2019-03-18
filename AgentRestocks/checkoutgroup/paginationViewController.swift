//
//  paginationViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 10/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class paginationViewController: UIViewController {

    @IBOutlet weak var aTableView: UITableView!
    
    var privateList = [String]()
    var fromIndex = 0
    let batchSize = 20
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       aTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        privateList.removeAll()
        loadMoreItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadMoreItems() {
        
        //let endIndex = min(totalItems, fromIndex + batchSize)
        
        //        for i in fromIndex ..< endIndex {
        //            privateList.append(String(i))
        //        }
        
        //print("Loading items form \(fromIndex) to \(endIndex - 1)")
        
        //fromIndex = endIndex
        //aTableView.reloadData()
        
        
        loadItemsNow(listType: "privateList")
    }
    
    func loadItemsNow(listType:String){
        //myActivityIndicator.startAnimating()
        
        let listUrlString = "http://infavori.com/json2.php?batchSize=" + String(fromIndex + batchSize) + "&fromIndex=" + String(fromIndex) + "&listType=" + listType
        let myUrl = NSURL(string: listUrlString);
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "GET";
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error!.localizedDescription)
                //                dispatch_async(dispatch_get_main_queue(),{
                //                    //self.myActivityIndicator.stopAnimating()
                //                })
                
                return
            }
            
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                
                if let parseJSON = json {
                    
                    var items = self.privateList
                    
                    
                    items.append(contentsOf:parseJSON as! [String])

                    if self.fromIndex < items.count {
                        
                        self.privateList = items
                        self.fromIndex = items.count
                        
                        DispatchQueue.main.async {
                            self.aTableView.reloadData()
                            
                        }
                        //                        dispatch_async(dispatch_get_main_queue(),{
                        //                            //self.myActivityIndicator.stopAnimating()
                        //                            //self.myTableView.reloadData()
                        //                            self.aTableView.reloadData()
                        //                        })
                    }
                }
                
            } catch {
                print(error)
                
            }
        }
        
        task.resume()
    }
}

extension paginationViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return privateList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = privateList[indexPath.row]
        
        if indexPath.row == privateList.count - 1 { // last cell
            //if totalItems > privateList.count { //removing totalItems for always service call
            loadMoreItems()
            //}
        }
        
        return cell
    }
}
