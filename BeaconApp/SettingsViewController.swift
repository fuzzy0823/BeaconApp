//
//  SettingsViewController.swift
//  BeaconApp
//
//  Created by design on 2014/11/11.
//  Copyright (c) 2014年 Takahashimoto. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class SettingsViewController: UIViewController, CBPeripheralManagerDelegate,  UITextFieldDelegate{
    
    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    
//    @IBOutlet var UuidText: UITextField!
//    @IBOutlet var majorIdPicker1: UIPickerView!
//    @IBOutlet var majorIdPicker2: UIPickerView!
//    @IBOutlet var minorIdPicker1: UIPickerView!
//    @IBOutlet var minorIdPicker2: UIPickerView!
//    
//    // LocationManager
//    var myPheripheralManager:CBPeripheralManager!
//    // Button
//    let myButton: UIButton = UIButton()
//    // UUID
//    var myTextField: UITextField!
//    // Window
//    var myWindow: UIWindow!
//    let myWindowButton = UIButton()
//    // MajorId(上位)
//    var myMajorId1: NSString = "0"
//    // MajorId(下位)
//    var myMajorId2: NSString = "0"
//    // MinorId(上位)
//    var myMinorId1: NSString = "0"
//    // MinorId(下位)
//    var myMinorId2: NSString = "0"
//    
//    // UUID
//    var myUuid: NSString = "CB86BC31-05BD-40CC-903D-1C9BD13D966A"
//    
//    
//    
//    // 表示する値の配列.
//    let myValues: NSArray = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
//    let myUuids: NSArray = ["CB86BC31-05BD-40CC-903D-1C9BD13D966A"]
    
    
    
    override func viewDidLoad() {
    }
    
    
    
    /*
    ボタンイベント
    */
    func onClickMyButton(sender: UIButton){
        
        
    }
    
    /*
    Windowの自作
    */
    func makeMyWindow(){

    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {

    }
    
    func peripheralManagerDidStartAdvertising(peripheral: CBPeripheralManager!, error: NSError!) {
        
    }
    
//    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
//        
//        return 1
//        
//    }
    
    /*
    フォントを設定
    */
//    func pickerView(pickerView: UIPickerView!, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView! {
//        
//        return lab
//        
//    }
    
    /*
    表示するデータ数.
    */
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        
//        return myValues.count
//        
//    }
    
    /*
    値を代入.
    */
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
//        
//        return myValues[row] as String
//        
//    }
    
    /*
    Pickerが選択された際に呼ばれる.
    */
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
    
    /*
    UITextFieldが編集開始された直後に呼ばれる
    */
    func textFieldDidBeginEditing(textField: UITextField!){
        
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれる
    */
//    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
//        
//        return true;
//        
//    }
    
    /*
    改行ボタンが押された際に呼ばれる
    */
//    func textFieldShouldReturn(textField: UITextField!) -> Bool {
//        
//        textField.resignFirstResponder()
//        
//        return true;
//        
//    }
}