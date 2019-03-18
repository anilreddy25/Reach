//
//  proofsViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 25/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}
public enum UIButtonBorderSide {
    case Top, Bottom, Left, Right
}
import MobileCoreServices
import AVFoundation
import Photos
import AssetsLibrary
import WebKit
import CoreLocation
import Alamofire
import AlamofireImage
import AFNetworking

class proofsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UIDocumentMenuDelegate, UIDocumentPickerDelegate,UIDocumentInteractionControllerDelegate,CLLocationManagerDelegate
{
    @IBOutlet weak var proofsviewone: UIView!
    var phonecall = String()

    
    @IBOutlet weak var Proofofdocuementtwo: UIButton!
    
    @IBOutlet weak var proofdoucment: UIButton!
    var profileprogressValue = 0.0
    
    @IBOutlet weak var businessprogressview: UIProgressView!
    
    @IBOutlet weak var camerabutton: UIButton!
    
    @IBOutlet weak var selectbusinessreqirementview: UIView!
    
    @IBOutlet weak var businesstabel: UITableView!
    var selectbusinessproofstring = [String]()
    var selectbusinessTabelview = String()
    var selectauthorisationTabelview = String()

    var profileselectedIndex :Int?
    
    @IBOutlet weak var singelbottomview: UIView!
    
    @IBOutlet weak var bottomviewtwo: UIView!
    @IBOutlet weak var selectcameraview: UIView!
    @IBOutlet weak var selectopview: UIView!
    @IBOutlet weak var cameratabelview: UITableView!
    var selectCameraproofstring = [String]()
    var selectCameraTabelview = String()
    @IBOutlet weak var selectcamerabottomview: UIView!
    @IBOutlet weak var filename: UILabel!
    
    var selectauthorisatiostring = [String]()
    

    
    var clicked = String()
    
     var myPickerController = UIImagePickerController()

    @IBOutlet weak var selectbusinessproofview: UIView!

    
    @IBOutlet weak var businessprofileview: UIScrollView!
    

    var selectidproofstring = [String]()
    
    
    
   
    @IBOutlet weak var selectbusinessproofDocuementproofview: UIView!
    
    
    

    var allowValue = String()
    
    var checkstatus = Bool()
    
    
    @IBOutlet weak var mybusinessfinalvalue: UIView!
    
    @IBOutlet weak var CROSS: UIButton!
    @IBOutlet weak var mybusinesslabel: UILabel!
    var lattitude = Double()
    var longitude = Double()
    let locationManager = CLLocationManager()
    var address = NSString()
    
    var userMobileNumber = String()
    
    
    var selectbusinesproofidstring = [String]()

    var filecattypestring = String()
    var FileTypestring = String()
    var ImageTypestring = String()
    var StatusTypestring = String()
    var StatusCodestring = String()
    var uploadstring = [String]()
   
    @IBOutlet weak var cameraimageview: UIImageView!

    var businessDictarrayfinalvalue = NSArray()
//    var Uploadauthorisiationdocueemntarray = NSArray()
//    var uploadidproofarray = NSArray()
    
    
    var businessnamefinalvalue = NSDictionary()
    var businessnamefinalidfinal = [String]()
    var businessnamefinalNAmefinal = [String]()
    var idselection = String()
    
    var uploadnameproofs = String()
    
    @IBOutlet weak var uploadbusinessname: UILabel!
    var proofsselectedstring = String()
    
    @IBOutlet weak var savefinalvalues: UIButton!
    var Newagentid = String()
    var NewMobileNumber = String()
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    var locationManagertwo = CLLocationManager()

    var welcomelatitude = NSString()
    var welcomelangitude = NSString()
    
    var Myagentidfinal = String()
    var filecatgeorysingeledit = String()

    
    var FinaluploadcatageoryImage = String()
    var finaluploadcatageoryName = String()

    var Tickedstringfinal = String()
    
    @IBOutlet weak var seelctbusinessproofdocuement: UILabel!
    
    
    var bothcilckstring = String()
    
   var bothcilckstringTwo = String()
    
    var Toatlvalue = String()

    @IBOutlet weak var emailme: UIButton!
    @IBOutlet weak var downloadbutton: UIButton!
    var upLoadauthorisationstring  = String()
    var upLoadauthorisationEmail  = String()

    @IBOutlet weak var viewone: UIView!
    @IBOutlet weak var viewtwo: UIView!
    
    var docController:UIDocumentInteractionController!
    var useridbilingfinalvalue = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    var Mybusinessnumbertotalvalueis = String()
    var Loginstrsucess = String()
    
