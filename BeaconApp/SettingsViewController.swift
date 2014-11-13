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

    @IBAction func goBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // Tableで使用する配列を定義する.
//    let myiPhoneItems: NSArray = ["iOS8"]
//    let myAndroidItems: NSArray = ["5.x"]
//    let myAndroidItems2: NSArray = ["1.x"]
    
    // Sectionで使用する配列を定義する.
    let mySections: NSArray = ["UUID", "MajorID", "MinorID"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        // Delegateを設定する.
        myTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(myTableView)

//        let myTextField: UITextField = UITextField(frame: CGRectMake(0,0,200,30))
//        // 表示する文字を代入する.
//        myTextField.text = "Hello Swift!!"
//        // Delegateを設定する.
//        myTextField.delegate = self
//        // 枠を表示する.
//        myTextField.borderStyle = UITextBorderStyle.RoundedRect
//        // UITextFieldの表示する位置を設定する.
//        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
//        // Viewに追加する.
//        self.view.addSubview(myTextField)
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
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
//            println("Value: \(myiPhoneItems[indexPath.row])")
        } else if indexPath.section == 1 {
//            println("Value: \(myAndroidItems[indexPath.row])")
        } else if indexPath.section == 2 {
//            println("Value: \(myAndroidItems2[indexPath.row])")
        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
//            return myiPhoneItems.count
        } else if section == 1 {
//            return myAndroidItems.count
        } else if section == 2 {
//            return myAndroidItems2.count
        }
        
        return 1
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {

            let uuidField: UITextField = UITextField(frame: CGRectMake(0,0,300,30))
            uuidField.text = "CB86BC31-05BD-40CC-903D-1C9BD13D966A"
            uuidField.delegate = self
            uuidField.borderStyle = UITextBorderStyle.None
            uuidField.layer.position = CGPoint(x:self.view.bounds.width/2,y:120);
            self.view.addSubview(uuidField)
//            cell.textLabel.text = "\(myiPhoneItems[indexPath.row])"

        } else if indexPath.section == 1 {
            let majoridField: UITextField = UITextField(frame: CGRectMake(0,0,300,30))
            majoridField.text = "FF"
            majoridField.delegate = self
            majoridField.borderStyle = UITextBorderStyle.None
            majoridField.layer.position = CGPoint(x:self.view.bounds.width/2,y:190);
            self.view.addSubview(majoridField)
//            cell.textLabel.text = "\(myAndroidItems[indexPath.row])"

        } else if indexPath.section == 2 {
            let minoridField: UITextField = UITextField(frame: CGRectMake(0,0,300,30))
            minoridField.text = "FF"
            minoridField.delegate = self
            minoridField.borderStyle = UITextBorderStyle.None
            minoridField.layer.position = CGPoint(x:self.view.bounds.width/2,y:260);
            self.view.addSubview(minoridField)
//            cell.textLabel.text = "\(myAndroidItems2[indexPath.row])"

        }
        return cell
    }
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
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