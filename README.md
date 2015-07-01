# SwiftCocoaPod
Swift中添加CocoaPod

想要在Swift中使用CocoaPods，你必须明确的写出use_frameworks! 来选择使用框架。
如果你忘了写这个，CocoaPods能检测到你使用使用Swift CocoaPods，你安装pods的时候就会报错。

你会看到"library"通常代指库或框架。很抱歉这个教程也在无意间混杂了这两个概念。
实际上，当某人提到"Swift library"，他们实际上指的是"Swift dynamic frameworks",因为swift不允许静态库。

你可能想知道，"库（library）和框架（frameworkd）和cocoaPod之间的不同之处"。
Cocoapod或者简写为"pod"是一种惯常的叫法，用来表示使用Cocoapods工具添加库或者框架到你的应用程序中。

iOS 8引入了动态框架，这就允许了代码、图片和其他的东西（assets）可以被一起打包。在iOS 8之前，CocoaPods被作为静态库来创建，就是很"臃肿的"二进制文件。
这意味着它包含了一些代码说明设置（例如i386 for the simulator, armv7 for devices等），但是它们不允许包含任何资源，例如图片或资产。