    @IBOutlet weak var pdftwovalue: UIImageView!
    @IBOutlet weak var pdfone: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let defaultstotalvalue = UserDefaults.standard
        if let producttot_reviewspreviewfianlvalue:String = defaultstotalvalue.value(forKey:"Myemialidvalue") as? String
        {
            
        }
        phonecall = "7702187410"
        
        
        proofdoucment.addBordertwo(side: .Bottom, color:UIColor.textfiledbottomcolorside(), width: 1.0)
        proofsviewone.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        bottomviewtwo.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:1.0)
        selectCameraproofstring = ["Camera","Gallery","Document"]
          self.selectcamerabottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:1.0)
        self.selectopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:1.0)
   
        selectauthorisatiostring = ["Board resolution","General / special power of attorney","Letter Signed by Owner / Authorized signatory"]
        selectidproofstring = ["Valid passport","Driver’s license","PAN Card","Voter’s registration card","Aadhaar card"]
   
        if UIScreen.main.bounds.size.height == 480
        {
                businessprofileview.contentInset = UIEdgeInsetsMake(0, 0,self.businessprofileview.frame.size.height+100, 0)
                businessprofileview.isScrollEnabled = true
                businessprofileview.showsVerticalScrollIndicator = false
        }
        if UIScreen.main.bounds.size.height == 568
        {
                businessprofileview.contentInset = UIEdgeInsetsMake(0, 0,self.businessprofileview.frame.size.height+100, 0)
                businessprofileview.isScrollEnabled = true
                businessprofileview.showsVerticalScrollIndicator = false
        }
        
        if  UIScreen.main.bounds.size.height == 736
        {
                businessprofileview.contentInset = UIEdgeInsetsMake(0, 0,self.businessprofileview.frame.size.height+300, 0)
                businessprofileview.isScrollEnabled = true
                businessprofileview.showsVerticalScrollIndicator = false
        }
        if UIScreen.main.bounds.size.height == 667
        {
                businessprofileview.contentInset = UIEdgeInsetsMake(0, 0,self.businessprofileview.frame.size.height+200, 0)
                businessprofileview.isScrollEnabled = true
                businessprofileview.showsVerticalScrollIndicator = false
        }
        businessprogressview.transform = businessprogressview.transform.scaledBy(x: 1, y: 2)

        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
        }
        else
        {
            print("Location services are not enabled");
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        cameraimageview.addGestureRecognizer(tap)
        cameraimageview.isUserInteractionEnabled = true
        
        if uploadstring.count > 0
        {
            let uploadimagevalue = uploadstring[0]
            cameraimageview.sd_setImage(with: URL(string:uploadimagevalue), placeholderImage:(UIImage(named:"")), options: .refreshCached, completed: nil)
        }
        self.businessnamefinalidfinal = businessDictarrayfinalvalue.value(forKey:"id")as![String]
           self.selectbusinessproofstring = businessDictarrayfinalvalue.value(forKey:"value")as![String]
        if uploadnameproofs == "Upload business license"
        {
            uploadbusinessname.text = uploadnameproofs
            proofsselectedstring = "Select business proof doucment"
            proofdoucment.setTitle(proofsselectedstring, for:.normal)
            self.emailme.isHidden = true
            self.downloadbutton.isHidden = true
        }
        if uploadnameproofs == "Upload Authorization document"
        {
            uploadbusinessname.text = uploadnameproofs
            proofsselectedstring = "Upload business Authorization doucment"
            proofdoucment.setTitle(proofsselectedstring, for:.normal)
            self.emailme.isHidden = false
            self.downloadbutton.isHidden = false
            
            self.emailme.layer.cornerRadius = 5
            self.emailme.layer.borderWidth = 0.6
            self.emailme.layer.borderColor = UIColor.black.cgColor
            self.downloadbutton.layer.cornerRadius = 5
            self.downloadbutton.layer.borderWidth = 0.6
            self.downloadbutton.layer.borderColor = UIColor.black.cgColor
            
        }
        if uploadnameproofs == "Upload ID proof"
        {
           uploadbusinessname.text = uploadnameproofs
            proofsselectedstring = "Upload ID proof  doucment"
            proofdoucment.setTitle(proofsselectedstring, for:.normal)
            self.emailme.isHidden = true
            self.downloadbutton.isHidden = true
        }
        
        DispatchQueue.main.async {
            self.determineMyCurrentLocation()
        }

        if FinaluploadcatageoryImage.count > 1
        {
            cameraimageview.sd_setImage(with: URL(string: FinaluploadcatageoryImage), placeholderImage: UIImage(named: "placeholder"))
            self.camerabutton.sd_setBackgroundImage(with: URL(string:self.FinaluploadcatageoryImage), for: .normal)
            self.mybusinesslabel.text = self.finaluploadcatageoryName
            self.mybusinesslabel.isHidden = false
            self.businessprogressview.isHidden = true
            self.CROSS.isHidden = false
            self.proofdoucment.setTitleColor(UIColor.black, for:.normal)
        }
        
        if Toatlvalue == "1"
        {
            self.seelctbusinessproofdocuement.text = "Please select type of document"
            self.emailme.isHidden = true
            self.downloadbutton.isHidden = true
            self.pdfone.isHidden = true
            self.pdftwovalue.isHidden = true
        }
         if Toatlvalue == "2"
        {
            self.seelctbusinessproofdocuement.text = "Select authorization document"
            self.emailme.isHidden = false
            self.downloadbutton.isHidden = false
            self.pdfone.isHidden = false
            self.pdftwovalue.isHidden = false
        }
         if Toatlvalue == "3"
        {
            self.seelctbusinessproofdocuement.text = "Select ID proof document"
            self.emailme.isHidden = true
            self.downloadbutton.isHidden = true
            self.pdfone.isHidden = true
            self.pdftwovalue.isHidden = true
        }
        self.businessprofileview.contentSize.height = 1.0
        self.selectbusinessreqirementview.roundedButton()
        self.cameratabelview.roundedButton()
        self.selectopview.roundedButton()
        viewone.layer.cornerRadius = 8
        viewone.layer.masksToBounds = true
        viewtwo.layer.cornerRadius = 8
        viewtwo.layer.masksToBounds = true
        self.singelbottomview.roundedButton()
        self.businesstabel.roundedButton()
        self.selectcameraview.roundedButton()

    }
      @objc func handleTap(_ sender: UITapGestureRecognizer)
      {
        self.selectbusinessproofDocuementproofview.isHidden = false
        self.selectcameraview.isHidden = false
        self.selectbusinessreqirementview.isHidden = true
      }
    func determineMyCurrentLocation()
    {
        locationManagertwo = CLLocationManager()
        locationManagertwo.delegate = self
        locationManagertwo.desiredAccuracy = kCLLocationAccuracyBest
        locationManagertwo.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManagertwo.startUpdatingLocation()
        }
    }

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let userLocation:CLLocation = locations[0] as CLLocation
    locationManagertwo.stopUpdatingLocation()
    
    welcomelatitude = String(userLocation.coordinate.latitude) as NSString
    welcomelangitude  = String(userLocation.coordinate.longitude)as NSString
    
