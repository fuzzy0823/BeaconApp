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

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate{
    
    var myTableView: UITableView!
    var uuidField: UITextField!
    var majoridField: UITextField!
    var minoridField: UITextField!
    
    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // Sectionで使用する配列を定義する.
    let mySections: [String] = ["UUID", "MajorID", "MinorID"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }

    func setView(){
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height   // ステータスバーの高さ
        let displayWidth: CGFloat = self.view.frame.width   // Viewの幅
        let displayHeight: CGFloat = self.view.frame.height // Viewの高さ
        // Table
        if(myTableView == nil){
            myTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: 150))
            myTableView.scrollEnabled = false
            myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
            myTableView.dataSource = self
            myTableView.delegate = self
            self.view.addSubview(myTableView)
        }else{
            myTableView.frame = CGRectMake(0, barHeight + 50, displayWidth, 150)
        }

        // Text
        if(uuidField != nil){
            uuidField.frame = CGRectMake(10,6,displayWidth - 20,30)
        }
        if(majoridField != nil){
            majoridField.frame = CGRectMake(10,6,displayWidth - 20,30)
        }
        if(minoridField != nil){
            minoridField.frame = CGRectMake(10,6,displayWidth - 20,30)
        }

    }
    // 画面が回転されたとき
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        setView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    セクションの数を返す.
    */
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return mySections.count
    }
    
    /*
    セクションのタイトルを返す.
    */
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return mySections[section] as String
//    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 各Textにフォーカスをあてる
        if indexPath.section == 0 {
            uuidField.becomeFirstResponder()
        } else if indexPath.section == 1 {
            majoridField.becomeFirstResponder()
        } else if indexPath.section == 2 {
            minoridField.becomeFirstResponder()
        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//        } else if section == 1 {
//        } else if section == 2 {
//        }
        return 1
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell

        let displayWidth: CGFloat = self.view.frame.width   // Viewの幅
        cell.textLabel.text = mySections[indexPath.section]
        if indexPath.section == 0 { // このへんはVeiwDidLoadでやっておくべき？
            

//            let uuidField: UITextField = UITextField(frame: CGRectMake(10,6,300,30))
            uuidField = UITextField(frame: CGRectMake(80,7,displayWidth - 100,30))
            let LSUuid = LSManager.lsmanager.getLSString("uuid")
            if (LSUuid != ""){
                uuidField.text = LSUuid
            }else{
                uuidField.text = "CB86BC31-05BD-40CC-903D-1C9BD13D966A"
                LSManager.lsmanager.setLS("uuid", value: uuidField.text)
            }
            uuidField.delegate = self
            uuidField.borderStyle = UITextBorderStyle.None
//            uuidField.layer.position = CGPoint(x:self.view.bounds.width/2,y:120);
            uuidField.tag = 0;
            uuidField.textAlignment = NSTextAlignment.Right
            uuidField.textColor = UIColor(red:0.0,green:122.0/255.0,blue:1.0,alpha:1.0)
            cell.contentView.addSubview(uuidField)

        } else if indexPath.section == 1 {
//            let majoridField: UITextField = UITextField(frame: CGRectMake(10,6,300,30))
            majoridField = UITextField(frame: CGRectMake(80,7,displayWidth - 100,30))
            let LSMajorid = LSManager.lsmanager.getLSString("majorid")
            if (LSMajorid != ""){
                majoridField.text = LSMajorid
            }else{
                majoridField.text = "00"
                LSManager.lsmanager.setLS("majorid", value: majoridField.text)
            }
            majoridField.delegate = self
            majoridField.borderStyle = UITextBorderStyle.None
//            majoridField.layer.position = CGPoint(x:self.view.bounds.width/2,y:190);
            majoridField.tag = 1;
            majoridField.textAlignment = NSTextAlignment.Right
            majoridField.textColor = UIColor(red:0.0,green:122.0/255.0,blue:1.0,alpha:1.0)
            cell.contentView.addSubview(majoridField)

        } else if indexPath.section == 2 {
//            let minoridField: UITextField = UITextField(frame: CGRectMake(10,6,300,30))
            minoridField = UITextField(frame: CGRectMake(80,7,displayWidth - 100,30))
            let LSMinorid = LSManager.lsmanager.getLSString("minorid")
            if (LSMinorid != ""){
                minoridField.text = LSMinorid
            }else{
                minoridField.text = "00"
                LSManager.lsmanager.setLS("minorid", value: minoridField.text)
            }
            minoridField.delegate = self
            minoridField.borderStyle = UITextBorderStyle.None
//            minoridField.layer.position = CGPoint(x:self.view.bounds.width/2,y:260);
            minoridField.tag = 2;
            minoridField.textAlignment = NSTextAlignment.Right
            minoridField.textColor = UIColor(red:0.0,green:122.0/255.0,blue:1.0,alpha:1.0)
            cell.contentView.addSubview(minoridField)

        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }

    /*
    UITextFieldが編集開始された直後に呼ばれる
    */
    func textFieldDidBeginEditing(textField: UITextField!){

        return;

    }

    
    /*
    UITextFieldが編集終了する直前に呼ばれる
    */
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        var setKey : String
        switch textField.tag {
            case 0:
                setKey = "uuid"
            case 1:
                setKey = "majorid"
            case 2:
                setKey = "minorid"
            default:
                return true
        }
        LSManager.lsmanager.setLS(setKey, value : textField.text)
        return true;
    }
    
    /*
    改行ボタンが押された際に呼ばれる
    */
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
}