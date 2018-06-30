//
//  YYTableViewCell.swift
//  YYLabel+链接
//
//  Created by 曹得地 on 2018/6/14.
//  Copyright © 2018年 caodedi. All rights reserved.
//处理cell显示(注意： 由于我想快速搞一搞，这里写的地方还是有不严谨的地方的，主要还是赋值和取之的时候，小伙伴们不要盲目粘贴确保有值，我这里没问题是因为我给的都是固定的值是肯定存在的，项目里的model是网络获取生成那是不可控因素。)

import UIKit

protocol YYTableViewCellDelegate {
    func clickInLabel(label: YYLabel, range: NSRange)
}
class YYTableViewCell: UITableViewCell {
    @IBOutlet weak var desL: UILabel!
    @IBOutlet weak var yyL: YYLabel!
    var delegate: YYTableViewCellDelegate?
    //正则匹配[title]（url）
    let MATCHER = "\\[([\\w \\(\\)\\t#&%$@\\u4e00-\\u9fa5]*)\\]\\(((https?://)?[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|])\\)";
    //正则匹配（url）这里你都可以根据自己公司的需求写正则
    let http = "\\(((https?://)?[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|])\\)"
    
    var textModel: String? {
        didSet {
            desL.text = textModel
            //copy是不影响原来的str比如你要复制粘贴之类的
            var labelText = NSString(string: desL.text!).copy() as! NSString
            //regexKitlite中的方法生成一个数组，数组中的内容就是你最想得到的，快试试打印一下吧
            let array_http: [[String]] = desL.text!.arrayOfCaptureComponentsMatched(byRegex: MATCHER) as! [[String]]
            //字符串替换，不懂的可以搜一下
            if array_http.count > 0 {
                labelText = labelText.replacingOccurrences(of: http, with: "", options: NSString.CompareOptions.regularExpression, range: NSMakeRange(0, labelText.length)) as NSString
                
            }
            if labelText.length > 100 {
                let str = labelText.substring(to: 100)
                labelText = NSString(format: "%@......展开", str)
            }
            desL.text = labelText as String //重新赋值
            let attri = NSMutableAttributedString.init(string: labelText as String)
            //字号大小设置是这样的，我对比了一下uilabel系统的16号，这个要比系统的小一号，比如uilabel的font =17，这儿可能就设置为16
            attri.font = UIFont.systemFont(ofSize: 16)
            //设置替换为高亮部分和存储想要的字段
            let range = labelText.range(of: "展开")
            attri.setTextHighlight(range, color: UIColor.blue, backgroundColor: nil, userInfo: ["url":"特殊处理"])
            for arr in array_http {
                let range = labelText.range(of: arr[1])
                attri.setTextHighlight(range, color: UIColor.blue, backgroundColor: nil, userInfo: ["url":arr[2]])
            }
            //这儿的点击我使用的方法和demo中的有所区别
            yyL.highlightTapAction = { (containerView: UIView, text: NSAttributedString, range: NSRange, rect: CGRect) in
                self.delegate?.clickInLabel(label: containerView as! YYLabel, range: range)
            }
            //最后重要的一句，搞定收工！
            yyL.attributedText = attri;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    

}
