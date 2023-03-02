//
//  ViewController.swift
//  Graphics1
//
//  Created by 정구니 on 2019/10/31.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sgChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // 선 그리기
            UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트 생성
            let context = UIGraphicsGetCurrentContext()! // 콘텍스트 정보 획득
            context.setLineWidth(2.0) // 선의 굵기 설정
            context.setStrokeColor(UIColor.red.cgColor) // 선의 컬러 설정
            context.move(to: CGPoint(x: 100, y: 100)) // 시작 점
            context.addLine(to: CGPoint(x: 250, y: 250)) // 끝 점까지 연결
            context.strokePath() // 추가한 선을 콘텍스트에 그리기
            // 현재 콘텍스트에 그려진 이미지를 이미지 뷰에 보여줌.
            imgView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext() // 그림 그리는 작업 끝내기
        }
        else if sender.selectedSegmentIndex == 1 { // 사각형 그리기
            UIGraphicsBeginImageContext(imgView.frame.size)
            let context = UIGraphicsGetCurrentContext()!
            // 사각형 그리기
            context.setLineWidth(2.0)
            context.setStrokeColor(UIColor.green.cgColor)
            // (50, 100)위치에서 가로 200, 세로 200 크기의 사각형 추가
            context.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
            context.strokePath()
            imgView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        else if sender.selectedSegmentIndex == 2 { // 원 그리기
            UIGraphicsBeginImageContext(imgView.frame.size)
            let context = UIGraphicsGetCurrentContext()!
            // 원 그리기
            context.setLineWidth(2.0)
            context.setStrokeColor(UIColor.blue.cgColor)
            // (50, 100)위치에서 가로 200, 세로 200 크기의 원 추가
            context.addEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200))
            context.strokePath()
            imgView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        else if sender.selectedSegmentIndex == 3 { // 색채운 원 그리기
            UIGraphicsBeginImageContext(imgView.frame.size)
            let context = UIGraphicsGetCurrentContext()!
            // 색채운 원 그리기
            context.setLineWidth(2.0)
            context.setFillColor(UIColor.orange.cgColor) // 채운 컬러 성정
            context.fillEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200)) // 원 채우기
            context.setStrokeColor(UIColor.blue.cgColor)
            context.addEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200)) // 원 그리기
            context.strokePath()
            imgView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
    }
    
}

