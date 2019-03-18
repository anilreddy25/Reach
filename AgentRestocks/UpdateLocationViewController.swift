//
//  UpdateLocationViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 15/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation


class UpdateLocationViewController: UIViewController, UITextFieldDelegate,CLLocationManagerDelegate,GMSMapViewDelegate{

    @IBOutlet weak var updateview: UIView!
    
    @IBOutlet weak var btnSaveandProceed: UIButton!
    
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
    
    
    @IBOutlet weak var btnsetLocationsaved: UIButton!
    
    
   
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
    
    var firstdict = NSDictionary()
    var Seconddict = NSDictionary()
    
    
    var dictlat = String()
    var dictlang = String()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateview.layer.shadowOffset = CGSize(width: 0, height: 2)
        updateview.layer.shadowOpacity = 0.3
        updateview.layer.shadowRadius = 1.0
        updateview.layer.borderColor = UIColor.color2().cgColor
        updateview.layer.shadowColor = UIColor.color2().cgColor
        
        
        
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
        // scrollView.delegate = self
        self.determineMyCurrentLocation()
        
        txtStore.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = #imageLiteral(resourceName: "Map")
        txtStore.leftView = imageView
        
        print(addanotherfisrt)
        print(firsttimesett)
        
        txtLocation.delegate = self
        txtLocation.addTarget(self, action: #selector(UpdateLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtHome.delegate = self
        txtHome.addTarget(self, action: #selector(UpdateLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
       
        txtLandMark.delegate = self
        txtLandMark.addTarget(self, action: #selector(UpdateLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        txtStore.delegate = self
        txtStore.addTarget(self, action: #selector(UpdateLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
        
    }
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        if textField == txtLocation
        {
            lblLocation.isHidden = true
            lblLocation.textColor = UIColor.red
        }
        if textField == txtHome
        {
            lblhome.isHidden = true
            lblhome.textColor = UIColor.red
        }
        if textField == txtLandMark
        {
            lblLandMark.isHidden = true
            lblLandMark.textColor = UIColor.red
        }
        if textField == txtStore
        {
            lblSave.isHidden = false
            lblSave.textColor = UIColor.black
        }
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    @IBAction func Saveprocessor(_ sender: UIButton)
    {
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
            
        }
        if (txtStore.text?.count)! < 1
        {
            lblSave.isHidden = false
            lblSave.textColor = UIColor.red
            lblSave.text = "Enter Shop Number"
            
        }
        else {
            let EditAccount = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
            EditAccount.updatevalue = "singelvalue"
            self.present(EditAccount, animated: true, completion:nil)
            
            
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
   
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        let destinationMarker = GMSMarker()
        destinationMarker.position = position.target
        lat_float = CGFloat(destinationMarker.position.latitude)
        long_float = CGFloat(destinationMarker.position.longitude)
        dictlat = String(destinationMarker.position.latitude)
        dictlang = String(destinationMarker.position.longitude)
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat_float), longitude: CLLocationDegrees(long_float), zoom:  mapView.camera.zoom)
        
        GmsMapviewfinal.camera = camera
        
        let aGMSGeocoder: GMSGeocoder = GMSGeocoder()
        
        aGMSGeocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(lat_float),longitude: CLLocationDegrees(long_float))) { (place, error) in
            
            
            
            let gmsAdrees = place?.firstResult()
            let lines = gmsAdrees?.lines
            let LocalityPlace = gmsAdrees?.locality
            let SubLocalityLocality = gmsAdrees?.subLocality
            let subHouseNumber = gmsAdrees?.thoroughfare
            
            
            if let localityfinal:String = gmsAdrees?.subLocality
            {
                self.txtLandMark.text = localityfinal
                
            }
            if let subHouseNumber:String = gmsAdrees?.thoroughfare
            {
                self.txtHome.text = subHouseNumber
                
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
}
