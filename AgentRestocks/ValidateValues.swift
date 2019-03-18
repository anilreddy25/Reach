//
//  ValidateValues.swift



import UIKit
//import SVProgressHUD
class ValidateValues: NSObject {
    class func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    class func validateMobileNumber(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    class func isValidMobileNumber(value: String) -> Bool {
        if value.characters.count == 10
        {
            return true
        }
        else{
            return false
        }
    }
    class func isPasswordSame(password: String , confirmPassword : String) -> Bool {
        if password == confirmPassword{
            return true
        }else{
            return false
        }
    }
    
    
    
        class func showAlertOnViewController(
            targetVC: UIViewController,
            title: String,
            message: String)
        {
            
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertControllerStyle.alert)
            alert.view.backgroundColor = UIColor.red
           alert.view.tintColor = UIColor.red
            alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor : UIColor.white]), forKey: "attributedTitle")
            alert.setValue(NSAttributedString(string: message, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16),NSAttributedStringKey.foregroundColor : UIColor.white]), forKey: "attributedMessage")
            let okButton = UIAlertAction(
                title:"OK",
                style: UIAlertActionStyle.default,
                handler:
                {
                    (alert: UIAlertAction!)  in
            })
            alert.addAction(okButton)
            targetVC.present(alert, animated: true, completion: nil)
        }
    class func showToast(title : String , view: UIView , backgroundColor: UIColor){
        
        let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height-200, width: 300, height: 35))

        toastLabel.backgroundColor = backgroundColor
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 10.0)
        toastLabel.text = title
         toastLabel.numberOfLines = 2
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
        
            toastLabel.removeFromSuperview()
        })
    }
    
    
    class func showToastInTinder(title : String , view: UIView , backgroundColor: UIColor){
        
        let toastLabel = UILabel(frame: CGRect(x: 50, y: view.frame.size.height-200, width: view.frame.size.width-100, height: 35))
        
        // view.frame.size.width/2 - 175
        
        toastLabel.backgroundColor = backgroundColor
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 10.0)
        toastLabel.text = title
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 2
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            
            toastLabel.removeFromSuperview()
        })
    }
   class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func rotate360Degrees(timeToRotate: Double,imageView:UIImageView) {
            let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            let radians = CGFloat.pi / 4
            rotateAnimation.fromValue = radians
            rotateAnimation.toValue = radians + .pi
            rotateAnimation.isRemovedOnCompletion = false
            rotateAnimation.duration = timeToRotate
            rotateAnimation.repeatCount=Float.infinity
            imageView.layer.add(rotateAnimation, forKey: nil)
        }
   class func setStatusBarBackgroundColor(color: UIColor) {
        guard  let statusBar = (UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject).value(forKey: "statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    class func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    class func animateLinear(duration: CFTimeInterval,imageViewLogo:UIImageView)
    {
        var id = CATransform3DIdentity
        id.m34 =  -1.0 / 1000
        
        let transformAnim            = CAKeyframeAnimation(keyPath:"transform")
        transformAnim.values         = [
            NSValue(caTransform3D: CATransform3DRotate(id, 0 * CGFloat(-M_PI_2), 0, 1.0, 0)),
            NSValue(caTransform3D: CATransform3DRotate(id, 1 * CGFloat(-M_PI_2), 0, 1.0, 0)),
            NSValue(caTransform3D: CATransform3DRotate(id, 0 * CGFloat(-M_PI_2), 0, 1.0, 0))
        ]
        transformAnim.keyTimes       = [0, 0.5, 1.0]
        transformAnim.repeatCount=Float.infinity
        transformAnim.duration       = duration
        
        imageViewLogo.layoutIfNeeded()
        
        imageViewLogo.layer.add(transformAnim, forKey: "transform")
    }
    
    
    
   class func isValidPincode(value: String) -> Bool {
        if value.characters.count == 6{
            return true
        }
        else{
            return false
        }
    }
    class func validatePANCardNumber(_ strPANNumber : String) -> Bool{
        let regularExpression = "[A-Z]{5}[0-9]{4}[A-Z]{1}"
        let panCardValidation = NSPredicate(format : "SELF MATCHES %@", regularExpression)
        return panCardValidation.evaluate(with: strPANNumber)
    }
    class  func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width:size.width * heightRatio, height:size.height * heightRatio)
        } else {
            newSize = CGSize(width:size.width * widthRatio,  height:size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x:0, y:0, width:newSize.width, height:newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    class func getIP()-> String? {
        
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next } // memory has been renamed to pointee in swift 3 so changed memory to pointee
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {  // String.fromCString() is deprecated in Swift 3. So use the following code inorder to get the exact IP Address.
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                    
                }
            }
            freeifaddrs(ifaddr)
        }
        
        return address
    }
    

   
}

