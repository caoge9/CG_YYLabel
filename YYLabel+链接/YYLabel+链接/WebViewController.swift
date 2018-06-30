//
//  WebViewController.swift
//  YYLabel+链接
//
//  Created by 曹得地 on 2018/6/30.
//  Copyright © 2018年 caodedi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webVie: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest.init(url: url! as URL)
        webVie.load(request as URLRequest)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
