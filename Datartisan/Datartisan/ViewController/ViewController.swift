//
//  ViewController.swift
//  Datartisan
//
//  Created by closure on 8/17/15.
//  Copyright © 2015 datartisan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.blueColor()
        self.title = "文章列表";
        
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "设置", style: .Plain, target: self, action: "showSetting")
    }
    
    func showSetting(sender:UIBarButtonItem) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

