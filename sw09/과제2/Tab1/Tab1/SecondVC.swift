//
//  SecondVC.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet var imgView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        imgView2.image = UIImage(named: "태양.png")
    }
}
