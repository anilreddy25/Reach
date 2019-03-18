//
//  DriecrtTrackViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import Alamofire
import AlamofireImage


class DriecrtTrackViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {


    @IBOutlet weak var mapview: GMSMapView!
   
    var welcomelatitude = NSString()
    var welcomelangitude = NSString()
    var long_array = [CGFloat]()
    var address_array = [String]()
    var lat_float = CGFloat()
    var long_float = CGFloat()
  
    var locationManager = CLLocationManager()
    let marker = GMSMarker()
    
    var dictlat = String()
    var dictlang = String()
    
    
    @IBOutlet weak var viewtopviewfinal: UIView!
    
    @IBOutlet weak var closebutton: UIButton!
    
    
    @IBOutlet weak var orderidlabel: UILabel!
    
    @IBOutlet weak var mycancelbutton: UIButton!


    @IBOutlet weak var threeitemsalbel: UILabel!
    

    @IBOutlet weak var threeitemsview: UIView!
    @IBOutlet weak var twelvequantitylabel: UILabel!
    
    @IBOutlet weak var twelvequantityview: UIView!
    
    @IBOutlet weak var amountalbel: UILabel!
    
    @IBOutlet weak var totalamountlabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapview.delegate = self
        mapview.settings.myLocationButton = true
        mapview.isMyLocationEnabled = true
        //self.determineMyCurrentLocation()
        
        viewtopviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewtopviewfinal.layer.shadowOpacity = 0.6
        viewtopviewfinal.layer.shadowRadius = 3.0
        viewtopviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        threeitemsalbel.layer.cornerRadius = threeitemsalbel.frame.size.width/2
        threeitemsalbel.layer.cornerRadius = threeitemsalbel.frame.size.height/2

        threeitemsalbel.clipsToBounds = true
        
        twelvequantitylabel.layer.cornerRadius = twelvequantitylabel.frame.size.width/2
        twelvequantitylabel.layer.cornerRadius = twelvequantitylabel.frame.size.height/2

        twelvequantitylabel.clipsToBounds = true

        
        
//        let path = GMSMutablePath()
//        path.addLatitude(-37.81319, longitude: 144.96298)
//        path.addLatitude(-31.95285, longitude: 115.85734)
//        let polyline = GMSPolyline(path: path)
//        polyline.strokeWidth = 10.0
//        polyline.geodesic = true
//        polyline.map = mapview
//        polyline.strokeColor = .black

        

        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude:17.437462, longitude:78.448288))
        path.add(CLLocationCoordinate2D(latitude: 16.314209, longitude:80.435028))
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .black
        polyline.strokeWidth = 12.0
        polyline.map = mapview
//        cra.png
        
        let marker = GMSMarker()
        let markerImage = UIImage(named:"red_pin")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: markerImage)
        markerView.tintColor = UIColor.clear
//        marker.icon =
        marker.position = CLLocationCoordinate2D(latitude:17.437462, longitude:78.448288)
        marker.iconView = markerView
        marker.title = "Punjagutta,Hyderabad, Rangareddi, Telangana"
        marker.snippet = "India"
        marker.map = mapview
        mapview.selectedMarker = marker
        
        
        
//        let markertwo = GMSMarker()
//        let markerImagetwo = UIImage(named:"red_pin")!.withRenderingMode(.alwaysTemplate)
//        let markerViewtwo = UIImageView(image: markerImagetwo)
//        markerViewtwo.tintColor = UIColor.clear
//        //        marker.icon =
//        markertwo.position = CLLocationCoordinate2D(latitude:16.314209, longitude:80.435028)
//        markertwo.iconView = markerViewtwo
//        markertwo.title = "Guntur"
//        markertwo.snippet = "India"
//        markertwo.map = mapview
//        mapview.selectedMarker = markertwo
        
        
        
        marker.icon = self.imageWithImage(image: UIImage(named: "red_pin")!, scaledToSize: CGSize(width: 3.0, height: 3.0))

