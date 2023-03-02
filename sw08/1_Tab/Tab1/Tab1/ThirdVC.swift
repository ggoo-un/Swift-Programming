//
//  ThirdVC.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    @IBOutlet var lbl3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        lbl3.text = "화면 3: 첫번째화면입니다." 
    }
}