//    let locValue: CLLocationCoordinate2D = locationManagertwo.location!.coordinate
//    print("locations = \(locValue.latitude) \(locValue.longitude)")
// 
//    self.lattitude = locValue.latitude
//    self.longitude = locValue.longitude
//    print(self.lattitude)
//    print(self.longitude)
    
            self.lattitude = 25.65
            self.longitude = 18.75
 
    var location = CLLocation(latitude: self.lattitude, longitude: self.longitude) //changed!!!
    
    //   var location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude) //changed!!!
    
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
        print(location)
        if error != nil {
            print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
            return
        }
        var placeMark: CLPlacemark!
        placeMark = placemarks?[0]
        
        // Address dictionary
        //print(placeMark.addressDictionary ?? "")
        
        // Location name
        if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
            print(locationName)
            self.address = "\(locationName)" as NSString
        }
        
        // Street address
        if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
            print(street)
            self.address = self.address.appending(street as String) as NSString
        }
        
        // City
        if let city = placeMark.addressDictionary!["City"] as? NSString {
            print(city)
            self.address = self.address.appending(city as String) as NSString
            
        }
        
        // Zip code
        if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
            print(zip)
            self.address = self.address.appending(zip as String) as NSString
        }
        
        // Country
        if let country = placeMark.addressDictionary!["Country"] as? NSString {
            print(country)
            self.address = self.address.appending(country as String) as NSString
        }
        print(self.address)
        
    })
}
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status != .authorizedWhenInUse {return}
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
//        let locValue: CLLocationCoordinate2D = locationManager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//        self.lattitude = 25.65
//        self.longitude = 18.75
        
