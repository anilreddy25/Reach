//
//  orederconfirmListViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orederconfirmListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var ordertopview: UIView!
    
    
    var courses = [String]()
    let cellId = "cellId"
    
    var anotherList = [Expand]()
    var lab4 = UIButton()
    
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var orderListtabelview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordertopview.layer.shadowOffset = CGSize(width: 0, height: 2)
        ordertopview.layer.shadowOpacity = 0.3
        ordertopview.layer.shadowRadius = 1.0
        ordertopview.layer.borderColor = UIColor.color2().cgColor
        ordertopview.layer.shadowColor = UIColor.color2().cgColor
        
           anotherList = [Expand(isExpand:true,name:[Course(id:"1000425168",name:"Rajadhani traders",qty:"6 Qty", items:"2 Items", price:"1,313.42",files:[exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Seller:mmdsdssd"),exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Seller:mmdsdssd")])]),Expand(isExpand:true,name:[Course(id:"1000425169",name:"Venkataramana traders",qty:"6 Qty", items:"2 Items", price:"1,313.42",files:[exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Seller:mmdsdssd"),exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Sellermultiplevalue:mmdsdssd")])]),Expand(isExpand:true,name:[Course(id:"1000425170",name:"NumberMall",qty:"6 Qty", items:"2 Items", price:"1,313.42",files:[exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Sellersingelvalue:mmdsdssd"),exp(name:"Popicorn piri piri masala",price:"114.00",qty:"44 Qty",descrip:"Sellerfinalvalue:mmdsdssd")])])]
            self.orderListtabelview.showsVerticalScrollIndicator = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion:nil)
        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int
    {
        
        return anotherList.count
    }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view1 = UIButton()
        let lab = UILabel(frame: CGRect(x: 15, y: 5, width: 200, height: 30))
        lab.textColor = UIColor.black
        lab.font = UIFont(name:"Arial-Bold", size: 14.5)
        let lab1 = UILabel(frame: CGRect(x: 15, y: 32, width: 200, height: 30))
        lab1.textColor = UIColor.color3()
        lab1.font = UIFont(name:"Arial", size: 14.5)
        let lab2 = UILabel(frame: CGRect(x: 15, y: 60, width: 200, height: 30))
        lab2.font = UIFont(name:"Arial", size: 14.5)
        lab2.textColor = UIColor.black
        let lab3 = UILabel(frame: CGRect(x:200, y: 35, width: 100, height: 30))
        lab3.textColor = UIColor.black
        lab3.font = UIFont(name:"Arial-Bold", size: 14.5)
        lab4 = UIButton(frame: CGRect(x:290, y: 35, width:25, height:25))
      //  lab4.titleLabel?.font =  UIFont(name:"Arial-Bold", size: 14.5)
        
//        let labelFont = UIFont(name: "Arial-Bold")
//        lab4.titleLabel?.font = labelFont.boldSystemFont(ofSize: 14.5)

        
        lab4.setBackgroundImage(#imageLiteral(resourceName: "angle-arrowup"), for:.normal)
        for i in anotherList[section].name {
            lab.text = i.name
            lab1.text = "\(i.items) | \(i.qty)"
            lab2.text = i.id
            lab3.text = "\u{20B9} \(i.price)"
        }
        view1.addSubview(lab)
        view1.addSubview(lab1)
        view1.addSubview(lab2)
        view1.addSubview(lab3)
        view1.addSubview(lab4)
        
        
        view1.backgroundColor = UIColor(red: 237/255.0, green: 240/255.0, blue: 239/255.0, alpha: 1.0)
        view1.tag = section
        // view1.addTarget(self, action: #selector(handleClose(button:)), for: .touchUpInside)
        lab4.addTarget(self, action: #selector(handleClosetwo(button:)), for: .touchUpInside)
        lab4.tag = section
        return view1
    }
    @objc func handleClosetwo(button:UIButton) {
        var indexPaths = [IndexPath]()
        let section = button.tag
        
        for row in anotherList[section].name[0].files.indices {
            print(0,row)
            indexPaths.append(IndexPath(row: row, section: section))
        }
        let expands = anotherList[section].isExpand
        anotherList[section].isExpand = !expands
        if expands {
            orderListtabelview.deleteRows(at: indexPaths, with: .fade)
        }
        else{
            orderListtabelview.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    @objc func handleClose(button:UIButton) {
        var indexPaths = [IndexPath]()
        let section = button.tag
        
        for row in anotherList[section].name[0].files.indices {
            print(0,row)
            indexPaths.append(IndexPath(row: row, section: section))
        }
        let expands = anotherList[section].isExpand
        anotherList[section].isExpand = !expands
        if expands {
            orderListtabelview.deleteRows(at: indexPaths, with: .fade)
        }
        else{
            orderListtabelview.insertRows(at: indexPaths, with: .fade)
        }
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
     {
        return 100
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        if !anotherList[section].isExpand
        {
            return 0
        }
        return anotherList[section].name[0].files.count
    }
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
     {
        
        return 1.0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ExpTableViewCell
        let file = anotherList[indexPath.section].name[0].files[indexPath.row]
        cell.name?.text = file.name
       // cell.price.text = "\u{20B9}\(file.price)  \(file.qty)"
        cell.price.text = "\u{20B9}\(file.price)"
        cell.quantitylabel.text = file.qty
        cell.descp.text = file.descrip
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
        return 80.0
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let viewone = self.storyboard?.instantiateViewController(withIdentifier:"secondViewController")as!secondViewController
        let file = anotherList[indexPath.section].name[0].files[indexPath.row]
        
        viewone.viewonefinal = file.name
        viewone.viewtwo = file.qty
        let value = file.descrip
        
        viewone.viewthree = value
        
        //        let id : String
        //        let name : String
        //        let qty : String
        //        let items : String
        //        let price : String
        //        var files : [exp]
        
        self.present(viewone, animated:true, completion:nil)
        
        
    }
    
    
    @IBAction func sahrebutton(_ sender: UIButton)
    {
        
    }

}
