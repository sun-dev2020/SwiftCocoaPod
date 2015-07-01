//
//  ViewController.swift
//  SwiftCocoaPod
//
//  Created by mac on 15/7/1.
//  Copyright (c) 2015年 treebear. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadFlavors()
    }
    private func showLoadingHUD(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "Loading..."
    }
    private func hideLoadingHUD(){
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
    }
    
    private func loadFlavors(){
        let urlString = "http://www.raywenderlich.com/downloads/Flavors.plist"
        showLoadingHUD()
        Alamofire.request(.GET, urlString,  encoding: .PropertyList(.XMLFormat_v1_0, 0))
        .responsePropertyList{ (request, response, array, error) -> Void in
            if let error = error {
                println(" Error: \(error)")
            }else if let array = array as? [[String: String]] {
                if array.isEmpty {
                    println(" No flavors were found")
                }else {
                    println("Array : \(array)")
                }
            }
            self.hideLoadingHUD()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

