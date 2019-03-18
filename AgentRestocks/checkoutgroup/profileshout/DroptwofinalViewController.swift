
//
//  DroptwofinalViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 22/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class DroptwofinalViewController: UIViewController,HADropDownDelegate
{
    @IBOutlet weak var dropDown: HADropDown!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dropDown.items = ["Reshout", "Reshout with comment"]
        dropDown.delegate  = self
    }
    func didSelectItem(dropDown: HADropDown, at index: Int)
    {
        print("Item selected at index \(index)")
        if index == 0
        {
            DispatchQueue.main.async
                {
                    print(index)
                    let HomeViewControllerfinal = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                    self.present(HomeViewControllerfinal, animated:true, completion:nil)
            }
        }
        if index == 1
        {
            print(index)
            DispatchQueue.main.async
                {
                    print(index)
                    let HomeViewControllerfinal = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                    
                    self.present(HomeViewControllerfinal, animated:true, completion:nil)
            }
        }
        }
}
