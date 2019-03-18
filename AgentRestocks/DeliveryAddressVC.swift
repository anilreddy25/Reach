//
//  DeliveryAddressVC.swift
//  AgentRestocks
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import Alamofire
import AlamofireImage

class DeliveryAddressVC: UIViewController,UITextFieldDelegate,CLLocationManagerDelegate,GMSMapViewDelegate {

    var welcomelatitude = NSString()
    var welcomelangitude = NSString()
    @IBOutlet weak var lblSet: UILabel!
    @IBOutlet weak var txtLocation: UITextField!
    
    @IBOutlet weak var txtHome: UITextField!
    
    @IBOutlet weak var txtLandMark: UITextField!
    
    @IBOutlet weak var txtStore: UITextField!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblhome: UILabel!
    
    @IBOutlet weak var lblLandMark: UILabel!
    
    @IBOutlet weak var lblSave: UILabel!
    
    var long_array = [CGFloat]()
    var address_array = [String]()
    var lat_float = CGFloat()
    var long_float = CGFloat()
    
    var locationManager = CLLocationManager()
    let marker = GMSMarker()
    
    private var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
    
    
    @IBOutlet weak var GmsMapviewfinal: GMSMapView!
    
    
    @IBOutlet weak var btnUpdateLocation: UIButton!
    
    
    var Savedbutton = String()
    
    var setuserdefaults = UserDefaults.standard
    
    var storingLocationDetails = UserDefaults.standard
    
    var Locationfinal = String()
    var HouseNumber = String()
    var Landmarkfinal = String()
    var setLocationClikonefinal = String()
    var selectBusinessstring = String()
    var addanotherfisrt = String()
    
    var firsttimesett = String()
   
    @IBOutlet weak var picodelabel: UILabel!
    
    @IBOutlet weak var pincodetextfiled: UITextField!
    
    var demostringvalue = String()
    
    
    
    
    var citytwo = String()
    var state = String()
    var Billingdicttwo = NSDictionary()
    var Billingdictone = NSDictionary()
    
    var Deliverydicttwo = NSDictionary()
    var Deliverydictone = NSDictionary()
    
    var Deliverydictthree = NSDictionary()
    var Deliverydictfour = NSDictionary()
    
    var devlievrystringsingel = String()
    var deliverytwovalue = String()

    
    var dictlat = String()
    var dictlang = String()
    var editbillinglocation = String()
    var zipcodefinalvalue = String()
    var billingstringfinalvalue = String()
    
    var firstdict = NSDictionary()
    var Secondtdict = NSDictionary()

    var useridbiling1 = String()
    
    
    
    //// Mutabelarray allocation
    
    var DeliveryaccountDictfinal  = NSMutableDictionary()

    var timerDeliverytwo = Timer()

    var timersinelone = Timer()

    var timersineltwo = Timer()
    var coverView = UIView()
    var imageView = UIImageView()
    @IBOutlet weak var verfyalertview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        GmsMapviewfinal.delegate = self
        GmsMapviewfinal.settings.myLocationButton = true
        GmsMapviewfinal.isMyLocationEnabled = true
        
        txtLocation.delegate = self
        txtHome.delegate = self
        txtStore.delegate = self
        txtLandMark.delegate = self
        
        txtLocation.useUnderlinetwo()
        txtHome.useUnderlinetwo()
        self.txtStore.useUnderlinetwo()
        self.txtLandMark.useUnderlinetwo()
        self.pincodetextfiled.useUnderlinetwo()

        self.determineMyCurrentLocation()
        
        txtStore.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = #imageLiteral(resourceName: "Map")
        txtStore.leftView = imageView

//        DeliveryAddressVCfinal.demostringvalue = "ButtonBillingadressvalue"

        if self.demostringvalue == "ButtonBillingadressvalue"
        {
            self.btnUpdateLocation.setTitle("Update billing Location", for:.normal)
        }
        else if self.demostringvalue == "ButtonDeliveradressvalue"
        {
            self.btnUpdateLocation.setTitle("Update Delivery Location", for:.normal)
        }

