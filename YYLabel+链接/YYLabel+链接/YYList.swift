//
//  YYList.swift
//  YYLabel+链接
//
//  Created by 曹得地 on 2018/6/13.
//  Copyright © 2018年 caodedi. All rights reserved.
//

import UIKit

class YYList: UITableViewController {

    var dataArr = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
        //为了更直接看清楚，这里我就不做model了，随便搞一个数组
        dataArr = ["热爱中国共产党[这个可以有](https://www.xxx.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开",
                   
            "不可思议的一幕，爆料来袭，京东惊爆价[我是链接](https://www.ceshi.com/223?232323&2323)我做什么也不会做电影，星期天电影院一个人也没有摘自周星驰[功夫]",
            
        "没有什么事是一顿撸串不能搞定的，如果有那两顿[这个可以有](https://www.baidu.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.goole.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开",
        
        "热爱中国共产党[这个可以有](https://www.show.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊[我是链接](https://www.xxx.com/223?232323&2323)但是加夫里什了佛教历史的方式打开肌肤来说的方式",
        
        "热爱中国共产党[这个可以有](https://www.xxx.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开",
        
        "热爱中国共产党[这个可以有](https://www.xxx.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开",
        
        "热爱中国共产党[这个可以有](https://www.xxx.com/223?232323&2399)来吧来吧相约酒吧 [我是链接](https://www.xxx.com/223?232323&2323) 接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,⌚️😊😊,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开心喽同志们,小妞接开"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yylist", for: indexPath) as! YYTableViewCell
        cell.delegate = self
        if dataArr.count > 0 {
            cell.textModel = dataArr[indexPath.row]
        }
        return cell
    }
}
// MARK: - YYTableViewCellDelegate
extension YYList: YYTableViewCellDelegate {
    // 这里是你的点击处理，做点什么吧！
    func clickInLabel(label: YYLabel, range: NSRange) {
        //获取到高亮部分
        let highlight: YYTextHighlight = label.textLayout?.text.attribute(YYTextHighlightAttributeName, at: UInt(range.location)) as! YYTextHighlight
        //你存的数据（我存的是个字典key是url，value就是我要的链接）如果你有特殊处理可以加判断随你便啦！
        let info = highlight.userInfo;
        print(info?["url"] ?? "展开")
        if info!["url"] as? String == "特殊处理" {
            //点击了展开
            performSegue(withIdentifier: "web", sender: nil)
        }
    }
}
