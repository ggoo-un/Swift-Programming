//
//  ViewController.swift
//  Graphics
//
//  Created by 정구니 on 2019/10/25.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var Red: UISlider! // red slider 아웃렛
    @IBOutlet var Green: UISlider! // green slider 아웃렛
    @IBOutlet var Blue: UISlider! // blue slider 아웃렛
    var btnString: String! // 버튼 제목 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기화
        Red.minimumValue = 0.0
        Red.maximumValue = 1.0
        Red.value = 0.0
        Green.minimumValue = 0.0
        Green.maximumValue = 1.0
        Green.value = 0.0
        Blue.minimumValue = 0.0
        Blue.maximumValue = 1.0
        Blue.value = 0.0
    }
    
    func Line(){ // 선 그리기 함수
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트 생성
        let context = UIGraphicsGetCurrentContext()! // 콘텍스트 정보 획득
        context.setLineWidth(2.0) // 선의 굵기 설정
        // 선의 컬러 설정
        // alpha:0-->투명 1-->부투명
        context.setStrokeColor(red: CGFloat(Red!.value), green: CGFloat(Green!.value), blue: CGFloat(Blue!.value), alpha: 1)
        context.move(to: CGPoint(x: 100, y: 100)) // 시작 점
        context.addLine(to: CGPoint(x: 250, y: 250)) // 끝 점까지 연결
        context.strokePath() // 추가한 선을 콘텍스트에 그리기
        // 현재 콘텍스트에 그려진 이미지를 이미지 뷰에 보여줌.
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func Rect(){ // 사각형 그리기 함수
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        // 사각형 그리기
        context.setLineWidth(2.0)
        context.setStrokeColor(red: CGFloat(Red!.value), green: CGFloat(Green!.value), blue: CGFloat(Blue!.value), alpha: 1)
        // (50, 100)위치에서 가로 200, 세로 200 크기의 사각형 추가
        context.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func Circle(){ // 원 그리기 함수
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        // 원 그리기
        context.setLineWidth(2.0)
        context.setStrokeColor(red: CGFloat(Red!.value), green: CGFloat(Green!.value), blue: CGFloat(Blue!.value), alpha: 1)
        // (50, 100)위치에서 가로 200, 세로 200 크기의 원 추가
        context.addEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200))
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func Fill(){ // 색채운 원 그리기 함수
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        // 색채운 원 그리기
        context.setLineWidth(2.0)
        // 채운 컬러 성정
        context.setFillColor(red: CGFloat(Red!.value), green: CGFloat(Green!.value), blue: CGFloat(Blue!.value), alpha: 1)
        context.fillEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200)) // 원 채우기
        context.setStrokeColor(UIColor.yellow.cgColor)
        context.addEllipse(in: CGRect(x: 50, y: 100, width: 200, height: 200)) // 원 그리기
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    func Draw(){ // 버튼 타이틀을 받아온 btnString 변수를 이용해 도형을 그린 함수
        if btnString == "직선"{
            Line()
        }
        else if btnString == "사각형"{
            Rect()
        }
        else if btnString == "원"{
            Circle()
        }
        else if btnString == "색채운 원"{
            Fill()
        }
    }
    
    @IBAction func btnDraw(_ sender: UIButton) {
        btnString = sender.currentTitle! // 버튼 타이틀을 받아와서 btnString 변수에 지정
        Draw()
    }
    
    @IBAction func slRed(_ sender: UISlider) { // red slider
        Draw()
    }
    @IBAction func slGreen(_ sender: UISlider) { // green slider
        Draw()
    }
    @IBAction func slBlue(_ sender: UISlider) { // blue slider
        Draw()
    }
    
    
}
