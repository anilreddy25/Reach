//
//  OrderTrackingVC.swift
//  AgentRestocks
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class OrderTrackingVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var lblOrderTrack: UILabel!
    
    @IBOutlet weak var lblItemsandQnty: UILabel!
    
    @IBOutlet weak var mapKit: MKMapView!
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!

    
    class customPin: NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String?
        var subtitle: String?

        init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
            self.title = pinTitle
            self.subtitle = pinSubTitle
            self.coordinate = location
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapKit.delegate = self
        
        self.mapKit.showsUserLocation = true
        let sourceLocation = CLLocationCoordinate2D(latitude: 17.427353 , longitude: 78.4463143)
        let destinationLocation = CLLocationCoordinate2D(latitude: 17.431526 , longitude: 78.3854776)

        let sourcePin = customPin(pinTitle: "Numbermall Pvt Ltd", pinSubTitle: "", location: sourceLocation)
        let destinationPin = customPin(pinTitle: "Madhapur", pinSubTitle: "", location: destinationLocation)
        self.mapKit.addAnnotation(sourcePin)
        self.mapKit.addAnnotation(destinationPin)


       mapKit.showsUserLocation = true
       mapKit.isZoomEnabled = true
       mapKit.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 17.427353 , longitude: 78.4463143), span: MKCoordinateSpanMake(0.05, 0.05)), animated: true)
        //self.mapKit.renderer(for: overlay)

        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)

        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        directionRequest.transportType =  .transit

        let directions = MKDirections(request: directionRequest)
//        directions.calculate { (response, error) in
//            guard let directionResonse = response else {
//                if let error = error {
//                    print("we have error getting directions==\(error.localizedDescription)")
//                }
//                return
//            }
//
//            //get route and assign to our route variable
//            let route = directionResonse.routes[0]
//
//
//            //add rout to our mapview
//            self.mapKit.add(route.polyline, level: .aboveRoads)
//
//            //setting rect of our mapview to fit the two locations
//            let rect = route.polyline.boundingMapRect
//            self.mapKit.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
//        }
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.mapKit.add(route.polyline)
                self.mapKit.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
   
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
   
      
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        return renderer
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        print(manager)
        
    }
    
}
