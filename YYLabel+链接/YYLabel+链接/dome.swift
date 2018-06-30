//
//  dome.swift
//  YYLabel+链接
//
//  Created by 曹得地 on 2018/6/13.
//  Copyright © 2018年 caodedi. All rights reserved.
//使用代码方式设置YYLabel

import UIKit


class dome: UIViewController {

    var myyL = YYLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
         setL()
    }
    

    internal func setL() {
        myyL.frame = CGRect(x: 20, y: 100, width: 300, height: 300)
        myyL.numberOfLines = 0
        view.addSubview(myyL)
        //正则匹配[title]（url）
        let MATCHER = "\\[([\\w \\(\\)\\t#&%$@\\u4e00-\\u9fa5]*)\\]\\(((https?://)?[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|])\\)";
        //正则匹配（url）这里你都可以根据自己公司的需求写正则
        let http = "\\(((https?://)?[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|])\\)"
        
        //我们公司定的规则是[title],（url）
        let str = "热爱中国共产党[这个可以有](https://www.xxx.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开"
        //copy是不影响原来的str比如你要复制粘贴之类的
        var labelText = NSString(string: str).copy() as! NSString
        //regexKitlite中的方法生成一个数组，数组中的内容就是你最想得到的，快试试打印一下吧
        let array_http: [[String]] = str.arrayOfCaptureComponentsMatched(byRegex: MATCHER) as! [[String]]
        //字符串替换，不懂的可以搜一下
        if array_http.count > 0 {
            labelText = labelText.replacingOccurrences(of: http, with: "", options: NSString.CompareOptions.regularExpression, range: NSMakeRange(0, labelText.length)) as NSString
            
        }
        let attri = NSMutableAttributedString.init(string: labelText as String)
        //字号大小设置是这样的，我对比了一下uilabel系统的16号，这个要比系统的小一号，比如uilabel的font =17，这儿可能就设置为16
        attri.font = UIFont.systemFont(ofSize: 16)
        //设置替换为高亮也就是不同的颜色显示title，arr[1]就是title当然了不是固定的，根据你的数组内容定。arr[2]是链接
        for arr in array_http {
            let range = labelText.range(of: arr[1])
            //这个闭包中是每一个高亮文字的点击事件
            attri.setTextHighlight(range, color: .blue, backgroundColor: nil) { (view, art, range, rect) in
                print(arr) //你想要的都在这里，快来取吧
            }
        }
        //最后重要的一句，搞定收工！
        myyL.attributedText = attri;
    }

   
}
