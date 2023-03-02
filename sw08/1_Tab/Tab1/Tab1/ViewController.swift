//
//  ViewController.swift
//  Tab1
//
//  Created by 정구니 on 2019/11/12.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lbl1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        lbl1.text = "화면 1: 첫번째화면입니다."
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

