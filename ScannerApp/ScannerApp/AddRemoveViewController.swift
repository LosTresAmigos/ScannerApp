//
//  AddRemoveViewController.swift
//  ScannerApp
//
//  Created by Ervin Del Cid on 4/25/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
class AddRemoveViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var previewView: UIImageView!
    
    
    @IBAction func addButton(_ sender: Any) {
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
               
        let docRef = db.collection("user").document(userID)
        docRef.updateData([
                   "QRCode": FieldValue.arrayUnion([code])
               ])
    }
    
    @IBAction func removeButton(_ sender: Any) {
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("user").document(userID)
        docRef.updateData([
            "QRCode": FieldValue.arrayRemove([code])
        ])
        
    }
    var imageOrientation: AVCaptureVideoOrientation?
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var code = ""
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Get an instance of the AVCaptureDevice class to initialize a
           // device object and provide the video as the media type parameter
           guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
               fatalError("No video device found")
           }
           // handler chiamato quando viene cambiato orientamento
           self.imageOrientation = AVCaptureVideoOrientation.portrait
                                 
           do {
               // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
               let input = try AVCaptureDeviceInput(device: captureDevice)
                      
               // Initialize the captureSession object
               captureSession = AVCaptureSession()
                      
               // Set the input device on the capture session
               captureSession?.addInput(input)
                      
               // Get an instance of ACCapturePhotoOutput class
               capturePhotoOutput = AVCapturePhotoOutput()
               capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                      
               // Set the output on the capture session
               captureSession?.addOutput(capturePhotoOutput!)
               captureSession?.sessionPreset = .high
                      
               // Initialize a AVCaptureMetadataOutput object and set it as the input device
               let captureMetadataOutput = AVCaptureMetadataOutput()
               captureSession?.addOutput(captureMetadataOutput)
                      
               // Set delegate and use the default dispatch queue to execute the call back
               captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
               captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                      
               //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
               videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
               videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
               videoPreviewLayer?.frame = view.layer.bounds
               previewView.layer.addSublayer(videoPreviewLayer!)

               //start video capture
               captureSession?.startRunning()
                      
           } catch {
               //If any error occurs, simply print it out
               print(error)
               return
           }
           
       }
       
       override func viewWillAppear(_ animated: Bool) {
           navigationController?.setNavigationBarHidden(true, animated: false)
           self.captureSession?.startRunning()
       }
       
       // Find a camera with the specified AVCaptureDevicePosition, returning nil if one is not found
       func cameraWithPosition(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
           let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
           for device in discoverySession.devices {
               if device.position == position {
                   return device
               }
           }
           
           return nil
       }
       
       func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                           didOutput metadataObjects: [AVMetadataObject],
                           from connection: AVCaptureConnection) {
           // Check if the metadataObjects array is contains at least one object.
           if metadataObjects.count == 0 {
               return
           }
           
           //self.captureSession?.stopRunning()
           
           // Get the metadata object.
           let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
           
           if metadataObj.type == AVMetadataObject.ObjectType.qr {
               if let outputString = metadataObj.stringValue {
                   DispatchQueue.main.async {
                       self.code = outputString
                       print(self.code)
                   }
               }
           }
           
       }
    
     
     

     //let userID = Auth.auth().currentUser!.uid

     
    // let db = Firestore.firestore()
     
     //let newdocument = db.collection("code").document()
     //newdocument.setData(["code":numcode!,"Document Id":newdocument.documentID, "User Id": userID])
     //self.lblOutput.text = outputString

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
