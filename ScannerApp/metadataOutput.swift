//
//  metadataOutput.swift
//  ScannerApp
//
//  Created by Raul Flores on 4/23/20.
//  Copyright © 2020 LosTresAmigos. All rights reserved.
//

import Foundation


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
            print(outputString)
            self.lblOutput.text = outputString
        }
    }
}
