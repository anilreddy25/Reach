//
//  BarcodeTypeViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 12/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class BarcodeTypeViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    var Barcode_stringValue = String()
    var productidfinalvalue = String()
    var dictfinacode = NSDictionary()
    var productuseridfinalvalue = String()

    @IBOutlet weak var barcodetypeview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        barcodetypeview.layer.shadowOffset = CGSize(width: 0, height: 3)
        barcodetypeview.layer.shadowOpacity = 0.6
        barcodetypeview.layer.shadowRadius = 3.0
        barcodetypeview.layer.shadowColor = UIColor.color3().cgColor
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
            
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x:0, y:self.barcodetypeview.frame.size.height+5, width:self.view.frame.size.width, height: self.view.frame.size.height)
        
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
        
    
    }
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
              self.Barcodescanidvalue()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
        self.Barcode_stringValue = code
        
      
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func MYBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    func Barcodescanidvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.productuseridfinalvalue = Myagentidfinal
        }
        
        
        let postString =  String(format: "method=%@&searchString=%@&userid=%@","searchByBarcode", self.Barcode_stringValue,self.productuseridfinalvalue)
        
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dictfinalvalue:NSDictionary = response.result.value as? NSDictionary {
                    self.dictfinacode = dictfinalvalue
                    

                    self.productidfinalvalue = self.dictfinacode.value(forKey:"productId")as!String
                    
                    print(self.productidfinalvalue)
                    
                    DispatchQueue.main.async {
                        self.view.makeToast("Scan the product barcode in the box")
                        let viewtwo = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                        viewtwo.productdemoidfinalvalue = self.productidfinalvalue
                        self.present(viewtwo, animated: true, completion:nil)
                        
                    }
                }
                break
            case .failure(_):
                break
            }
            
            
            
        }
    }
}
