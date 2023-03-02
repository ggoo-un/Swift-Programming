//
//  ViewController.swift
//  Tab
//
//  Created by 정구니 on 2019/11/13.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // 버튼을 이용한 뷰 전환
    @IBAction func btnMoveImageView(_ sender: UIButton) { // 두번째 뷰 --> 이미지뷰로 이동
        tabBarController?.selectedIndex = 1
    }
    @IBAction func brnMoveDatePickerView(_ sender: UIButton) { // 세번째 뷰 --> 데이트 피커뷰로 이동
        tabBarController?.selectedIndex = 2
    }
}

