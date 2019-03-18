
//
//  SetLocationViewController.swift
//  loginPageVC
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 apple. All rights reserved.

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import Alamofire
import AlamofireImage
import CoreLocation
import CoreFoundation
import CoreTelephony
import SystemConfiguration
import Reachability
import Foundation
import IQKeyboardManagerSwift

class SetLocationViewController: UIViewController,UITextFieldDelegate,CLLocationManagerDelegate,GMSMapViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource
{

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
    var editbillinglocation = String()
    var zipcodefinalvalue = String()
    var billingstringfinalvalue = String()

    
  ///  viewsingel.billingstringfinalvalue = "Billingstringfinalvalue"

    
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

    
    
    @IBOutlet weak var Enterarealabel: UILabel!
    
    @IBOutlet weak var Enterareapincode: UITextField!
    
    @IBOutlet weak var pincdoe: UILabel!
    
    @IBOutlet weak var Enterpincode: UITextField!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    @IBOutlet weak var viewtopview: UIView!
    
    @IBOutlet weak var selectarea: UILabel!
    
    
    @IBOutlet weak var middelview: UIView!
    
    @IBOutlet weak var middeltabelview: UITableView!
    @IBOutlet weak var viewbottomview: UIView!
    
    @IBOutlet weak var araeview: UIView!
    var areaname = [String]()
    
    var setuseridfinalvalue = String()
    var setMobilenumebrfinalvalue = String()

    @IBOutlet weak var viewfinalvalue: UIView!
   var optionsarray = NSArray()
    
    @IBOutlet weak var cameratabelview: UITableView!

    var profileselectedIndex :Int?

    var tapGesture = UITapGestureRecognizer()

    @IBOutlet weak var okbuttonfinalvalue: UIButton!
    
    var setLocationstring = String()
    
    var Clikckedstring = String()
    
    
    @IBOutlet weak var setLocationTopview: UIView!
    
    
    
    
    var Dictfinal  = NSMutableDictionary()

    var mymobilenumbervalue = String()
    
    
    var  AgentId = String()
    var  RoleId = String()
    var  Status = String()
    var  StatusMsg = String()

    var  StatusCode = String()
    var  UserId = String()
    var  pin = String()
    var  username = String()
    
    var Loginstrsucess = String()
    
    var Mymobilevalue = String()
    
    
    
    
    
    
    
    ///// setLogin
    
    
    var LoginidValue = String()
    var AgentIdValuefinalstring = String()
    
    var btnPWSHtwo = UIButton()
    var timerone = Timer()
    
    var demovalue = String()
    
    
    var Kycpending = NSNumber()
    
    var KycpendingRegisteredmessage = String()
    
    
    var defaultscatageoryid = String()
    
    var defaultsBrandsid = String()
    
    var defaultsBrandIdstring = String()
    var defBrandnamestring = String()
    var defBrandpathstring = String()
    var defCatIdstring = String()
    var defCatnamestring = String()
    var defCatpathstring = String()
    var cartcountstring = NSString()
    
    
    var Menudictfinalvalue = NSDictionary()
    
    var Profiledictfinalvalue = NSDictionary()
    
    var ProfileDelStatusvalue = String()
    
    var isverystring = String()
    
    var Kyc_statusstring = String()
    var Kyc_status_colorstring = String()
    
    var PinCode = String()
    var User_image = String()
    var User_name = String()
    var rating  = String()
    var Hero = String()
    var  navaitemarray = NSArray()
    var  navaitemid = NSArray()
    var  navaitemname = NSArray()
    var  navaitemname2 = NSArray()
    var  navaitemstatus = NSArray()
    var  navaitemsub_value = NSArray()
    var  navaitemsvalue = NSArray()
    
    var cashValuefinalstring = String()
    
    var LoginDicytvalue :[AnyObject] = []
    
    var LoginHeaderDicytvalue :[AnyObject] = []
    var authorisationvalue = NSArray()
    
    var authorisationToken = String()
    
    var demotwovalue  = String()
    
    
    var appversionName = String()
    var appMODelNumber = String()
    
  
    var PrivateIpAdress = String()
    var Macid = String()
    var DeviceType = String()
    
    var wifi = String()
    var simtype = String()
    var udidfinal = String()
    var app = UIApplication.shared.delegate as! AppDelegate
    var LoginstartingTime = String()
    var iosversionType = String()
    
    
    
    @IBOutlet weak var backalertviewfinal: UIView!
    
    @IBOutlet weak var backalerttopview: UIView!
    @IBOutlet weak var backalertmiddelview: UIView!
    
    @IBOutlet weak var backalertbottomview: UIView!
  
    var coverView = UIView()
    var imageView = UIImageView()
    
    @IBOutlet weak var setdeliveryLocation: UILabel!
    
    
    @IBOutlet weak var smalldotview: UIView!
    
    @IBOutlet weak var Demototal: UIView!
    var cartcountstring1 = NSNumber()
    
    var navavalueis = NSArray()
    

    var tapGestureFinalvalue = UITapGestureRecognizer()

