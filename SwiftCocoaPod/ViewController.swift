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
        var view: UIView?
        view = UIView(frame: CGRectMake(0, 0, 100, 100))
        view!.backgroundColor = UIColor.redColor();
        var view2 : UIView?
        view2 = view
        self.view.addSubview(view!)
        view2 = nil
        view = nil
        
        

        
        var bird = FlappyBird()
        println( "   fly = \(bird.name) ")
        
        
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
            
            //类型属性的获取 和 赋值
           let string = SomeStructure.storedTypeProperty
           SomeStructure.storedTypeProperty = "Anther Type"
           var someValue = SomeClass.computedTypeProperty
            
            println("  classProperty:  \(SomeStructure.storedTypeProperty) ")
            
            // swift 中闭包写法
            var block = {(string: String) -> String in
                return string + "ASD"
            }
            let value = block("SSSS")
            println(" block : \(value)")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //关键字 static 定义值类型的类型属性 （静态变量）
    // 跟实例的属性一样，类型属性的访问也是通过点运算符来进行，但是，类型属性是通过类型本身来获取和设置，而不是通过实例
    struct SomeStructure {
         static var storedTypeProperty = "Some Value"
         static var computedTypeProperty: Int {
           return 10
        }
    }
    
    struct SomeStructure2 {
        var storedType = "Some Value2"
        var computedType: Int {
            return 12
        }
    }
    class myClass: NSObject {
        var storedType: SomeStructure!
    }
    
    class SomeClass {
        class var computedTypeProperty: Int {
            return 100
        }
    }
    
    struct Point {
        var x = 0.0
        var y = 0.0
    }
    
    struct Size {
        var width = 0.0
        var height = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + size.width/2
                let centerY = origin.y + size.height/2
                return Point(x: centerX, y: centerY)
            }
            set(newCenter){
                origin.x = newCenter.x - size.width/2
                origin.y = newCenter.y - size.height/2
            }
        }
    }
    
    
}

