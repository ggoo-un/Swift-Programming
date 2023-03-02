//
//  ThirdVC.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    @IBOutlet var imgView3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        imgView3.image = UIImage(named: "달.png")
    }
}