    @IBOutlet weak var areafinalviewistotal: UIView!
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        GmsMapviewfinal.delegate = self
//        GmsMapviewfinal.settings.myLocationButton = true
//        GmsMapviewfinal.isMyLocationEnabled = true

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
        
       
        txtStore.delegate = self
        txtStore.addTarget(self, action: #selector(SetLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        txtLocation.delegate = self
        txtLocation.addTarget(self, action: #selector(SetLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        txtHome.delegate = self
        txtHome.addTarget(self, action: #selector(SetLocationViewController.textFieldDidChange(_:)), for: .editingChanged)

        
        txtLandMark.delegate = self
        txtLandMark.addTarget(self, action: #selector(SetLocationViewController.textFieldDidChange(_:)), for: .editingChanged)
     
        self.Enterareapincode.useUnderline()
        self.Enterpincode.useUnderline()
        self.scrollview.delegate = self
        if view.frame.size.width < 800 {
          
        scrollview.contentSize = CGSize(width: self.view.frame.size.width, height:550)
        scrollview.showsVerticalScrollIndicator = false
        }
        
        self.viewtopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
//        self.middelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
//        self.middelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        self.backalertmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.backalertmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.middelview.roundedButton()
        self.cameratabelview.roundedButton()
        self.cameratabelview.dataSource = self
        self.cameratabelview.delegate = self

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(SetLocationViewController.myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        viewfinalvalue.addGestureRecognizer(tapGesture)
        viewfinalvalue.isUserInteractionEnabled = true
        
        
        tapGestureFinalvalue = UITapGestureRecognizer(target: self, action: #selector(SetLocationViewController.myviewTappedFinaltwovalue(_:)))
        tapGestureFinalvalue.numberOfTapsRequired = 1
        tapGestureFinalvalue.numberOfTouchesRequired = 1
        txtLandMark.addGestureRecognizer(tapGesture)
        txtLandMark.isUserInteractionEnabled = true
      

        
        
      
        self.viewbottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        setLocationTopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        setLocationTopview.layer.shadowOpacity = 0.6
        setLocationTopview.layer.shadowRadius = 3.0
        setLocationTopview.layer.shadowColor = UIColor.color2().cgColor

        let stringone = Bundle.main.releaseVersionNumber
        appversionName = Bundle.main.buildVersionNumber!
        print(getVersion())
        let device = UIDevice.current
        let model = device.model
        print(model)
        DeviceType = device.modelName
        let deviceName = device.name
        print(deviceName)
        let systemName = device.systemName
        print(systemName)
        let systemVersion = device.systemVersion
        print(systemVersion)
        iosversionType = systemVersion
        if let identifierForVendor = device.identifierForVendor
        {
            print(identifierForVendor)
            let networkInfo = CTTelephonyNetworkInfo()
            let carrier = networkInfo.subscriberCellularProvider
            print(getCarrierName())
            print(getIPAddress())
            //        PrivateIpAdress = getIPAddress()!
            
            /// Coommand code
            
            print(UIDevice.current.identifierForVendor!.uuidString)
            Macid = UIDevice.current.identifierForVendor!.uuidString
            simtype = getCarrierName()!
        }
        udidfinal =  UIDevice.current.identifierForVendor!.uuidString
        let value = app.getTodayString()
        let colo = UIColor.gray
        let attributes = [
            NSAttributedStringKey.foregroundColor: colo
        ]
        txtLocation.attributedPlaceholder = NSAttributedString(string:"Location", attributes:attributes)
        txtHome.attributedPlaceholder = NSAttributedString(string:"House / Plot / Shop no.", attributes:attributes)
        txtLandMark.attributedPlaceholder = NSAttributedString(string:"Landmark", attributes:attributes)
        txtLandMark.attributedPlaceholder = NSAttributedString(string:"Landmark", attributes:attributes)
        Enterareapincode.attributedPlaceholder = NSAttributedString(string:"Area", attributes:attributes)
        txtStore.attributedPlaceholder = NSAttributedString(string:"Eg: Shop, Godown, Store", attributes:attributes)
        if addanotherfisrt == "secondvalue"
        {
            btnsetLocationsaved.setTitle("Proceed", for:.normal)
            setdeliveryLocation.text = "Set delivery location"
             setdeliveryLocation.isHidden = true
        }
        if addanotherfisrt == "addanotherfisrt"
        {
            btnsetLocationsaved.setTitle("Proceed", for:.normal)
            setdeliveryLocation.text = "Set delivery location"
            setdeliveryLocation.isHidden = true

        }
        if billingstringfinalvalue == "Billingstringfinalvalue"
        {
            btnsetLocationsaved.setTitle("Update Billing Location", for:.normal)
            setdeliveryLocation.text = "Set Billing Location"
            setdeliveryLocation.isHidden = true

        }
        if devlievrystringsingel == "deliverystringfinalvalue"
        {
            btnsetLocationsaved.setTitle("Update Delivery Location", for:.normal)
            setdeliveryLocation.text = "Set Delivery Location"
            setdeliveryLocation.isHidden = true

        }
        if deliverytwovalue == "Deliveryfinalvalue"
        {
            btnsetLocationsaved.setTitle("Update Delivery Location", for:.normal)
            setdeliveryLocation.text = "Set Delivery Location"
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
    areafinalviewistotal.addGestureRecognizer(tap)
        
        areafinalviewistotal.isUserInteractionEnabled = true
        
        
        
        
    smalldotview.layer.cornerRadius = 6
        self.middelview.roundedButton()
         self.Demototal.roundedButton()

        
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        araeview.isHidden = true
    }
    @objc func myviewTappedFinaltwovalue(_ sender: UITapGestureRecognizer)
    {
        araeview.isHidden = true
    }

    func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
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
    func getVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return version
    }
    
    func getCarrierName() -> String? {
        
        var carrierName: String?
        
        let typeName: (Any) -> String = { String(describing: type(of: $0)) }
        
        let statusBar = UIApplication.shared.value(forKey: "_statusBar") as! UIView
        
        for statusBarForegroundView in statusBar.subviews {
            if typeName(statusBarForegroundView) == "UIStatusBarForegroundView" {
                for statusBarItem in statusBarForegroundView.subviews {
                    if typeName(statusBarItem) == "UIStatusBarServiceItemView" {
                        carrierName = (statusBarItem.value(forKey: "_serviceString") as! String)
                    }
                }
            }
        }
        return carrierName
    }
    @objc func myviewTapped(_ sender: UITapGestureRecognizer)
    {
       self.araeview.isHidden = false
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
            lblSave.isHidden = false
//            lblSave.textColor = UIColor.black
            
            
          //  self.lblSave.textColor = UIColor.textfiledbottomcolorside1()

            self.lblSave.textColor = UIColor.gray

            
            
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
            lblLocation.isHidden = false
//            lblLocation.textColor = UIColor.black
//            self.lblLocation.textColor = UIColor.textfiledbottomcolorside1()
           self.lblLocation.textColor = UIColor.gray

            lblLocation.text = "Enter Location"
        }
        if (txtLandMark.text?.count)! < 0
        {
            lblLandMark.isHidden = false
          //  lblLandMark.textColor = UIColor.black
//            self.lblLandMark.textColor = UIColor.textfiledbottomcolorside1()
          self.lblLandMark.textColor = UIColor.gray

            lblLandMark.text = "Enter Landmark"

        }
        if (txtLandMark.text?.count)! > 1
        {
            lblLandMark.isHidden = false
            //lblLandMark.textColor = UIColor.black
//            self.lblLandMark.textColor = UIColor.textfiledbottomcolorside1()
            
            self.lblLandMark.textColor = UIColor.gray

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
            lblhome.isHidden = false
//            lblhome.textColor = UIColor.black
            
//            self.lblhome.textColor = UIColor.textfiledbottomcolorside1()

            self.lblhome.textColor = UIColor.gray

            lblhome.text = "Enter Plot Number"
        }

        if (self.Enterareapincode.text?.count)! > 1
        {
            Enterarealabel.isHidden = false
//            Enterarealabel.textColor = UIColor.black
          //  self.Enterarealabel.textColor = UIColor.textfiledbottomcolorside1()
            self.Enterarealabel.textColor = UIColor.gray

            Enterarealabel.text = "Enter Area"
        }
        
        if (self.Enterareapincode.text?.count)! < 0
        {
            Enterarealabel.isHidden = false
            Enterarealabel.textColor = UIColor.red
            Enterarealabel.text = "Enter area"
        }
        
        if (self.Enterpincode.text?.count)! > 1
        {
            pincdoe.isHidden = false
          //  pincdoe.textColor = UIColor.black
//            self.pincdoe.textColor = UIColor.textfiledbottomcolorside1()
            
            self.pincdoe.textColor = UIColor.gray

            pincdoe.text = "Enter Pincode"
        }
        
        if (self.Enterpincode.text?.count)! < 0
        {
            pincdoe.isHidden = false
            pincdoe.textColor = UIColor.red
            pincdoe.text = "Enter pincode"
        }
        

    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == self.txtLocation
//        {
//            if (textField.text?.count)! > 1
//            {
//                lblLocation.isHidden = true
//               // lblLocation.textColor = UIColor.red
//            }
//            else{
//                lblLocation.isHidden = false
//                lblLocation.textColor = UIColor.red
//
//            }
//        }
//
//        else if textField == self.txtHome
//        {
//            if (textField.text?.count)! > 1
//            {
//                lblhome.isHidden = true
////                lblhome.textColor = UIColor.red
//
//            }
//            else{
//                lblLandMark.isHidden = false
//                lblhome.textColor = UIColor.red
//
//            }
//        }
//        else if textField == self.txtLandMark
//        {
//            if (textField.text?.count)! > 1
//            {
//                lblLandMark.isHidden = true
//
//            }
//            else{
//
//                lblLandMark.isHidden = false
//                lblLandMark.textColor = UIColor.red
//
//            }
//        }
//        else if textField == self.txtStore
//        {
//            if (textField.text?.count)! > 1
//            {
//                lblSave.isHidden = true
//
//            }
//            else{
//                lblSave.isHidden = false
//                lblSave.textColor = UIColor.red
//                lblSave.text = "Enter Shop Number"
//
//            }
//        }
//    }


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
        print(welcomelatitude)
        print(welcomelangitude)
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
//                print("address1:", placemark.thoroughfare ?? "")
//                print("address2:", placemark.subThoroughfare ?? "")
//                print("city:",     placemark.locality ?? "")
//                print("state:",    placemark.administrativeArea ?? "")
//                print("zip code:", placemark.postalCode ?? "")
//                print("country:",  placemark.country ?? "")
                
                if let localityfinal:String = gmsAdrees?.subLocality
                {
                    self.txtLandMark.text = localityfinal
                    self.lblLandMark.isHidden = false
                    self.lblLandMark.textColor = UIColor.darkGray
                }
                if let localityfinaltwo:String = gmsAdrees?.locality
                {
                    self.citytwo = localityfinaltwo
//                    self.txtLandMark.text = self.citytwo
                    self.Enterareapincode.text = "Enter Area"
//                    self.Enterarealabel.textColor = UIColor.textfiledbottomcolorside()
//                    self.Enterarealabel.textColor = UIColor.gray
//                    self.Enterarealabel.text = "Enter Area"
                     self.txtLandMark.text = self.citytwo
                    self.txtLandMark.textColor = UIColor.darkGray

                }
                
                if let administrativeAreafinal:String = gmsAdrees?.administrativeArea
                {
                    self.state = administrativeAreafinal
                    self.Enterareapincode.text =   self.state
//                    self.pincdoe.textColor = UIColor.textfiledbottomcolorside()
//                    self.pincdoe.textColor = UIColor.gray
//                    self.pincdoe.text = "Enter pincode"
                }
                if let subHouseNumber:String = gmsAdrees?.thoroughfare
                {
                    self.txtHome.text = subHouseNumber
                    self.lblhome.text = "Enter Plot Number"
                    self.lblhome.isHidden = false
//                    self.lblhome.textColor = UIColor.textfiledbottomcolorside1()
                    self.lblhome.textColor = UIColor.darkGray
                }
                
                if let subHousepostalCode:String = gmsAdrees?.postalCode
                {
//                    self.txtHome.text = subHousepostalCode
//                    self.lblhome.text = "Enter Plot Number"
//                    self.lblhome.isHidden = true
                    self.zipcodefinalvalue = subHousepostalCode
                    self.Enterpincode.text =   self.zipcodefinalvalue
                    self.EditPinValue()
                }
                
                if lines != nil
                {
                    if lines?.count == 1
                    {
                        self.txtLocation.text = NSString(format: "%@", lines![0]) as String
                        self.lblLocation.textColor = UIColor.textfiledbottomcolorside1()
                        
                    }
                    else
                    {
                        self.txtLocation.text = NSString(format: "%@,%@", lines![0],lines![1]) as String
                        self.lblLocation.textColor = UIColor.textfiledbottomcolorside1()

                    }
                    
                }
                else {
                    self.lblLocation.text = "No Location Found"
                    
                }
        }
        
    }
    
    
    @IBAction func Saveandprocessor(_ sender: UIButton)
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
      
        if (self.Enterareapincode.text?.count)! < 1
        {
            Enterarealabel.isHidden = false
            Enterarealabel.textColor = UIColor.red
            Enterarealabel.text = "Enter Area"
        }
        
      
        if (self.Enterpincode.text?.count)! < 1
        {
            pincdoe.isHidden = false
            pincdoe.textColor = UIColor.red
            pincdoe.text = "Enter Pincode"
        }
        
      
        
        
        
        
        
         if (txtLocation.text?.count)! > 1 && (txtHome.text?.count)! > 1
        && (txtLandMark.text?.count)! > 1 && (txtStore.text?.count)! > 1 && (self.Enterareapincode.text?.count)! > 1 && (self.Enterpincode.text?.count)! > 1
        {
        
            if editbillinglocation == "editbillinglocationfinalvalue"
            {
                let defaults = UserDefaults.standard
                defaults.set("123456", forKey: "Billingadressset")
                
                defaults.set("", forKey: "singelupdate")
                defaults.set("", forKey: "Mydeliveryadressset")
                defaults.set("", forKey: "Mydeliveryadresssetfinalvalue")
                defaults.set("", forKey: "myanothersvalue")
                
                
                
                defaults.synchronize()
                DispatchQueue.main.async
                    {
                    let setLocation = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                        var array = [String]()
                        
                        var arraytwofianl = [String]()
                        let defaults = UserDefaults.standard
                        array.append(self.txtLocation.text!)
                        array.append(self.txtHome.text!)
                        array.append(self.txtLandMark.text!)
                        array.append(self.txtStore.text!)
                        array.append(self.dictlat)
                        array.append(self.dictlang)

                        defaults.set(array, forKey: "arryone")
                        self.firstdict = ["deliveryJson":["delAddress1":["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang]]] as NSDictionary
                        
                        let singeldefaults = UserDefaults.standard
                        singeldefaults.set(self.firstdict, forKey: "finaldictvalue")
                        singeldefaults.synchronize()
                 
                    self.present(setLocation, animated: true, completion:nil)
                }
            }

            if devlievrystringsingel == "deliverystringfinalvalue"
            {
                let defaults = UserDefaults.standard
                defaults.set("delivvalue", forKey: "Mydeliveryadressset")
                
                
                defaults.set("", forKey: "singelupdate")
                defaults.set("", forKey: "MyBillingadressset")
                defaults.set("", forKey: "myanothersvalue")
                
                
                
                defaults.synchronize()
                DispatchQueue.main.async
                    {
                        let setLocation = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                        var array = [String]()
                        
                        var arraytwofianl = [String]()
                        let defaults = UserDefaults.standard
                        array.append(self.txtLocation.text!)
                        array.append(self.txtHome.text!)
                        array.append(self.txtLandMark.text!)
                        array.append(self.txtStore.text!)
                        array.append(self.dictlat)
                        array.append(self.dictlang)
                        
                        defaults.set(array, forKey: "Deliverygarryone")
           
                        
                        self.Deliverydicttwo = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
                        
                        self.Deliverydictone = ["delAddress1":["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang]] as NSDictionary
                        
                        
                        let singeldefaults = UserDefaults.standard
                        singeldefaults.set(self.Deliverydictone, forKey: "Deliveryfirstdict")
                        singeldefaults.set(self.Deliverydicttwo, forKey: "Deliveryseconddict")
                        singeldefaults.synchronize()
                        
                        self.present(setLocation, animated: true, completion:nil)
                }
            }
            if deliverytwovalue == "Deliveryfinalvalue"
            {
                let defaults = UserDefaults.standard
                defaults.set("delivvaluetwo", forKey: "Mydeliveryadresssetfinalvalue")
                
                
                defaults.set("", forKey: "singelupdate")
                defaults.set("", forKey: "Mydeliveryadressset")
                defaults.set("", forKey: "myanothersvalue")
                
                
                defaults.synchronize()
                DispatchQueue.main.async
                    {
                        let setLocation = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                        var array = [String]()
                        
                        var arraytwofianl = [String]()
                        let defaults = UserDefaults.standard
                        array.append(self.txtLocation.text!)
                        array.append(self.txtHome.text!)
                        array.append(self.txtLandMark.text!)
                        array.append(self.txtStore.text!)
                        array.append(self.dictlat)
                        array.append(self.dictlang)
                        
                        defaults.set(array, forKey: "Deliverygarryone")
                 
                        
                        self.Deliverydictthree = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
                        
                        self.Deliverydictfour = ["delAddress2":["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang]] as NSDictionary
                        
                        
                        let singeldefaults = UserDefaults.standard
                        singeldefaults.set(self.self.Deliverydictthree, forKey: "Deliverythirdtdict")
                        singeldefaults.set(self.Deliverydictfour, forKey: "DeliveryFourthdict")
                        singeldefaults.synchronize()
                        
                        self.present(setLocation, animated: true, completion:nil)
                }
            }
           //  viewtwo.deliverytwovalue = "Deliveryfinalvalue"
            
            

            if billingstringfinalvalue == "Billingstringfinalvalue"
            {
                let defaults = UserDefaults.standard
                defaults.set("Billingvalue", forKey: "MyBillingadressset")
                
                
                defaults.set("", forKey: "singelupdate")
                defaults.set("", forKey: "Mydeliveryadressset")
                defaults.set("", forKey: "Mydeliveryadresssetfinalvalue")
                defaults.set("", forKey: "myanothersvalue")
                
                
                defaults.synchronize()
                DispatchQueue.main.async
                    {
                        let setLocation = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                        var array = [String]()
                        
                        var arraytwofianl = [String]()
                        let defaults = UserDefaults.standard
                        array.append(self.txtLocation.text!)
                        array.append(self.txtHome.text!)
                        array.append(self.txtLandMark.text!)
                        array.append(self.txtStore.text!)
                        array.append(self.dictlat)
                        array.append(self.dictlang)
                        
                        defaults.set(array, forKey: "Billingarryone")
                        
                        self.Billingdicttwo = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
                        
                        self.Billingdictone = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang] as NSDictionary
                        
                        
                        let singeldefaults = UserDefaults.standard
                        singeldefaults.set(self.Billingdictone, forKey: "Billingfirstdict")
                        singeldefaults.set(self.Billingdicttwo, forKey: "Billingseconddicttdict")
                        singeldefaults.synchronize()
                        
                        self.present(setLocation, animated: true, completion:nil)
                }
            }
            
            
            if billingstringfinalvalue == "Billingstringfinalvalue"
            {
                let defaults = UserDefaults.standard
                defaults.set("Billingvalue", forKey: "MyBillingadressset")
                defaults.set("", forKey: "singelupdate")
                defaults.set("", forKey: "Mydeliveryadressset")
                defaults.set("", forKey: "Mydeliveryadresssetfinalvalue")
                defaults.set("", forKey: "myanothersvalue")
                
                
                defaults.synchronize()
                DispatchQueue.main.async
                    {
                        let setLocation = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                        var array = [String]()
                        
                        var arraytwofianl = [String]()
                        let defaults = UserDefaults.standard
                        array.append(self.txtLocation.text!)
                        array.append(self.txtHome.text!)
                        array.append(self.txtLandMark.text!)
                        array.append(self.txtStore.text!)
                        array.append(self.dictlat)
                        array.append(self.dictlang)
                        
                        defaults.set(array, forKey: "Billingarryone")
          
                    self.Billingdicttwo = ["json":["area":self.txtLocation.text!,"locality":self.txtLandMark.text!,"city":self.citytwo,"mapLat":self.dictlat,"mapLong":self.dictlang,"state":self.state,"pincode":self.zipcodefinalvalue,"district":self.txtLandMark.text!]] as NSDictionary
                        
                        self.Billingdictone = ["location":self.txtLocation.text!,"hps_no":self.txtHome.text!,"landmark":self.txtLandMark.text!,"saveAs":self.txtStore.text!,"mapLat":self.dictlat,"mapLong":self.dictlang] as NSDictionary
                        
                        
                        let singeldefaults = UserDefaults.standard
                        singeldefaults.set(self.Billingdictone, forKey: "Billingfirstdict")
                        singeldefaults.set(self.Billingdicttwo, forKey: "Billingseconddicttdict")
                        singeldefaults.synchronize()
                        
                        self.present(setLocation, animated: true, completion:nil)
                }
            }
            if addanotherfisrt == "secondvalue"
            {
                var arraytwofianl = [String]()
                var array = [String]()
                let defaults = UserDefaults.standard
                let BusinessDetailsView = self.storyboard?.instantiateViewController(withIdentifier:"BusinessDetailsViewController") as!BusinessDetailsViewController
                arraytwofianl.append(txtLocation.text!)
                arraytwofianl.append(txtHome.text!)
                arraytwofianl.append(txtLandMark.text!)
                array.append(self.zipcodefinalvalue)
                
                print(arraytwofianl)
                defaults.removeObject(forKey: "arryone")
                
                defaults.set(arraytwofianl, forKey: "MyarryTwofinal")
                defaults.set(arraytwofianl, forKey: "arraytwofianlis")
                userdefaultsingel.removeObject(forKey:"MyaddAnotherLocation")
                Seconddict = ["json":["area":txtLocation.text!,"hps_no":txtHome.text!,"landmark":txtLandMark.text!,"saveAs":txtStore.text!,"mapLat":dictlat,"mapLong":dictlang]] as NSDictionary
                let singeldefaultstwo = UserDefaults.standard
                singeldefaultstwo.set(Seconddict, forKey: "finaldicTwotvalue")
                singeldefaultstwo.synchronize()
                self.present(BusinessDetailsView, animated:true, completion:nil)
            }
            if addanotherfisrt == "addanotherfisrt"
            {
          
                var singlvalue = String()
                var array = [String]()
                var arraytwofianl = [String]()
                if addanotherfisrt == "addanotherfisrt"
                {
                    let defaults = UserDefaults.standard
                    array.append(txtLocation.text!)
                    array.append(txtHome.text!)
                    array.append(txtLandMark.text!)
                   array.append(self.zipcodefinalvalue)
                    array.append(self.zipcodefinalvalue)
                    let BusinessDetailsView = self.storyboard?.instantiateViewController(withIdentifier:"BusinessDetailsViewController") as!BusinessDetailsViewController
                    BusinessDetailsView.frist = "one"
                    defaults.set(array, forKey: "arryone")
                    
                    defaults.set(array, forKey: "arraytwo")

                    userdefaultsingel.removeObject(forKey:"MyaddAnotherLocation")
                    firstdict = ["deliveryJson":["delAddress1":["location":txtLocation.text!,"hps_no":txtHome.text!,"landmark":txtLandMark.text!,"saveAs":txtStore.text!,"mapLat":dictlat,"mapLong":dictlang]]] as NSDictionary
                    let singeldefaults = UserDefaults.standard
                    singeldefaults.set(firstdict, forKey: "finaldictvalue")
                    singeldefaults.removeObject(forKey: "MyarryTwofinal")
                    singeldefaults.removeObject(forKey: "arraytwofianlis")

                    singeldefaults.synchronize()
//                    self.present(BusinessDetailsView, animated:true, completion:nil)
                    
                    
                    DispatchQueue.main.async {
                        self.BusinessMainmethod()
                        
                    }
                }
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
                else{
//                    txtLocation.text = nil
//                    txtHome.text = nil
//                    txtLandMark.text = nil
//                    txtStore.text = nil
             }
            }
        }
        
        
        super.viewWillAppear(animated)
    }

    
    func EditPinValue()
    {
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.setuseridfinalvalue = Reviewfinaluseroid
        }
        if let MymobilenumbervalueViewallid:String = defaulst.value(forKey: "Mymobilenumbervalue")as?String
        {
            self.setMobilenumebrfinalvalue = MymobilenumbervalueViewallid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
    //    let postString = String(format: "method=%@&pin=%@","getAreasfromPin",self.zipcodefinalvalue)
        
        let postString = String(format: "method=%@&pin=%@","getAreasfromPin","500013")

        
        print(postString)
      
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    if let optionsarrayvalue:NSArray = dict.value(forKey:"options") as?NSArray
                    {
                        self.optionsarray = optionsarrayvalue
                    }
                    DispatchQueue.main.async
                        {
                        self.cameratabelview.reloadData()
                    }
                    
                }
            case .failure(_):
                
                print("Method called")
                
            }
        }
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return self.optionsarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = cameratabelview.dequeueReusableCell(withIdentifier: "ProofsTableViewCell", for: indexPath) as! ProofsTableViewCell
        cell.businesslabel.text = self.optionsarray[indexPath.row] as! String
            if self.optionsarray.count-1 == indexPath.row
            {
                cell.businesstwo.isHidden = true
            }
            else
            {
                cell.businesstwo.isHidden = false
            }
            if profileselectedIndex == nil
            {
                cell.businessone.backgroundColor = UIColor.color2()
                cell.businesstwo.backgroundColor = UIColor.color2()
                cell.businesslabel.textColor = UIColor.black
                cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
            }
            else
            {
                if indexPath.row == profileselectedIndex
                {
                    cell.businessone.backgroundColor = UIColor.red
                    cell.businesstwo.backgroundColor =  UIColor.color2()
                    cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
                    cell.businesslabel.textColor = UIColor.red
                    
                }
                else{
                    cell.businessone.backgroundColor = UIColor.color2()
                    cell.businesstwo.backgroundColor = UIColor.color2()
                    cell.businesslabel.textColor = UIColor.black
                    cell.businessone.layer.cornerRadius = cell.businessone.layer.frame.size.width/2
                }
            }
            return cell
        }
        
        
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
       return 37
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            profileselectedIndex = indexPath.row
            cameratabelview.reloadData()
        
        setLocationstring = self.optionsarray[indexPath.row] as! String
        self.Enterareapincode.text = setLocationstring

        
   }
    @IBAction func okbutton(_ sender: UIButton)
    {
        
        self.araeview.isHidden = true
        self.Enterareapincode.text = setLocationstring

    }
    @IBAction func setLocationBackbutton(_ sender: UIButton)
    {
        self.backalertviewfinal.isHidden = false
    }
    
    func BusinessMainmethod()
    {
        
        DispatchQueue.main.async {
                  self.showSpinner()
        }
        let Busineesvalue = "123"
        let typesofcatageoryfinal = "12w432152"
        
        let datafour = ["classification":"","timingsdata":"","updateflag":"0","versioncode":"2.7-34","appType":"Agent"]
        
        let defaults = UserDefaults.standard
        //        defaults.set(txtMblnum.text, forKey:"Mymobilenumber")
        //        defaults.synchronize()
        if let mymobilenumber:String = defaults.value(forKey: "Mymobilenumbervalue")as?String
        {
            mymobilenumbervalue = mymobilenumber
        }
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

//        let Dictone = ["businessdetails":firstdict]
        Dictfinal.addEntries(from:firstdict as! [AnyHashable : Any])
       
        let jsonData = try? JSONSerialization.data(withJSONObject:Dictfinal, options: [])
        print(jsonData)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&category=%@&type=%@&updateflag=%@&data=%@","getownerdetails",mymobilenumbervalue,"submit","businessdetails","post","0",jsonString!)
        print(postString)
        
        
        
      //  "type":"post","updateflag":"0"
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                print(response.result.value)
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    if let StatusMsgfinal:String = dict.value(forKey: "StatusMsg") as? String
                    {
                        
                        self.StatusMsg = StatusMsgfinal
                    }
                    
                    if  self.StatusMsg == "Success"
                    {
                        DispatchQueue.main.async {
                            self.serviceResponseLogin()
                        }
                    }
                    
                    if let AgentIdfinal:String = dict.value(forKey: "AgentId") as? String
                    {
                        
                        self.AgentId = AgentIdfinal
                    }
                    if let RoleIdfinal:String = dict.value(forKey: "RoleId") as? String
                    {
                        
                        self.RoleId = RoleIdfinal
                    }
                    
                    if let Statusfinal:String = dict.value(forKey: "Status") as? String
                    {
                        
                        self.Status = Statusfinal
                    }
                    
                    if let StatusCodefinal:String = dict.value(forKey: "StatusCode") as? String
                    {
                        
                        self.StatusCode = StatusCodefinal
                    }
                    if let UserIdfinal:String = dict.value(forKey: "UserId") as? String
                    {
                        
                        self.UserId = UserIdfinal
                    }
                   
                    
                    if let usernamefinal:String = dict.value(forKey: "UserId") as? String
                    {
                        self.username = usernamefinal
                    }
                    
                    if let pinfinal:String = dict.value(forKey: "pin") as? String
                    {
                        self.pin = pinfinal
                        let defaults = UserDefaults.standard
                        defaults.set(self.pin, forKey:"MypinvaluTotal")
                        defaults.synchronize()
                    }
                    self.Loginstrsucess = self.StatusCode
                    print(self.Loginstrsucess)
                    print(self.AgentId)
                    print(self.RoleId)
                    print(self.Status)
                    print(self.AgentId)
                    print(self.StatusMsg)
                    print(self.StatusCode)
                    print(self.UserId)
                    print(self.pin)
                    print(self.username)

                  
                    
//                        {
//                            AgentId = A70641;
//                            RoleId = 4;
//                            Status = 1;
//                            StatusCode = 1;
//                            StatusMsg = Success;
//                            UserId = 78539;
//                            pin = 986532;
//                            username = A70641;
//                    }
                }
                else
                {
                    
                    
                }
                break
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func serviceResponseLogin()
    {
        let defaults = UserDefaults.standard
        if let ComboNamefinal:String = defaults.value(forKey: "Mymobilenumber") as? String
        {
            self.Mymobilevalue = ComboNamefinal
        }
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&uname=%@&upwd=%@&os=%@&version=%@&appversion=%@&mobilemodelno=%@&mobileuserlat=%@&mobileuserlang=%@&privateIP=%@&macID=%@&deviceType=%@&usertype=%@&Sigstrength=%@&ConnTyp=%@&SimTyp=%@&appType=%@&AndroidId=%@&cseloginenable=%@&appOpenTime=%@&appCloseTime=%@&app=%@","login_new", self.Mymobilevalue,self.pin,"IOS",iosversionType,"3.0-37",appMODelNumber,welcomelatitude,welcomelangitude,"172.31.0.128",Macid,DeviceType,"1","0",wifi,simtype,"Direct",udidfinal,"0",app.startTime,app.startTime,"IOS")

        
        print(postString)
        
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print("response.response \(response.response)") // HTTP URL response
                
                let value = response.response
                
                let valuetwo = response.data
                
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                    }
                }
                if let httpResponse1 = value {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        print(xDemAuth)
                        
                        print(httpResponse1)
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                
                
                
                
                
                let httpResponse = response as? HTTPURLResponse
                //                let token = httpResponse?.allHeaderFields["SECURITY-TOKEN"] as? String
                ////
                ////                print(token)
                ////
                ////                print(httpResponse)
                print(value)
                
                
                
                
                
                //                self.LoginHeaderDicytvalue = (self.LoginDicytvalue as! AnyObject).value(forKey:"")
                //                print(self.LoginHeaderDicytvalue)
                //                 self.authorisationvalue = self.LoginHeaderDicytvalue.value(forKey:"Authorization")as!NSArray
                //                print(self.authorisationvalue)
                //                self.authorisationToken = self.authorisationvalue[0] as! String
                //                print(self.authorisationToken)
                
              
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    
                    
                    
                    
                    let  statusstring = dict.value(forKey:"Message")
                    self.Loginstrsucess = statusstring as! String
                    if  self.Loginstrsucess == "Success"
                    {
                        let msgvalue  = dict.value(forKey:"Message")as!String
//                        self.verificationMobilenumberregistered.text = self.Loginstrsucess
//                        self.verificationnotregistred.text = "Login Sucess"
//                        self.verifyalertview.isHidden = false
//                        self.removeSpinner()
//                        
                        let defaults = UserDefaults.standard
                        defaults.set("islogin", forKey: "islogintrue")
                        self.LoginidValue = dict.value(forKey:"UserId")as!String
                        // AgentId = A977;
                        
                        self.AgentId = dict.value(forKey:"AgentId")as!String
                        self.AgentIdValuefinalstring = dict.value(forKey:"UserId")as!String
                        
                        self.cashValuefinalstring = dict.value(forKey:"cash")as!String
                        
                        
                        
                        
                        
                        self.Kycpending = dict.value(forKey:"IsKYCRegistered")as!NSNumber
                        
                        self.KycpendingRegisteredmessage = dict.value(forKey:"IsKYCRegisteredMessage")as!String
                        
                        self.defaultsBrandIdstring = dict.value(forKey:"defBrandId")as!String
                        self.defBrandnamestring = dict.value(forKey:"defBrandname")as!String
                        self.defBrandpathstring = dict.value(forKey:"defBrandpath")as!String
                        self.defCatIdstring = dict.value(forKey:"defCatId")as!String
                        self.defCatnamestring = dict.value(forKey:"defCatname")as!String
                        self.defCatpathstring = dict.value(forKey:"defCatpath")as!String
//                        self.cartcountstring = dict.value(forKey:"CartCount")as!NSNumber
                        if let cartcounttotal:NSString = dict.value(forKey: "CartCount") as? NSString
                        {
                            self.cartcountstring = cartcounttotal
                            let defaults = UserDefaults.standard
                            
                            defaults.set(self.cartcountstring, forKey: "Mycartcountstring")
                            defaults.synchronize()
                            
                        }
                        if let cartcounttotal:NSNumber = dict.value(forKey: "CartCount") as? NSNumber
                        {
                            self.cartcountstring1 = cartcounttotal
                            defaults.set(self.cartcountstring1, forKey: "Mycartcountstring")
                            defaults.synchronize()
                        }
                        defaults.set(self.cartcountstring, forKey: "Mycartcountstring")
                        defaults.set(self.defaultsBrandIdstring, forKey: "MydefaultsBrandidstring")
                        defaults.set(self.defBrandnamestring, forKey: "Mydefaultsbarndsname")
                        defaults.set(self.Kycpending, forKey: "MyKycpending")
                        
                        defaults.set(self.defBrandpathstring, forKey: "Mydeafultsbrandspath")
                        
                        defaults.set(self.defBrandpathstring, forKey: "Mydeafultsbrandspath")
                        
                        defaults.set(self.defCatIdstring, forKey: "Mydeafultscatageoryidstring")
                        defaults.set(self.defCatnamestring, forKey: "mydeafultscatageoryname")
                        defaults.set(self.defCatpathstring, forKey: "mydefaultscaatgeorypathstring")
                        
                        defaults.set(self.cashValuefinalstring, forKey: "mycashValuefinalstring")
                        
                        
                        defaults.set(self.AgentIdValuefinalstring, forKey: "Myuseridfinaltwovalue")
                        
                        defaults.set(self.AgentId,forKey: "Myagentidfinalavleu")
                        
                        defaults.set(self.AgentIdValuefinalstring,forKey: "Myuseridfinal")
                        
                        
                        
                        //                            self.AgentId = dict.value(forKey:"AgentId")as!String
                        //                            self.AgentIdValuefinalstring = dict.value(forKey:"UserId")as!String
                        
                        
                        defaults.set(self.Kycpending, forKey: "MyKycpending")
                        defaults.set(self.KycpendingRegisteredmessage, forKey: "MyKycMessagelabel")
                        
                        defaults.set(self.LoginidValue, forKey: "MyLoginfinalvalue")
                        defaults.set(self.mymobilenumbervalue, forKey: "Mymobilenumbervalue")
                        defaults.set(self.AgentIdValuefinalstring, forKey: "myuseridvaluefinal")
                        defaults.set(self.mymobilenumbervalue, forKey: "Myagentidvalue")
                        
                        defaults.set(self.AgentId, forKey: "Myagentid")
                        defaults.set(self.cartcountstring, forKey: "Mycartcountstring")
                        defaults.synchronize()
                     
                        if let productrating_graphpreviewfinalvalue:NSDictionary = dict.value(forKey:"menu") as?NSDictionary
                        {
                            
                            self.Menudictfinalvalue = productrating_graphpreviewfinalvalue
                        }
                        
                        if let productrating_graphpreviewfinalvalue:NSDictionary = self.Menudictfinalvalue.value(forKey:"Profile") as?NSDictionary
                        {
                            self.Profiledictfinalvalue = productrating_graphpreviewfinalvalue
                        }
                        if let DelStatusfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"DelStatus") as?String
                        {
                            self.ProfileDelStatusvalue = DelStatusfinalvalue
                            
                        }
                        
                        if let isverystringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"IsVerify") as?String
                        {
                            self.isverystring = isverystringfinalvalue
                            
                        }
                        
                        if let Kyc_statusstringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"Kyc_status") as?String
                        {
                            self.Kyc_statusstring = Kyc_statusstringfinalvalue
                            
                        }
                        if let Kyc_status_colorstringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"Kyc_status_color") as?String
                        {
                            self.Kyc_status_colorstring = Kyc_status_colorstringfinalvalue
                            
                        }
                        
                        if let PinCodestringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"PinCode") as?String
                        {
                            self.PinCode = PinCodestringfinalvalue
                            
                        }
                        
