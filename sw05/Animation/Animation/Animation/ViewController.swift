//
//  ViewController.swift
//  Animation
//
//  Created by 정구니 on 2019/10/23.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    // 아웃렛변수
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    // UIImage 타입 배열
    var imgArray1 = [UIImage?]()
    var imgArray2 = [UIImage?]()
    // 초기화
    var imgFileName1 = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg"]
    var imgFileName2 = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg", "09.jpg", "010.jpg", "011.jpg", "012.jpg", "013.jpg", "014.jpg", "015.jpg", "016.jpg", "017.jpg", "018.jpg", "019.jpg", "020.jpg"]
    var cnt = 0
    var k = 0
    // 일정한 시간 간격으로 호출하는 함수 aniImage를 설정한다
    let timeSelector: Selector = #selector(ViewController.aniImage)
    // 함수를 호출하는 시간 간격(0.1초)을 설정한다
    let interval = 0.1
    // override func viewDidLoad()함수 속에 타이머 스케줄 함수 Timer.scheduledTimer()를 설정한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        // 두개 이미지 배열 초기화
        for k in 0 ... 19 {
            let image1 = UIImage(named: imgFileName1[k])
            imgArray1.append(image1)
        }
        for k in 0 ... 19 {
            let image2 = UIImage(named: imgFileName2[k])
            imgArray2.append(image2)
        }
        Timer.scheduledTimer(timeInterval: interval, target: self, selector:
        timeSelector, userInfo: nil, repeats: true)
    }
    // 호출하는 함수를 @objc로 작성한다
    @objc func aniImage() {
        // 이미지 뷰에 출력
        imgView1.image = imgArray1[cnt]
        imgView2.image = imgArray2[cnt]
        cnt = cnt + 1
        // 20장 출력후 반복하게 한다
        if cnt == 20 {
            cnt = 0
        }
    }
}

