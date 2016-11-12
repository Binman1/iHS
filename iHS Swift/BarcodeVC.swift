//
//  BarcodeVC.swift
//  iHS Swift
//
//  Created by arash on 11/10/16.
//  Copyright © 2016 Ali Zare Sh. All rights reserved.
//

import UIKit
import AVFoundation

/*
 Arash : Section1 - Barcode View Controller
 */

class BarcodeVC: UIViewController , AVCaptureMetadataOutputObjectsDelegate{
    @IBOutlet weak var viewForQRReader: UIView!
    
    var captureSession : AVCaptureSession?
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrCodeFrameView : UIView?
    
    // Added to support different barcodes
    //    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeCaptureView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if captureSession?.running == false {
            captureSession?.startRunning()
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession?.running == true {
            captureSession?.stopRunning()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Selector Swipe Right
    @IBAction func swipeRightSelector(sender: UISwipeGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        captureSession?.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(readableObject.stringValue)
        }
    }
    
    
    func found (code : String ) {
        do {
            let jsonQRData = try JSONSerializer.toDictionary(code)
            let centerIP = jsonQRData["CenterIP"] as! String
            let centerPort = jsonQRData["CenterPort"] as! Int
            let exkey = jsonQRData["ExKey"] as! String
            
//            if DBManager.updateSettingValue("CenterIP", value: centerIP) && DBManager.updateSettingValue("CenterPort", value: String(centerPort)) && DBManager.updateSettingValue("ExKey", value: exkey) {
//                DBManager.connection.close()
//                let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//                appDel.socket.openSocket()
//            }
        } catch let err as NSError {
            Printer(err.debugDescription)
        }
    }
    
    /// Function for make a capture view for capture and read barcode
    func makeCaptureView() {
        captureSession = AVCaptureSession()
        
        let captureDevices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        var videoInput : AVCaptureDeviceInput?
        
        do {
            for device in captureDevices {
                if device.position == AVCaptureDevicePosition.Front {
                    videoInput = try AVCaptureDeviceInput(device: device as! AVCaptureDevice)
                }
            }
            
            if captureSession!.canAddInput(videoInput) {
                captureSession!.addInput(videoInput)
            } else {
                Printer("The captureSession can't add input")
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if captureSession!.canAddOutput(metadataOutput) {
                captureSession!.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
                metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
                
                viewForQRReader.layer.removeFromSuperlayer()
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer!.frame = CGRectMake(0 , 0 , WIDTHPHONE/1.6 , HEIGHTPHONE/3)
                videoPreviewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
                viewForQRReader.layer.addSublayer(videoPreviewLayer!)
            } else {
                Printer("capture session can't add output")
                return
            }
            
        } catch let errr as NSError{
            Printer(errr.debugDescription)
            return
        }
    }
}
