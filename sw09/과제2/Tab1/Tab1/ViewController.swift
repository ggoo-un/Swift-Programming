//
//  ViewController.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        imgView1.image = UIImage(named: "지구.png")
    }
    
    // 세그먼트를 이용한 뷰 전환
    @IBAction func sgChenge(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // 첫번째 세그먼트
            tabBarController?.selectedIndex = 1 // 두번째 페이지
        }else if sender.selectedSegmentIndex == 1 { // 두번째 세그먼트
            tabBarController?.selectedIndex = 2 // 세번째 페이지
        }
    }

}