                        if let User_imagefinalvalue:String = self.Profiledictfinalvalue.value(forKey:"User_image") as?String
                        {
                            self.User_image = User_imagefinalvalue
                            
                        }
                        
                        if let User_namefinalvalue:String = self.Profiledictfinalvalue.value(forKey:"User_name") as?String
                        {
                            self.User_name = User_namefinalvalue
                        }
                        if let ratingfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"rating") as?String
                        {
                            self.rating = ratingfinalvalue
                        }
                        if let Herofinalvalue:String = dict.value(forKey:"hero") as?String
                        {
                            self.Hero = Herofinalvalue
                        }
                        if let nav_itemfinalvalue:NSArray =  self.Menudictfinalvalue.value(forKey:"nav_item") as?NSArray
                        {
                            self.navaitemarray = nav_itemfinalvalue
                            
                        }
                        if let navaitemsub_valuefinalvalue:NSArray = self.navaitemarray.value(forKey:"value") as?NSArray
                        {
                            self.navavalueis = navaitemsub_valuefinalvalue
                        }
                        
                        if let navaitemidfinalvalue:NSArray =  self.navaitemarray.value(forKey:"id") as?NSArray
                        {
                            self.navaitemid = navaitemidfinalvalue
                        }
                        
                        if let navaitemnamefinalvalue:NSArray = self.navaitemarray.value(forKey:"name") as?NSArray
                        {
                            self.navaitemname = navaitemnamefinalvalue
                        }
                        
                        if let navaitemname2finalvalue:NSArray = self.navaitemarray.value(forKey:"name2") as?NSArray
                        {
                            self.navaitemname2 = navaitemname2finalvalue
                        }
                        
                        if let navaitemstatusfinalvalue:NSArray = self.navaitemarray.value(forKey:"status") as?NSArray
                        {
                            self.navaitemstatus = navaitemstatusfinalvalue
                        }
                        if let navaitemsub_valuefinalvalue:NSArray = self.navaitemarray.value(forKey:"sub_value") as?NSArray
                        {
                            self.navaitemsub_value = navaitemsub_valuefinalvalue
                        }
                        
                        let defaultsfinal = UserDefaults.standard
                        defaultsfinal.set(self.navavalueis, forKey:"Mynavvaluetotal")
                        defaultsfinal.set(self.ProfileDelStatusvalue, forKey:"ProfileDelStatusvalue")
                        defaultsfinal.set(self.isverystring, forKey:"isverystring")
                        defaultsfinal.set(self.Kyc_statusstring, forKey:"Kyc_statusstring")
                        defaultsfinal.set(self.Kyc_status_colorstring, forKey:"Kyc_status_colorstring")
                        defaultsfinal.set(self.PinCode, forKey:"PinCode")
                        defaultsfinal.set(self.User_image, forKey:"Usertwomage")
                        defaultsfinal.set(self.User_name, forKey:"User_name")
                        defaultsfinal.set(self.rating, forKey:"rating")
                        defaultsfinal.set(self.Hero, forKey:"Hero")
                        defaultsfinal.set(self.navaitemid, forKey:"navaitemid")
                        defaultsfinal.set(self.navaitemname, forKey:"navaitemname")
                        defaultsfinal.set(self.navaitemname2, forKey:"navaitemname2")
                        defaultsfinal.set(self.navaitemstatus, forKey:"navaitemstatus")
//                        defaultsfinal.set(self.navaitemsub_value, forKey:"navaitemsub_value")
                        defaultsfinal.set(self.navaitemsvalue, forKey:"navaitemsvalue")
                        defaultsfinal.synchronize()
                        
                        defaultsfinal.set(self.navaitemsub_value, forKey:"navaitemTotalvalueis")

                        DispatchQueue.main.async {
                            let HomeView = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                            HomeView.LoginidValuefinal = self.LoginidValue
                            
                            self.present(HomeView, animated:true, completion:nil)
                        }
                      
                    }
                    
                   
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
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    @IBAction func backalertnobutton(_ sender: UIButton)
    {
        
        self.backalertviewfinal.isHidden = true
    }
    
    @IBAction func backalertyesbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Myclosebuttonfinalvalue(_ sender: UIButton)
    {
        self.araeview.isHidden = true
    }
    
    
}
    

