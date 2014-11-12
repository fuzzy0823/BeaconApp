//
//  BLEPeripheralManager.swift
//  BeaconApp
//
//  Created by r.nakamori on 2014/11/11.
//  Copyright (c) 2014年 Takahashimoto. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import CoreBluetooth

let logger = Logger()

/*
ペリフェラルを管理するクラス
*/
class BLEPeripheralManager : NSObject , CBPeripheralManagerDelegate, CLLocationManagerDelegate{
    
    //BLEのペリフェラルマネージャー,発信側の機能をサポートする役割を担う
    private var peripheralManager : CBPeripheralManager?

    //位置情報を監視するロケーションマネージャー
    private var locationManager : CLLocationManager?

    //領域観測の対象となるBeacon
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "CB86BC31-05BD-40CC-903D-1C9BD13D966B"), identifier: NSBundle.mainBundle().bundleIdentifier)

    //シングルトンインスタンス
    class var sharedInstance : BLEPeripheralManager{
        struct Static {
            static let instance : BLEPeripheralManager = BLEPeripheralManager()
        }
        return Static.instance
    }
    
    //scanningを開始するかどうかの判定ロジック
    func startScanning(){
        println("startScanning")
        if(!CLLocationManager.isMonitoringAvailableForClass(CLBeaconRegion)){
            //iBeaconに対応していないデバイスなのでscanningをしない
            println("MonitoringUnavailable")
            return
        }
        if(!CLLocationManager.isRangingAvailable()){
            //iBeaconのranging機能がしようできないのでscanningをしない
            println("RangingUnavailable")
            return
        }
        
        //アプリがバックグランド状態の場合、位置情報のバックグランド更新をする
        let appStatus = UIApplication.sharedApplication().applicationState
        let isBackground = appStatus == UIApplicationState.Background || appStatus == UIApplicationState.Inactive
        if(isBackground){
            println("Location Update")
            self.locationManager?.startUpdatingLocation()
        }
    }
    
    //ペリフェラルマネージャーの初期化
    func setup() {
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }

    //Advertisingスタート
    func startAdvertising(_advertisementData:[NSObject : AnyObject]!){
        logger.log("startAdvertising");
        //self.peripheralManager?.startAdvertising(<#advertisementData: [NSObject : AnyObject]!#>)
    }

    //Advertisingストップ
    func stopAdvertising(_advertisementData:[NSObject : AnyObject]!){
        logger.log("stopAdvertising");
        self.peripheralManager?.stopAdvertising()
    }

    // BeaconRegionを定義
    func defineBeaconRegion(){
        //let definedBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID, major: myMajorId, minor: myMinorId, identifier: myIdentifier)
        //return definedBeaconRegion
    }
    
    // Advertisingのフォーマットを作成
    func prepareAdvertising(){
        //let BeaconPeripheralData = BeaconRegion.peripheralDataWithMeasuredPower(nil)
        //return BeaconPeripheralData
    }

    //Bluetoothの状態変化があると呼ばれる
    func peripheralManagerDidUpdateState(peripheral:CBPeripheralManager){
        peripheral.stopAdvertising()
        switch peripheral.state{
        case .PoweredOff:
            println("PoweredOff")
        case .PoweredOn:
            println("PoweredOn")
        case .Resetting:
            println("Resetting")
        case .Unauthorized:
            println("Unauthorized")
        case .Unknown:
            println("Unknown")
        case .Unsupported:
            println("Unsupported")
        }
    
        if(peripheral.state != .PoweredOn){
            //アラート等でBluetoothをOnにするように促す
            return
        } else {
            //BeaconRegionを定義(defineBeaconRegion)
            //渡すデータ準備(prepareAdvertising)
            //startAdvertisingを呼ぶ
        }
    }
    
    //Advertising時のエラー判定
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        if(error == nil){
            //エラーなし
            println("Success to advertise our beacon!")
        } else {
            //エラーあり
            println("Failed to advertise our beacon, Error = \(error)")
        }
    }
    
}

