//
//  ViewController.swift
//  BeaconApp
//
//  Created by k2-hashimoto on 2014/11/05.
//  Copyright (c) 2014年 Takahashimoto. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate, UITextFieldDelegate {
    
    // LocationManager
    var myPheripheralManager:CBPeripheralManager!
    let myButton: UIButton = UIButton()
    var myWindow: UIWindow!
    let myWindowButton = UIButton()
    
    // UUID
    var myUuid: NSString = "CB86BC31-05BD-40CC-903D-1C9BD13D966A"
    var myMajorString: NSString = "00"
    var myMinorString: NSString = "00"

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // PeripheralManagerを定義.
        myPheripheralManager = CBPeripheralManager(delegate: self, queue: nil)

        setView()
        
    }
    
    func setView(){

        let centexOfX: CGFloat = self.view.bounds.width/2
        let centerOfY: CGFloat = self.view.bounds.height/2

        // 発信ボタン設定
        myButton.frame = CGRectMake(0,0,80,80)
        myButton.backgroundColor = UIColor.blueColor();
        myButton.layer.masksToBounds = true
        myButton.setTitle("発信", forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        myButton.layer.cornerRadius = 40.0
        myButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 100)
        myButton.tag = 1
        myButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(myButton);
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    // 画面が回転されたとき
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        setView()
    }
    
    /*
    ボタンイベント
    */
    func onClickMyButton(sender: UIButton){
        
        if sender == myWindowButton {
            
            myWindow.hidden = true
            
            myButton.hidden = false
            
            myPheripheralManager.stopAdvertising()
            
        } else if sender == myButton {
            
            myWindow = UIWindow()
            
            myButton.hidden = true
            
            makeMyWindow()
            
            // iBeaconのUUID.
            let LSUuid : String = LSManager.lsmanager.getLSString("uuid")
            if(LSUuid != ""){
                myUuid = LSUuid
            }
            let myProximityUUID = NSUUID(UUIDString: myUuid)
            
            // iBeaconのIdentifier.
            let myIdentifier = "akabeacon"
            
            // MajorId
            let LSMajorid : String = LSManager.lsmanager.getLSString("majorid")
            if(LSMajorid != ""){
                myMajorString = LSMajorid
            }
            var myMajorInt: CUnsignedInt = 0
            NSScanner(string: myMajorString).scanHexInt(&myMajorInt)
            let myMajorId: CLBeaconMajorValue =  CLBeaconMajorValue(myMajorInt)

            // MinorId
            let LSMinorid : String = LSManager.lsmanager.getLSString("minorid")
            if(LSMinorid != ""){
                myMinorString = LSMinorid
            }
            var myMinorInt: CUnsignedInt = 0
            NSScanner(string: myMinorString).scanHexInt(&myMinorInt)
            let myMinorId: CLBeaconMajorValue =  CLBeaconMajorValue(myMinorInt)
            
            // BeaconRegionを定義.
            let myBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID, major: myMajorId, minor: myMinorId, identifier: myIdentifier)
            
            // Advertisingのフォーマットを作成.
            let myBeaconPeripheralData = myBeaconRegion.peripheralDataWithMeasuredPower(nil)
            println(myBeaconPeripheralData)
            // Advertisingを発信.
            myPheripheralManager.startAdvertising(myBeaconPeripheralData)
            
        }
        
    }
    
    /*
    Windowの自作
    */
    func makeMyWindow(){
        
        // 背景を白に設定
        myWindow.backgroundColor = UIColor.lightGrayColor()
        myWindow.frame = CGRectMake(0, 0, self.view.bounds.width - 50, self.view.bounds.height - 150)
        myWindow.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myWindow.alpha = 0.8
        myWindow.layer.cornerRadius = 30
        myWindow.layer.borderColor = UIColor.blackColor().CGColor
        myWindow.layer.borderWidth = 2
        // myWindowをkeyWindowにする
        myWindow.makeKeyWindow()
        
        // windowを表示する
        self.myWindow.makeKeyAndVisible()
        
        // ボタン生成
        myWindowButton.frame = CGRectMake(0, 0, 80, 80)
        myWindowButton.backgroundColor = UIColor.redColor()
        myWindowButton.setTitle("停止", forState: .Normal)
        myWindowButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 40.0
        myWindowButton.layer.position = CGPointMake(self.myWindow.frame.width/2, self.myWindow.frame.height-50)
        myWindowButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.myWindow.addSubview(myWindowButton)
        
        // TextView生成
        let myTextView: UITextView = UITextView(frame: CGRectMake(10, 110, self.myWindow.frame.width - 20, 150))
        myTextView.backgroundColor = UIColor.clearColor()
        myTextView.text = "iBeaconの発信を開始しました。\n\n UUID:\n\(myUuid)\n Major Id:\(myMajorString) \n Minor Id:\(myMinorString)"
        myTextView.font = UIFont.systemFontOfSize(CGFloat(15))
        myTextView.textColor = UIColor.blackColor()
        myTextView.textAlignment = NSTextAlignment.Left
        myTextView.editable = false
        self.myWindow.addSubview(myTextView)
        
        // 表示する画像.
        let myImage: UIImage = UIImage(named: "ibeacon.png")!
        let myImageView: UIImageView = UIImageView(frame:  CGRect(x: self.myWindow.frame.width/2 - 60, y: 5, width: 100, height: 100))
        myImageView.image = myImage
        self.myWindow.addSubview(myImageView)
        
    }

    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        
        println("peripheralManagerDidUpdateState")
    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        
        println("peripheralManagerDidStartAdvertising")
    }
    
}