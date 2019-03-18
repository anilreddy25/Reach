//
//  HorizentalpickerViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 10/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class HorizentalpickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var rotationAngle: CGFloat!
    let width:CGFloat = 350
    let height:CGFloat = 350
    
    @IBOutlet weak var cityPickerfinal: UIPickerView!
    var byer = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        byer = ["1","2","3","4","5","6","7","8","9","10"]
    
        rotationAngle = -90 * (.pi/180)
        cityPickerfinal.transform = CGAffineTransform(rotationAngle: rotationAngle)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return byer.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)

        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height)
        label.textAlignment = .center
        label.font = UIFont (name: "Baskerville-Bold", size: 30)
        label.text = byer[row]
        view.addSubview(label)

        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return view
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
