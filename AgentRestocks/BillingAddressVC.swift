//
//  BillingAddressVC.swift
//  AgentRestocks
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

protocol BillingAddressDelegate {
    func textField(text: String) ;
}

class BillingAddressVC: UIViewController,UITextFieldDelegate,CLLocationManagerDelegate,GMSMapViewDelegate {
    
    
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
    
    
    @IBOutlet weak var btnSaveandProceed: UIButton!
    
    
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

    
    
    var dictlat = String()
    var dictlang = String()
    var editbillinglocation = String()
    var zipcodefinalvalue = String()
    var billingstringfinalvalue = String()
    
    var firstdict = NSDictionary()
    var Seconddict = NSDictionary()
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
        self.determineMyCurrentLocation()
        
        txtStore.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = #imageLiteral(resourceName: "Map")
        txtStore.leftView = imageView


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.txtLocation
        {
            if (textField.text?.count)! > 1
            {
                lblLocation.isHidden = true
                // lblLocation.textColor = UIColor.red
            }
            else{
                lblLocation.isHidden = false
                lblLocation.textColor = UIColor.red
                
            }
        }
        if textField == self.txtHome
        {
            if (textField.text?.count)! > 1
            {
                lblhome.isHidden = true
            }
            else{
                lblLandMark.isHidden = false
                lblhome.textColor = UIColor.red
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == txtLandMark
        {
            if txtLandMark.text?.count == 0
            {
                lblLandMark.text = "Please enter LandMark Name"
                lblLandMark.textColor = UIColor.red
            }
            else if (txtLandMark.text?.count)! < 1
            {
                lblLandMark.text = "Please enter LandMark Name"
                lblLandMark.textColor = UIColor.red
            }else if (txtLandMark.text?.count)! > 1
            {
                lblLandMark.isHidden = true
            }
        }
        if textField == txtStore
        {
            if txtStore.text?.count == 0
            {
                lblSave.text = "Please enter LandMark Name"
                lblSave.textColor = UIColor.red
            }
            else if (txtStore.text?.count)! < 1
            {
                lblSave.text = "Please enter LandMark Name"
                lblSave.textColor = UIColor.red
            }else if (txtStore.text?.count)! > 1
            {
                lblSave.isHidden = true
            }
        }
        
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
        //  locationManager.stopUpdatingLocation()
        welcomelatitude = String(userLocation.coordinate.latitude) as NSString
        
        welcomelangitude  = String(userLocation.coordinate.longitude)as NSString
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(welcomelatitude as String)!, longitude:CLLocationDegrees(welcomelangitude as String)!, zoom:15.0)
        self.GmsMapviewfinal.camera = camera
        self.locationManager.stopUpdatingLocation()
        
    }
    
    
    
    
    
    
    
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//
//        let destinationMarker = GMSMarker()
//        destinationMarker.position = position.target
//        lat_float = CGFloat(destinationMarker.position.latitude)
//        long_float = CGFloat(destinationMarker.position.longitude)
//
//        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat_float), longitude: CLLocationDegrees(long_float), zoom:  mapView.camera.zoom)
//
//        GmsMapviewfinal.camera = camera
//
//        let aGMSGeocoder: GMSGeocoder = GMSGeocoder()
//
//        aGMSGeocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(lat_float),longitude: CLLocationDegrees(long_float))) { (place, error) in
//
//            let gmsAdrees = place?.firstResult()
//
//            let lines = gmsAdrees?.lines
//            let LocalityPlace = gmsAdrees?.locality
//            let SubLocalityLocality = gmsAdrees?.subLocality
//            let subHouseNumber = gmsAdrees?.thoroughfare
//
//            if let localityfinal:String = gmsAdrees?.subLocality
//            {
//                self.txtLandMark.text = localityfinal
//
//            }
//            if let subHouseNumber:String = gmsAdrees?.thoroughfare
//            {
//                self.txtHome.text = subHouseNumber
//            }
//            if lines != nil {
//                if lines?.count == 1 {
//                    self.txtLocation.text = NSString(format: "%@", lines![0]) as String
//                }
//                else {
//                    self.txtLocation.text = NSString(format: "%@,%@", lines![0],lines![1]) as String
//                }
//            }
//            else {
//                self.lblLocation.text = "No Location Found"
//            }
//        }
//    }
//
    @IBAction func btnsaveandProceed(_ sender: UIButton)
    {
        let userdefaultsingel = UserDefaults.standard
        
        if (txtLocation.text?.characters.count)! < 1
        {
            lblLocation.isHidden = false
            lblLocation.textColor = UIColor.red
        }
        if (txtHome.text?.characters.count)! < 1
        {
            lblhome.isHidden = false
            lblhome.textColor = UIColor.red
        }
        
        if (self.txtLandMark.text?.isEmpty)!
        {
            self.lblLandMark.isHidden = false
            self.lblLandMark.text = "Enter LandMark"
            self.lblLandMark.textColor = UIColor.red
        }
        else if self.txtLandMark.text  != ""
        {
            self.lblLandMark.isHidden = true
        }
        
        if (self.txtStore.text?.isEmpty)!
        {
            self.lblSave.isHidden = false
            self.lblSave.text = "Enter Shop Number"
            self.lblSave.textColor = UIColor.red
        }
        else if self.txtStore.text  != ""
        {
            self.lblSave.isHidden = true
        }
            
        else
        {
            var singlvalue = String()
            if let Reviewid:String = userdefaultsingel.value(forKey: "MyaddAnotherLocation")as?String
            {
                
            }
            var array = [String]()
            var arraytwofianl = [String]()
            if firsttimesett == "firsttime"
            {
                let defaults = UserDefaults.standard
                array.append(txtLocation.text!)
                array.append(txtHome.text!)
                array.append(txtLandMark.text!)
                print(array)
                
                let CheckOutVC = self.storyboard?.instantiateViewController(withIdentifier:"CheckOut1VC") as!CheckOut1VC
                CheckOutVC.frist = "one"
                defaults.set(array, forKey: "arryone")
                
                userdefaultsingel.removeObject(forKey:"MyaddAnotherLocation")
                self.present(CheckOutVC, animated:true, completion:nil)
            }
            
//            if addanotherfisrt == "secondvalue"
//            {
//                let defaults = UserDefaults.standard
//                let CheckOutVC = self.storyboard?.instantiateViewController(withIdentifier:"CheckOut1VC") as!CheckOut1VC
//                arraytwofianl.append(txtLocation.text!)
//                arraytwofianl.append(txtHome.text!)
//                arraytwofianl.append(txtLandMark.text!)
//                print(arraytwofianl)
//                defaults.set(arraytwofianl, forKey: "MyarryTwofinal")
//                defaults.set(arraytwofianl, forKey: "arraytwofianlis")
//                userdefaultsingel.removeObject(forKey:"MyaddAnotherLocation")
//                self.present(CheckOutVC, animated:true, completion:nil)
//            }
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
    

   

}