//        self.lattitude = locValue.latitude
//        self.longitude = locValue.longitude
        print(self.lattitude)
        print(self.longitude)
        
        
        var location = CLLocation(latitude: self.lattitude, longitude: self.longitude) //changed!!!
        
         //   var location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude) //changed!!!
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            print(location)
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Address dictionary
            //print(placeMark.addressDictionary ?? "")
            
            // Location name
            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
                print(locationName)
                self.address = "\(locationName)" as NSString
            }
            
            // Street address
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
                print(street)
                self.address = self.address.appending(street as String) as NSString
            }
            
            // City
            if let city = placeMark.addressDictionary!["City"] as? NSString {
                print(city)
                self.address = self.address.appending(city as String) as NSString
                
            }
            
            // Zip code
            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
                print(zip)
                self.address = self.address.appending(zip as String) as NSString
            }
            
            // Country
            if let country = placeMark.addressDictionary!["Country"] as? NSString {
                print(country)
                self.address = self.address.appending(country as String) as NSString
            }
            print(self.address)
            
        })
        
        
    }
    @objc func updateProgress()
    {
        profileprogressValue = profileprogressValue + 0.01
        self.businessprogressview.progress = Float(profileprogressValue)
        businessprogressview.progress = 1.0
    }
    
    func setCardView(view : UIView)
    {
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.5
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
    
    @IBAction func Proofofdocuemnet(_ sender: UIButton)
    {
        singelbottomview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:1.0)
        
        
        
        if proofdoucment.tag == 0
        {
            self.selectbusinessproofDocuementproofview.isHidden = false
            selectbusinessreqirementview.isHidden = false
            self.selectcameraview.isHidden = true
            proofdoucment.tag = 1
        }
        else if proofdoucment.tag == 1
        {
            selectbusinessreqirementview.isHidden = true
            self.selectbusinessproofDocuementproofview.isHidden = true
            self.selectcameraview.isHidden = true
            proofdoucment.tag = 0
        }
    }
    
    @IBAction func Camerabutton(_ sender: UIButton)
    {
        self.selectbusinessproofDocuementproofview.isHidden = false
        self.selectcameraview.isHidden = false
        self.selectbusinessreqirementview.isHidden = true
        
    }
    @IBAction func crossbutton(_ sender: UIButton)
    {
        Proofofdocuementtwo.tag = 0
        proofdoucment.tag = 0
        self.selectbusinessreqirementview.isHidden = true
        self.selectbusinessproofDocuementproofview.isHidden = true

    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
      
        if tableView == businesstabel
        {
            return self.selectbusinessproofstring.count

        }
     
            
        else
        {
             return self.selectCameraproofstring.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == businesstabel
        {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ProofsTableViewCell", for: indexPath) as! ProofsTableViewCell
            cell.businesslabel.text = self.selectbusinessproofstring[indexPath.row]
            if self.selectbusinessproofstring.count-1 == indexPath.row {
                cell.businesstwo.isHidden = true
                
            }
            else{
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
      
            
        else {
            let cell  = cameratabelview.dequeueReusableCell(withIdentifier: "ProofsTableViewCell", for: indexPath) as! ProofsTableViewCell
            cell.businesslabel.text = self.selectCameraproofstring[indexPath.row]
            if self.selectCameraproofstring.count-1 == indexPath.row {
                cell.businesstwo.isHidden = true
                
            }
            else{
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
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == cameratabelview
        {
            return 37
        }
        else
        {
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    
    if tableView == businesstabel
    {
        profileselectedIndex = indexPath.row
        businesstabel.reloadData()
        selectauthorisationTabelview.removeAll()

        selectbusinessTabelview = self.selectbusinessproofstring[indexPath.row]
          self.idselection = self.businessnamefinalidfinal[indexPath.row]
        self.proofdoucment.setTitleColor(UIColor.black, for:.normal)
        bothcilckstringTwo = "2"
       
    }
    
    else
    {
       
        profileselectedIndex = indexPath.row
        cameratabelview.reloadData()
        selectbusinessTabelview = self.selectbusinessproofstring[indexPath.row]
        
        if indexPath.row == 0
        {
        self.openCamera()
            Tickedstringfinal = "1"
        }
        if indexPath.row == 1
        {
            self.photoLibrary()
            self.checkPermission()
            Tickedstringfinal = "2"
            self.savefinalvalues.isHidden = false


        }
        if indexPath.row == 2
        {
            self.clickFunction()
        }
        }
    }
    @IBAction func okbutton(_ sender: UIButton)
    {
        selectbusinessreqirementview.isHidden = true
        self.selectbusinessproofDocuementproofview.isHidden = true
        Proofofdocuementtwo.tag = 0
        proofdoucment.tag = 0
        proofdoucment.setTitle(selectbusinessTabelview, for:.normal)
    }
    
    @IBAction func Cameracross(_ sender: UIButton)
    {
        self.selectcameraview.isHidden = true
       // self.openCamera()
    }
 
    func photoLibrary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
           
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    func clickFunction()
    {
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
         if Tickedstringfinal ==  "1"
         {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                cameraimageview.image = image
                
                camerabutton.setBackgroundImage(image, for:.normal)
                businessprogressview.setProgress(1.0, animated: true)
                self.selectbusinessproofDocuementproofview.isHidden = true
                
                if let asset = info["UIImagePickerControllerPHAsset"] as? PHAsset{
                    if let fileName = asset.value(forKey: "filename") as? String{
                        //  print(fileName)
                        self.mybusinesslabel.text = fileName
                        self.businessprogressview.isHidden = true
                        
                        self.CROSS.isHidden = false
                        self.mybusinesslabel.isHidden = false
                    }
                }
                bothcilckstring = "1"
                let resizeImage =  ValidateValues.ResizeImage(image: image, targetSize:CGSize(width:200,height:200))
                let imageData = UIImageJPEGRepresentation(resizeImage, 0.01)!
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                let myString = formatter.string(from: Date())
                let yourDate = formatter.date(from: myString)
                formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
                let photoDateAndTimeSTR = formatter.string(from: yourDate!)
                let agentImageUpload = "agentImageUpload"
                //            defaults.set(self.mobileNumber.text!, forKey: "Mymobilenumbervalue")
                let defaults = UserDefaults.standard
                let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
                let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"jpg","filecat":filecatgeorysingeledit,"Longitude":self.longitude,"Latitude":self.lattitude,"address":self.address,"Timestamp":photoDateAndTimeSTR,"type_id":idselection,"id":"571"] as [String : Any]
                print(params1)
                let manager : AFHTTPSessionManager = AFHTTPSessionManager()
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
                let operation = manager.post("http://172.31.0.23/NumberMall/agent_Gwy.php", parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                    formData.appendPart(withFileData: imageData, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
                    
                }, success: { (operation, responseObject) -> Void in
                    
                    print(operation)
                    print(responseObject ?? "")
                    
                    let Result = responseObject as! NSDictionary
                    let StatusCode = Result.object(forKey: "StatusCode") as! Int
                    
                    print(Result)
                    print(StatusCode)
                    
                    if StatusCode == 1{
                        
                        //                    let image = Result.object(forKey: "Image") as! String
                        //                    UserDetails.addToNSUserDefaults(object: image as AnyObject, key: "ProofID")
                        //                    if self.proofShowDelegate != nil{
                        //                        self.proofShowDelegate?.showIDProofDocument(Status: 1, Value: pickedImage, url: image, filetype: "image")
                        //                    }
                        let defaultssinglvalue = UserDefaults.standard
                        
                        
                        self.ImageTypestring = Result.value(forKey:"Image")as!String
                        self.FileTypestring = Result.value(forKey:"FileType")as!String
                        self.filecattypestring = Result.value(forKey:"FileCat")as!String
                        defaultssinglvalue.set(self.ImageTypestring, forKey:"Myimagetypestring")
                        defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                        defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                        defaultssinglvalue.synchronize()
                        if self.bothcilckstringTwo == "2"
                        {
                            self.savefinalvalues.isHidden = false
                            
                        }
                        
                    }
                    else{
                        
                    }
                    
                }) { (operation, error) -> Void in
                    print(error)
                }
                
                
                
                if #available(iOS 11.0, *) {
                    if let imageURL = info[UIImagePickerControllerImageURL] as? URL {
                        print(imageURL)
                        
                        print(imageURL.typeIdentifier ?? "unknown UTI")  // this will print public.jpeg or another file UTI
                        let assetPath = info[UIImagePickerControllerReferenceURL] as! NSURL
                        print(assetPath)
                        if (imageURL.absoluteString.hasSuffix("JPG")) {
                            print("JPG")
                        }
                        if (imageURL.absoluteString.hasSuffix("jpeg")) {
                            print("jpeg")
                        }
                        else if (imageURL.absoluteString.hasSuffix("PNG"))
                        {
                            print("PNG")
                        }
                        else if (imageURL.absoluteString.hasSuffix("GIF"))
                        {
                            print("GIF")
                        }
                    }
                }
                picker.dismiss(animated: true, completion: nil)

            }

        }
        
        if Tickedstringfinal ==  "2"
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                let deviceID = UIDevice.current.identifierForVendor!.uuidString
                print(deviceID)
                let imageName:String = deviceID + ".jpg"
                let documentsPath = NSHomeDirectory().appending("/Documents/Icon/")
                let imagePath = documentsPath.appending(imageName)
                let imageUrl = URL(fileURLWithPath: imagePath)
                print("imageUrl is here:\(imageUrl)")
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                cameraimageview.image = image
                
                camerabutton.setBackgroundImage(image, for:.normal)
                businessprogressview.setProgress(1.0, animated: true)
                self.selectbusinessproofDocuementproofview.isHidden = true
                self.businessprogressview.isHidden = true
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
                let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                print(paths)
                if let dirPath          = paths.first
                {
                    print(dirPath)
                    let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("Image2.png")
                    print(imageURL)
                    let image    = UIImage(contentsOfFile: imageURL.path)
                    print(image)
                    self.CROSS.isHidden = false
                    self.mybusinesslabel.isHidden = false
                }
                if let asset = info["UIImagePickerControllerPHAsset"] as? PHAsset{
                    if let fileName = asset.value(forKey: "filename") as? String{
                        //  print(fileName)
                        //filename.text = fileName
                        self.mybusinesslabel.text = fileName
                        self.mybusinesslabel.isHidden = false
                        self.CROSS.isHidden = false
                        self.businessprogressview.isHidden = true
                        businessprogressview.setProgress(1.0, animated: true)
                        self.selectbusinessproofDocuementproofview.isHidden = true
                        self.CROSS.isHidden = false
                        self.mybusinesslabel.isHidden = false
                    }
                }
                bothcilckstring = "1"

                let resizeImage =  ValidateValues.ResizeImage(image: image, targetSize:CGSize(width:200,height:200))
                let imageData = UIImageJPEGRepresentation(resizeImage, 0.01)!
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                let myString = formatter.string(from: Date())
                let yourDate = formatter.date(from: myString)
                formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
                let photoDateAndTimeSTR = formatter.string(from: yourDate!)
                let agentImageUpload = "agentImageUpload"
                //            defaults.set(self.mobileNumber.text!, forKey: "Mymobilenumbervalue")
                let defaults = UserDefaults.standard
                let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
                let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"jpg","filecat":filecatgeorysingeledit,"Longitude":self.longitude,"Latitude":self.lattitude,"address":self.address,"Timestamp":photoDateAndTimeSTR,"type_id":idselection,"id":"571"] as [String : Any]
                print(params1)
                let manager : AFHTTPSessionManager = AFHTTPSessionManager()
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
                manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
                let operation = manager.post("http://172.31.0.23/NumberMall/agent_Gwy.php", parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                    formData.appendPart(withFileData: imageData, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
                    
                }, success: { (operation, responseObject) -> Void in
                    
                    print(operation)
                    print(responseObject ?? "")
                    
                    let Result = responseObject as! NSDictionary
                    let StatusCode = Result.object(forKey: "StatusCode") as! Int
                    
                    print(Result)
                    print(StatusCode)
                    
                    if StatusCode == 1{
                        let defaultssinglvalue = UserDefaults.standard
                        self.ImageTypestring = Result.value(forKey:"Image")as!String
                        self.FileTypestring = Result.value(forKey:"FileType")as!String
                        self.filecattypestring = Result.value(forKey:"FileCat")as!String
                        defaultssinglvalue.set(self.ImageTypestring, forKey:"Myimagetypestring")
                        defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                        defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                        defaultssinglvalue.synchronize()
//                        self.savefinalvalues.isHidden = false
                        
                        if self.bothcilckstringTwo == "2"
                        {
                            self.savefinalvalues.isHidden = false
                            
                        }
                    }
                    else{
                        
                    }
                    
                }) { (operation, error) -> Void in
                    print(error)
                }
                picker.dismiss(animated: true, completion: nil)
            }
        }
        }
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated:  true, completion: nil)
    }
    
 func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL])
 {
    let pdfData = try! Data(contentsOf: urls[0])
    let data : Data = pdfData
    print(data)
    let floatSize = Float(data.count / 1024)
    print(floatSize)
    
    businessprogressview.setProgress(1.0, animated: true)
    self.selectbusinessproofDocuementproofview.isHidden = true
    self.businessprogressview.isHidden = true
    
    
    
    if (floatSize < 500) || (floatSize == 500)
    {
        bothcilckstring = "1"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
        let photoDateAndTimeSTR = formatter.string(from: yourDate!)
        let agentImageUpload = "agentImageUpload"
        let defaults = UserDefaults.standard
        let finalvalueis = defaults.value(forKey:"Mymobilenumbervalue")
        let params1 = ["method":agentImageUpload,"MobileNo":finalvalueis!,"filetype":"pdf","filecat":filecatgeorysingeledit,"Longitude":self.longitude,"Latitude":self.lattitude,"address":self.address,"Timestamp":photoDateAndTimeSTR,"type_id":idselection,"id":"571"] as [String : Any]
        print(params1)
        let manager : AFHTTPSessionManager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        let operation = manager.post("http://172.31.0.23/NumberMall/agent_Gwy.php", parameters: params1, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
            formData.appendPart(withFileData: data, name: "Image", fileName: "ProofIDDocument.jpg", mimeType: "image/jpg")
            
        }, success: { (operation, responseObject) -> Void in
            
            print(operation)
            print(responseObject ?? "")
            
            let Result = responseObject as! NSDictionary
            let StatusCode = Result.object(forKey: "StatusCode") as! Int
            
            print(Result)
            print(StatusCode)
            
            if StatusCode == 1{
                let defaultssinglvalue = UserDefaults.standard
                self.ImageTypestring = Result.value(forKey:"Image")as!String
                self.FileTypestring = Result.value(forKey:"FileType")as!String
                self.filecattypestring = Result.value(forKey:"FileCat")as!String
                defaultssinglvalue.set(self.ImageTypestring, forKey:"Myimagetypestring")
                defaultssinglvalue.set(self.FileTypestring, forKey:"MyFileTypestring")
                defaultssinglvalue.set(self.filecattypestring, forKey:"MyFilecattypestring")
                defaultssinglvalue.synchronize()
//                bothcilckstring = "1"

                if self.bothcilckstringTwo == "2"
                {
                    self.savefinalvalues.isHidden = false

                }
                
                
            }
            else{
                
            }
            
        }) { (operation, error) -> Void in
            print(error)
        }
    }
    }

    func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    
   

    
    
    @IBAction func uploadbusinesscameraokfinal(_ sender: UIButton) {
        self.selectbusinessproofDocuementproofview.isHidden = true
        if self.bothcilckstring == "1"
        {
            self.savefinalvalues.isHidden = false
            
        }
    }
    
    @IBOutlet weak var uploadbusinessreqirementview: UIButton!
    
    
    @IBAction func CancelselectbusinessproofDocuement(_ sender: UIButton)
    {
        self.selectbusinessproofDocuementproofview.isHidden = true
      
    }
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            myPickerController.allowsEditing = true
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func proofssavebutton(_ sender: UIButton)
    {
       updateimagesinglvalue()
    }
    @IBAction func Mycrossbutton(_ sender: UIButton)
    {
        self.CROSS.isHidden = true
        self.mybusinesslabel.isHidden = true
        self.mybusinesslabel.text = nil
        self.camerabutton.setBackgroundImage(#imageLiteral(resourceName: "camera"), for:.normal)
        self.cameraimageview.image = #imageLiteral(resourceName: "camera")
        self.savefinalvalues.isHidden = true
    }
    
    func getFileName(info: [String : Any]) -> String
    {
        if let imageURL = info[UIImagePickerControllerReferenceURL] as? URL {
            let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
            let asset = result.firstObject
            let fileName = asset?.value(forKey: "filename")
            let fileUrl = URL(string: fileName as! String)
            if let name = fileUrl?.deletingPathExtension().lastPathComponent {
                print(name)
                return name
            }
        }
        return ""
    }
    @IBAction func mybackbutton(_ sender: UIButton)
    {

    self.dismiss(animated:true, completion:nil)
    }
    
    func updateimagesinglvalue()
    {
      
            self.showSpinner()
            let defaultsingelvalue = UserDefaults.standard
            //  var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
            var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)

            let kuserdefaukts = UserDefaults.standard

            if let Myagentidfinal:String = kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String
            {
                self.Newagentid = Myagentidfinal
            }
    
            if let MyMobilenumbervalue:String = kuserdefaukts.value(forKey:"Mymobilenumbervalue")as!String
            {
                self.NewMobileNumber = MyMobilenumbervalue
            }
        if let Myagentidvalue:String = kuserdefaukts.value(forKey:"Myagentid")as!String
        {
            self.Myagentidfinal = Myagentidvalue
        }
        
        
            request.httpMethod = "POST"
        

        let datafour = ["proofdetails":["fileCategory":filecatgeorysingeledit,"type_id":"0","image":self.ImageTypestring,"Longitude":self.longitude,"Latitude": self.lattitude,"address": self.address,"id":"571"]]
                let jsonData = try? JSONSerialization.data(withJSONObject:datafour, options: [])
                let jsonString = String(data: jsonData!, encoding: .utf8)
                print(jsonString)
        let postString =  String(format: "method=%@&agentID=%@&mobileNo=%@&type=%@&updateflag=%@&category=%@&data=%@","getownerdetails", self.Myagentidfinal,NewMobileNumber,"post","0","proofdetails",jsonString!)
            print(postString)

            request.httpBody = postString.data(using: .utf8)
            request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            Alamofire.request(request).responseJSON { response in
                switch response.result
                {
                case .success(_):
                    print(response.result)

                    if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                    {
                        print(dictsingelvalue)

                        if let str2:NSNumber = dictsingelvalue.value(forKey:"Status")as?NSNumber
                        {
                            print(str2)
                            if  str2 == 0
                            {
                                self.removeSpinner()
//                                self.veryalertview.isHidden = true
                            }
                            if  str2 == 1
                            {
                                self.removeSpinner()

//                                self.EditaccountNametimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EEditaccountNametimertimerAction), userInfo: nil, repeats: false)
                        DispatchQueue.main.async {
                                    let viewtwo = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
                                    self.present(viewtwo, animated: true, completion:nil)

                                }

                            }

                        }



                    }
                    break
                case .failure(_):
                    break
                }
            }
    }
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    @IBAction func Emailbuttontotal(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            self.Emailvalue()
        }
    }
    
    func Emailvalue()
    {
        self.showSpinner()
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        if let Mybusinessnumberfinlavalue:String = dafaults.value(forKey:"Mybusinessnumber")as?String
        {
            self.Mybusinessnumbertotalvalueis = Mybusinessnumberfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format:"method=%@&mobileNo=%@","sendEmail", self.Mybusinessnumbertotalvalueis)
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.httpBody = postString.data(using: .utf8)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                
                if let dictfinalvaluefinal:NSDictionary = response.result.value as? NSDictionary
                {
                    if dictfinalvaluefinal.count > 0
                    {
                        DispatchQueue.main.async
                            {
                                self.removeSpinner()
                        }
                        let  statusstring = dictfinalvaluefinal.value(forKey:"StatusMsg")
                        self.Loginstrsucess = statusstring as! String
                        if  self.Loginstrsucess == "Success"
                        {
                            DispatchQueue.main.async {
                                
                                let msgfinalvalueis = dictfinalvaluefinal.value(forKey:"msg")as!String
                                self.view.makeToast(msgfinalvalueis)
                            }
                        }
                    }
                   
                    
                }
                break
            case .failure(_):
                DispatchQueue.main.async
                {
                    self.removeSpinner()
                }
                break
            }
        }
    }
    @IBAction func DownLaodbuttontotal(_ sender: UIButton)
    {
        let urlString = self.upLoadauthorisationstring
        let url = URL(string: urlString)
        let fileName = String((url!.lastPathComponent)) as NSString
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName)")
        let fileURL = URL(string: urlString)
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url:fileURL!)
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                    do {
                        let contents  = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                        for indexx in 0..<contents.count {
                            if contents[indexx].lastPathComponent == destinationFileUrl.lastPathComponent {
                                let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
                                self.present(activityViewController, animated: true, completion: nil)
                            }
                        }
                        
                    }
                    catch (let err) {
                        print("error: \(err)")
                    }
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
            } else {
                print("Error took place while downloading a file. Error description: \(error?.localizedDescription ?? "")")
            }
        }
        task.resume()
    }
 
}
extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String
    {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
   }
    func makeAColl()
    {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                    
                
                    
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
}
 
}
extension UITextField {
    //https://stackoverflow.com/questions/26800963/uitextfield-border-for-bottom-side-only
//    func useUnderlinetwo() {

    func useUnderlinetwo()
        
    {
        
        let border = CALayer()
        
        let width = CGFloat(1.0)
        
        border.borderColor = UIColor.textfiledbottomcolorside().cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
extension UITextField {
    
    func applyCustomEffect() {
        self.borderStyle = .none
        self.backgroundColor = UIColor.groupTableViewBackground // Use anycolor that give you a 2d look.
        
        //To apply corner radius
        self.layer.cornerRadius = self.frame.size.height / 2
        
        //To apply border
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.white.cgColor
        
        //To apply Shadow
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize.zero // Use any CGSize
        self.layer.shadowColor =
            UIColor.lightGray.cgColor
        
        self.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
    }
}
extension UIButton {
    
    public func addBordertwo(side: UIButtonBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.textfiledbottomcolorside().cgColor
        
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
}
}
extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
}
