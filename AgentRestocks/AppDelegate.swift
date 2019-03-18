//
//  AppDelegate.swift
//  AgentRestocks
//
//  Created by Azharuddin on 06/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
// https://spin.atomicobject.com/2017/07/18/swift-interface-builder/
import  IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces
// Numbermall.in.AgentRestock
import Foundation
import SystemConfiguration

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate,GMSMapViewDelegate
{
    var window: UIWindow?
    static var menu_bool = true
    var startTime = String()
    var CloaseTime = String()
    var Locationarrayone = [String]()
    var Locationarraytwo = [String]()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        IQKeyboardManager.sharedManager().previousNextDisplayMode = .alwaysHide
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = false
        GMSPlacesClient.provideAPIKey("AIzaSyD3lxd67FzvApxX4RHZlU8r6krwStt1IVM")
        GMSServices.provideAPIKey("AIzaSyD3lxd67FzvApxX4RHZlU8r6krwStt1IVM")
        GMSServices.openSourceLicenseInfo()
        let valuetodayTime = getTodayString()
        startTime  = valuetodayTime
       self.user_defa1()
       self.userdefafinalValue()
        let kuserdefaukts = UserDefaults.standard
        kuserdefaukts.setValue("", forKey:"1")
        kuserdefaukts.synchronize()
        return true
    }
    func isInternetAvailable() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    func userdefafinalValue()
    {
        let kUserDefault = UserDefaults.standard
        
        if kUserDefault.value(forKey: "islogintrue") != nil {
            let finaldemovalue = kUserDefault.value(forKey:"islogintrue")as!String
            print(finaldemovalue)
                if finaldemovalue == "islogin" {

                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let initialViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")as!HomeViewController
                    self.window?.rootViewController = initialViewController
                    self.window?.makeKeyAndVisible()

                }
                else {
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                     let initialViewController = storyboard.instantiateViewController(withIdentifier: "AnimationLoginViewController")as!                    AnimationLoginViewController
                    self.window?.rootViewController = initialViewController
                    self.window?.makeKeyAndVisible()

                }
            }
    }
    func applicationWillResignActive(_ application: UIApplication)
    {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
      
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
       
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
       
    }
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        return today_string
    }
    func user_defa1()
    {
        let kuserdefaukts = UserDefaults.standard
        kuserdefaukts.set("", forKey: "arryone")
        kuserdefaukts.set("", forKey: "finaldictvalue")
        kuserdefaukts.set("", forKey: "finaldicTwotvalue")
        kuserdefaukts.setValue("", forKey:"MyarryTwofinal")
        kuserdefaukts.setValue("", forKey:"Gstname")
        kuserdefaukts.setValue("", forKey:"panname")
        kuserdefaukts.setValue("", forKey:"Busnessname")
        kuserdefaukts.setValue("", forKey:"Mymobilenumber")
        kuserdefaukts.setValue("", forKey:"textenterotpfinalvalue")
        kuserdefaukts.setValue("", forKey:"Mymobilenumbervaluefinal")
        kuserdefaukts.setValue("", forKey:"Billingadressset")
     
        kuserdefaukts.setValue("", forKey:"MyBillingadressset")
        kuserdefaukts.setValue("", forKey:"Billingfirstdict")
        kuserdefaukts.setValue("", forKey:"Billingseconddicttdict")
        kuserdefaukts.setValue("", forKey:"Deliverygarryone")
        kuserdefaukts.setValue("", forKey:"Deliveryfirstdict")
        kuserdefaukts.setValue("", forKey:"Deliveryseconddict")
        kuserdefaukts.setValue("", forKey:"Mydeliveryadressset")
        kuserdefaukts.setValue("", forKey:"Mydeliveryadresssetfinalvalue")
        kuserdefaukts.setValue("", forKey:"Deliverythirdtdict")
        kuserdefaukts.setValue("", forKey:"DeliveryFourthdict")
     kuserdefaukts.setValue("", forKey:"myanothersvalue")
        kuserdefaukts.setValue("", forKey:"singelupdate")
        kuserdefaukts.setValue("", forKey:"MyKycpending")
        kuserdefaukts.setValue("", forKey:"MyKycMessagelabel")
        kuserdefaukts.setValue("", forKey:"Myvaluecart")
        kuserdefaukts.setValue("", forKey:"Mydelete")
        kuserdefaukts.setValue("", forKey:"MycartQuantity")
        kuserdefaukts.setValue("", forKey:"Mytotal_cart")
        kuserdefaukts.setValue("", forKey:"MycartCount")
        kuserdefaukts.setValue("", forKey:"Shoutsecondvalue")
        kuserdefaukts.setValue("", forKey:"Mycashbackarray")

        kuserdefaukts.setValue("", forKey:"Myproductdetailsary")

        kuserdefaukts.setValue("", forKey:"locationname")
        kuserdefaukts.setValue("", forKey:"landmarkname")
        kuserdefaukts.setValue("", forKey:"Combopage1")
        kuserdefaukts.setValue("", forKey:"arryone")
        kuserdefaukts.setValue("", forKey:"MyarryTwofinal")
        kuserdefaukts.setValue("", forKey:"arraytwo")
        kuserdefaukts.setValue("", forKey:"Mybusinessname")
        kuserdefaukts.setValue("", forKey:"Combopage1")

       // kuserdefaukts.setValue("", forKey:"isverystring")
        kuserdefaukts.setValue("", forKey:"1")
        
        kuserdefaukts.setValue("", forKey:"Myproductdictfinalavlue")

        kuserdefaukts.setValue("", forKey:"Mybusinessname")
        kuserdefaukts.setValue("", forKey:"Myemail_id")
        kuserdefaukts.setValue("", forKey:"MyMobilevericationvalue")
        kuserdefaukts.setValue("", forKey:"MyMobilevericationcolor")
        kuserdefaukts.setValue("", forKey:"Mybusinessnumber")
        kuserdefaukts.setValue("", forKey:"Myuploadauthone")
        kuserdefaukts.setValue("", forKey:"Mystatus_color")
        kuserdefaukts.setValue("", forKey:"Myuploadauthtwo")
        kuserdefaukts.setValue("", forKey:"Myuploadauthtwocolor")
        kuserdefaukts.setValue("", forKey:"Myuploadauththree")
        kuserdefaukts.setValue("", forKey:"Myuploadauththreecolor")
        kuserdefaukts.setValue("", forKey:"MybusinessDictarray")
        kuserdefaukts.setValue("", forKey:"MybillingJSONadresslocation")

        kuserdefaukts.setValue("", forKey:"MybillingJSONasaveAsfinalvalue")
        kuserdefaukts.setValue("", forKey:"MyDeliveryadresslocation")
        kuserdefaukts.setValue("", forKey:"MydeliveryJSONasaveAsfinalvalue")

        kuserdefaukts.setValue("", forKey:"MydeliveryJSONasaveAsfinalvaluetwo")
        
        kuserdefaukts.setValue("", forKey:"myproductidvalue")

        kuserdefaukts.setValue("", forKey:"Mycommentstotal")

    }
}
