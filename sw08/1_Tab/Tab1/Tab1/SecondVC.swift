//
//  SecondVC.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet var lbl2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        lbl2.text = "화면 2: 첫번째화면입니다." 
    }
}
