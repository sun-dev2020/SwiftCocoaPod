//
//  protocolSwift.swift
//  SwiftCocoaPod
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 treebear. All rights reserved.
//

import Foundation

protocol Bird {
    var name: String {
        get
    }
    var canFly: Bool {
        get
    }
}

protocol Flyable {
    var airspeedVelocity: Double {
        get
    }
}

struct FlappyBird: Bird , Flyable {
    let name: String = "bird"
    let flappyAmlitude: Double = 1.0
    let flappyfrequency: Double = 1.0 
    let canFly = true
    
    var airspeedVelocity :Double {
        return 3 * flappyfrequency * flappyAmlitude
    }
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
}
// 结构体和枚举  属于值类型  赋值相当于拷贝  两份是单独的
// 类属于引用类型  赋值相当月不同的引用  指向同一内存地址
func testForStructAndClass() {
    let hd = Resolution(width: 1920, height: 1080)
    var cinema = hd
    
    cinema.width = 2048
    
    println("cinema is now \(cinema.width)")
    println("hd is still \(hd.width) ")
    
    let teneighty = VideoMode()
    teneighty.resolution = hd
    teneighty.interlaced = true
    teneighty.name = "1080i"
    teneighty.frameRate = 25.0
    
    let alsoTeneight = teneighty
    alsoTeneight.frameRate = 30.0
    
    println(" the frameRate property of teneight is now \(teneighty.frameRate)")    // is 30.0
    
    // === 是指两个类类型的常量或者变量引用同一个类实例
    if teneighty === alsoTeneight {
        println( " teneight and alsoTeneight refer to the same Resolution instance " )
    }
}