//        markertwo.icon = self.imageWithImage(image: UIImage(named: "red_pin")!, scaledToSize: CGSize(width: 3.0, height: 3.0))

        
        let origin = "\(17.437462),\(78.448288)"
        let destination = "\(16.314209),\(80.435028)"
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=AIzaSyD3lxd67FzvApxX4RHZlU8r6krwStt1IVM"
        

        
        let from = CLLocationCoordinate2D(latitude: CLLocationDegrees(17.437462), longitude: CLLocationDegrees(78.448288))
        let to = CLLocationCoordinate2D(latitude: CLLocationDegrees(16.314209), longitude: CLLocationDegrees(80.435028))
//        self.getPolylineRoute(from: from, to: to)
        
        
//        let tracktabelviewViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"tracktabelviewViewController") as! tracktabelviewViewController
//        self.addChildViewController(tracktabelviewViewControllerfinal)
//
//        tracktabelviewViewControllerfinal.view.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//
//        self.mapview.addSubview(tracktabelviewViewControllerfinal.view)
//
//        tracktabelviewViewControllerfinal.didMove(toParentViewController: self)
//
//        self.mapview.backgroundColor = UIColor.white.withAlphaComponent(0.3)

    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    func imageWithView(view:UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    func getPolylineRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D)
    {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=true&mode=driving&keyAIzaSyD8e-0MhckAvsRJfLtf7vZU7YSI72AxxtE")!
        print(url)
        //https://maps.googleapis.com/maps/api/directions/json?origin=17.4264984130859,78.4482879638672&destination=17.4436492919922,78.4458236694336&sensor=true&mode=driving&keyAIzaSyD8e-0MhckAvsRJfLtf7vZU7YSI72AxxtE
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                
            }
            else {
                do {
                    if let json : [String:Any] = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]{
                        print(json)
                        guard let routes = json["routes"] as? NSArray else {
                            DispatchQueue.main.async {
                                
                            }
                            return
                        }
                        
                        if (routes.count > 0) {
                            let overview_polyline = routes[0] as? NSDictionary
                            let dictPolyline = overview_polyline?["overview_polyline"] as? NSDictionary
                            print(dictPolyline)
                            let points = dictPolyline?.object(forKey: "points") as? String
                            print(points)
                            self.showPath(polyStr: points!)
                            
                            DispatchQueue.main.async
                                {
                                let bounds = GMSCoordinateBounds(coordinate: source, coordinate: destination)
                                let update = GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(170, 30, 30, 30))
                                self.mapview.moveCamera(update)
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                print("no path points")
                            }
                        }
                    }
                }
                catch {
                    print("error in JSONSerialization")
                    DispatchQueue.main.async {
                        
                    }
                }
            }
        })
        task.resume()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading)
    {
        let  heading:Double = newHeading.trueHeading;
        marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
        marker.rotation = heading
        marker.map = self.mapview
        print(marker.rotation)
    }
    func showPath(polyStr :String)
    {
        DispatchQueue.main.async {
            let path = GMSPath(fromEncodedPath: polyStr)
            let polyline = GMSPolyline(path: path)
            
            polyline.strokeWidth = 6.0
            polyline.strokeColor = UIColor.black
            polyline.map = self.mapview
        }
    }
    func drawRectange()
    {
        /* create the path */
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        
        /* show what you have drawn */
        let rectangle = GMSPolyline(path: path)
        rectangle.map = mapview
        
        
//        polyline.strokeWidth = 10.0
//        polyline.geodesic = true
//        polyline.map = mapview
//        polyline.strokeColor = .black
    }
  
    func determineMyCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        locationManager.startUpdatingLocation()
        welcomelatitude = String(userLocation.coordinate.latitude) as NSString
        welcomelangitude  = String(userLocation.coordinate.longitude)as NSString
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(welcomelatitude as String)!, longitude:CLLocationDegrees(welcomelangitude as String)!, zoom:15.0)
        self.mapview.camera = camera
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
        
    }
    @IBAction func Myclosebutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func Mycancelbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
 
}
