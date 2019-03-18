//
//  singlpopupfinalViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 30/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
/// https://stackoverflow.com/questions/24102191/make-a-uibutton-programmatically-in-swift/40350949
class singlpopupfinalViewController: UIViewController {
    @IBOutlet weak var mysingelpopupbutton: UIButton!
    
    @IBOutlet weak var mysinglpopview: UIView!
    
    var ComboNamefinal = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    private func setupSegmentedControl() {
        // Configure Segmented Control
       
        mysingelpopupbutton.addTarget(self, action: #selector(
            singlpopupfinalViewController.deleteAction(sender:)), for: .touchUpInside)
    }
    private lazy var summaryViewController: singlpoptwoViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "singlpoptwoViewController") as! singlpoptwoViewController
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    private func add(asChildViewController viewController: UIViewController)
    {
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    private func updateView() {
       
//            remove(asChildViewController: summaryViewController)
            add(asChildViewController: summaryViewController)
    }
    @objc func deleteAction(sender: UIButton)
    { updateView()
        
    }
    @objc func buttonClicked(sender:UIButton) {
        print("Button \(sender.tag) clicked")
        updateView()
    }

    @IBAction func singelpopupbutton(_ sender: Any)
    {
        updateView()

    }
    


    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
//        let defaulst = UserDefaults.standard
//            if let ComboNamefinal:String = defaulst.value(forKey: "1") as? String
//            {
//                self.ComboNamefinal = ComboNamefinal
//                print(self.ComboNamefinal)
//                self.mysingelpopupbutton.setTitle(self.ComboNamefinal, for:.normal)
//                
//            }
    }
    
    
    
    func Methdofinalavlue()
    {
        let defaulst = UserDefaults.standard
        if let ComboNamefinal:String = defaulst.value(forKey: "1") as? String
        {
            self.ComboNamefinal = ComboNamefinal
            print(self.ComboNamefinal)
            self.mysingelpopupbutton.setTitle(self.ComboNamefinal, for:.normal)
        }
        let secodnd = singlpoptwoViewController()
        remove(asChildViewController:secodnd)
    }
    @IBAction func mysingelbutton(_ sender: UIButton)
    {
        
        
    }
    
    
}