        else if self.demostringvalue == "ButtonDeliverytwoadressvalue"
        {
            self.btnUpdateLocation.setTitle("Update Delivery Location", for:.normal)
        }
        
        txtStore.delegate = self
        txtStore.addTarget(self, action: #selector(DeliveryAddressVC.textFieldDidChange(_:)), for: .editingChanged)
        
        txtLocation.delegate = self
        txtLocation.addTarget(self, action: #selector(DeliveryAddressVC.textFieldDidChange(_:)), for: .editingChanged)
        
        txtHome.delegate = self
        txtHome.addTarget(self, action: #selector(DeliveryAddressVC.textFieldDidChange(_:)), for: .editingChanged)
        
        
        txtLandMark.delegate = self
        txtLandMark.addTarget(self, action: #selector(DeliveryAddressVC.textFieldDidChange(_:)), for: .editingChanged)
        
        
        pincodetextfiled.delegate = self
        pincodetextfiled.addTarget(self, action: #selector(DeliveryAddressVC.textFieldDidChange(_:)), for: .editingChanged)
        
      
    }

    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        if (txtStore.text?.count)! < 0
        {
            lblSave.isHidden = false
            lblSave.textColor = UIColor.red
            lblSave.text = "Enter Shop Number"
        }
        if (txtStore.text?.count)! > 1
        {
            lblSave.isHidden = true
            lblSave.textColor = UIColor.red
            lblSave.text = "Enter Shop Number"
        }
        if (txtLocation.text?.count)! < 0
        {
            lblLocation.isHidden = false
            lblLocation.textColor = UIColor.red
            lblLocation.text = "Enter Location"
        }
        if (txtLocation.text?.count)! > 1
        {
            lblLocation.isHidden = true
            lblLocation.textColor = UIColor.red
            lblLocation.text = "Enter Location"
        }
        if (txtLandMark.text?.count)! < 0
        {
            lblLandMark.isHidden = false
            lblLandMark.textColor = UIColor.red
            lblLandMark.text = "Enter Landmark"
            
        }
        if (txtLandMark.text?.count)! > 1
        {
            lblLandMark.isHidden = true
            lblLandMark.textColor = UIColor.red
            lblLandMark.text = "Enter Landmark"
        }
        if (txtHome.text?.count)! < 0
        {
            lblhome.isHidden = false
            lblhome.textColor = UIColor.red
            lblhome.text = "Enter Plot Number"
        }
        if (txtHome.text?.count)! > 1
        {
            lblhome.isHidden = true
            lblhome.textColor = UIColor.red
            lblhome.text = "Enter Plot Number"
        }
        if (pincodetextfiled.text?.count)! < 0
        {
            picodelabel.isHidden = false
            picodelabel.textColor = UIColor.red
            picodelabel.text = "Enter Plot Number"
        }
        if (pincodetextfiled.text?.count)! > 1
        {
            picodelabel.isHidden = true
            picodelabel.textColor = UIColor.red
            picodelabel.text = "Enter Plot Number"
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        locationManager.startUpdatingLocation()
        //locationManager.stopUpdatingLocation()
        welcomelatitude = String(userLocation.coordinate.latitude) as NSString
        welcomelangitude  = String(userLocation.coordinate.longitude)as NSString
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(welcomelatitude as String)!, longitude:CLLocationDegrees(welcomelangitude as String)!, zoom:15.0)
        self.GmsMapviewfinal.camera = camera
        self.locationManager.stopUpdatingLocation()
    }
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        let destinationMarker = GMSMarker()
        destinationMarker.position = position.target
        lat_float = CGFloat(destinationMarker.position.latitude)
        long_float = CGFloat(destinationMarker.position.longitude)
        dictlat = String(destinationMarker.position.latitude)
        dictlang = String(destinationMarker.position.longitude)
        print(lat_float)
        print(long_float)
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat_float), longitude: CLLocationDegrees(long_float), zoom:  mapView.camera.zoom)
        
        GmsMapviewfinal.camera = camera
        
        let aGMSGeocoder: GMSGeocoder = GMSGeocoder()
        
        aGMSGeocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(lat_float),longitude: CLLocationDegrees(long_float))) { (place, error) in
            
            
            
            let gmsAdrees = place?.firstResult()
            let lines = gmsAdrees?.lines
            let LocalityPlace = gmsAdrees?.locality
            let SubLocalityLocality = gmsAdrees?.subLocality
            let subHouseNumber = gmsAdrees?.thoroughfare
            let zipcodefinalvalue = gmsAdrees?.postalCode
            print(zipcodefinalvalue)
         
            
            if let localityfinal:String = gmsAdrees?.subLocality
            {
                self.txtLandMark.text = localityfinal
                //                    @IBOutlet weak var lblLandMark: UILabel!
                //@IBOutlet weak var lblSave: UILabel!
                self.lblLandMark.isHidden = true
                self.lblLandMark.text = "Enter Landmark"
                
            }
            if let localityfinaltwo:String = gmsAdrees?.locality
            {
                self.citytwo = localityfinaltwo
                
                
            }
            
            if let administrativeAreafinal:String = gmsAdrees?.administrativeArea
            {
                self.state = administrativeAreafinal
                
                
            }
            if let subHouseNumber:String = gmsAdrees?.thoroughfare
            {
                self.txtHome.text = subHouseNumber
                self.lblhome.text = "Enter Plot Number"
                self.lblhome.isHidden = true
            }
            
            if let subHousepostalCode:String = gmsAdrees?.postalCode
            {
                //                    self.txtHome.text = subHousepostalCode
                //                    self.lblhome.text = "Enter Plot Number"
                //                    self.lblhome.isHidden = true
                self.zipcodefinalvalue = subHousepostalCode
                self.pincodetextfiled.text = subHousepostalCode
                
            }
            
            if lines != nil {
                if lines?.count == 1 {
                    self.txtLocation.text = NSString(format: "%@", lines![0]) as String
                }
                else {
                    self.txtLocation.text = NSString(format: "%@,%@", lines![0],lines![1]) as String
                }
                
            }
            else {
                self.lblLocation.text = "No Location Found"
            }
        }
    }
  
    @IBAction func updateLocation(_ sender: UIButton)
    {
        let userdefaultsingel = UserDefaults.standard
        
        if (txtLocation.text?.count)! < 1
        {
            lblLocation.isHidden = false
            lblLocation.textColor = UIColor.red
        }
        if (txtHome.text?.count)! < 1
        {
            lblhome.isHidden = false
            lblhome.textColor = UIColor.red
        }
        if (txtLandMark.text?.count)! < 1
        {
            lblLandMark.isHidden = false
            lblLandMark.textColor = UIColor.red
            lblLandMark.text = "Enter Plot Number"
            
        }
        if (txtStore.text?.count)! < 1
        {
            lblSave.isHidden = false
            lblSave.textColor = UIColor.red
            lblSave.text = "Enter Shop Name"
            
        }
        if (pincodetextfiled.text?.count)! < 1
        {
            picodelabel.isHidden = false
            picodelabel.textColor = UIColor.red
            picodelabel.text = "Enter PinCode"
            
        }
        
        if (txtLocation.text?.count)! > 1 && (txtHome.text?.count)! > 1
            && (txtLandMark.text?.count)! > 1 && (txtStore.text?.count)! > 1 && (pincodetextfiled.text?.count)! > 1
        {
            
            
            let singeldefaults = UserDefaults.standard
                singeldefaults.set(self.firstdict, forKey: "finaldictvalue")
            singeldefaults.synchronize()
            
        self.firstdict = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang,"pincode":self.pincodetextfiled.text!] as NSDictionary
 self.Secondtdict = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
            
            
            self.firstdict = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang,"pincode":self.pincodetextfiled.text!] as NSDictionary
            self.Secondtdict = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
            
            
            
            self.Deliverydictone = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang,"pincode":self.pincodetextfiled.text!] as NSDictionary
            self.Deliverydicttwo = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
            
            self.Deliverydictone = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang,"pincode":self.pincodetextfiled.text!] as NSDictionary
            self.Deliverydicttwo = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
            
            
            self.Deliverydictthree = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang,"pincode":self.pincodetextfiled.text!] as NSDictionary
            self.Deliverydictfour = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
            
         
            if self.demostringvalue == "ButtonBillingadressvalue"
            {
                self.updatebillingadress()
                
            }
            else if self.demostringvalue == "ButtonDeliveradressvalue"
                
            {
                self.updateDeliveryadressone()
            }
                
            else if self.demostringvalue == "ButtonDeliverytwoadressvalue"
            {
                self.updateDeliveryadresstwo()
            }
          
            }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            manager.startUpdatingLocation()
            break
        case .restricted:
            break
        case .denied:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    
    func viewWillAppear(animated: Bool)
    {
        setuserdefaults = UserDefaults.standard
        let valuesetuserdeafultsvalue = UserDefaults.value(forKey:"MyaddAnotherLocation")as!String
        print(valuesetuserdeafultsvalue)
        if setuserdefaults.value(forKey: "MyaddAnotherLocation") != nil {
         if let addanother:String = setuserdefaults.value(forKey: "MyaddAnotherLocation") as? String
            {
                print(addanother)
                if addanother != "" {
                    txtLocation.text = nil
                    txtHome.text = nil
                    txtLandMark.text = nil
                    txtStore.text = nil
                }
            }
        }
        super.viewWillAppear(animated)
    }
    func updatebillingadress()
    {
        self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        
        DeliveryaccountDictfinal.addEntries(from:self.firstdict as! [AnyHashable : Any])
        
        DeliveryaccountDictfinal.addEntries(from:self.Secondtdict as! [AnyHashable : Any])

        print(DeliveryaccountDictfinal)
        
        let jsonData = try? JSONSerialization.data(withJSONObject:self.DeliveryaccountDictfinal, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        let postString =  String(format:"method=%@&agentid=%@&json=%@","billingAddress",  self.useridbiling1,jsonString!)
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        timerDeliverytwo = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerActiontwo), userInfo: nil, repeats: false)

        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                }
                break
            case .failure(_):
                
                DispatchQueue.main.async {
            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
                }
                break
                
                
                
            }
        }
        
    }
    
    @objc func timerAction()
    {
        DispatchQueue.main.async {
            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
            
        }
    }
    @objc func timerAction1()
    {
        DispatchQueue.main.async {
            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
        }
    }
    @objc func timerActiontwo()
    {
        self.removeSpinner()
        

        DispatchQueue.main.async {
            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
        }
    }
    @objc func timerActionthree()
    {
        DispatchQueue.main.async {
            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
        }
    }
    
    
    func updateDeliveryadressone()
    {
        
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
   
        DeliveryaccountDictfinal.addEntries(from:self.Deliverydicttwo as! [AnyHashable : Any])
        
        DeliveryaccountDictfinal.addEntries(from:self.Deliverydictone as! [AnyHashable : Any])
        
        print(DeliveryaccountDictfinal)
        
        let jsonData = try? JSONSerialization.data(withJSONObject:self.DeliveryaccountDictfinal, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        let postString =  String(format:"method=%@&agentid=%@&json=%@","deliveryAddress1",  self.useridbiling1,jsonString!)
        
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
timersinelone = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerActiontwo), userInfo: nil, repeats: false)
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):

                if let dict:NSDictionary = response.result.value as? NSDictionary {

                }
                break
            case .failure(_):
                break



            }
        }

    }

    func updateDeliveryadresstwo()
    {
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }

        DeliveryaccountDictfinal.addEntries(from:self.Deliverydictthree as! [AnyHashable : Any])
        
        DeliveryaccountDictfinal.addEntries(from:self.Deliverydictfour as! [AnyHashable : Any])
        
        print(DeliveryaccountDictfinal)
        let jsonData = try? JSONSerialization.data(withJSONObject:self.DeliveryaccountDictfinal, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        let postString =  String(format:"method=%@&agentid=%@&json=%@","deliveryAddress2",  self.useridbiling1,jsonString!)
   
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        
        timersineltwo = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerActionthree), userInfo: nil, repeats: false)

        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):

                if let dict:NSDictionary = response.result.value as? NSDictionary {

                  print(dict)
                }
                break
            case .failure(_):
                break



            }
        }

    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.verfyalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    
    
}
