//
//  ViewController.swift
//  YYLabel+链接
//
//  Created by 曹得地 on 2018/6/13.
//  Copyright © 2018年 caodedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeReusableCell(indexPath: indexPath) as UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "yyL", for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == 1 {
            cell.textLabel?.text = "demo"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row == 0 {
            let vc = sb.instantiateViewController(withIdentifier: "YYList")
            
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = sb.instantiateViewController(withIdentifier: "dome")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
