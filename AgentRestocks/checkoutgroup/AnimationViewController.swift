//
//  AnimationViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 09/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//
/// http://qaru.site/questions/120613/shake-animation-for-uitextfielduiview-in-swift
//https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwimh_3677LgAhWLbX0KHfv-CRgQjhx6BAgBEAM&url=https%3A%2F%2Fmedium.com%2Fswift-programming%2Fswift-enums-and-uitableview-sections-1806b74b8138&psig=AOvVaw1yFrDmglJp_YXjGkLh950i&ust=1549946795350100

// http://sweettutos.com/2016/02/23/how-to-play-sounds-files-and-manage-duration-progress-avaudioplayer-tutorial/

/// https://www.innofied.com/creating-old-style-message-bubble-swift/


import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var mydemofinalavlue: UIView!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.mydemofinalavlue.shake()
        self.mydemofinalavlue.shake(count: 5, for: 1.5, withTranslation: 10)

    }
    

}
public extension UIView {
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
}
