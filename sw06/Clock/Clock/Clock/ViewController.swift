//
//  ViewController.swift
//  Clock
//
//  Created by 정구니 on 2019/10/31.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.currentTime) // 호출 할 함수 currentTime로 설정
    let interval = 1.0 // 함수를 호출하는 시간 간격(1초)을 설정
    @IBOutlet var lbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    // 현재 초, 분, 시 설정
    var dSecond = 0
    var dMinute = 0
    var dHour = 0
    // 초침, 분침, 시침 그리기 위해 바꾸는 시작 점 좌표 설정 (imageView 의 중심 좌표)
    var centerX: CGFloat = 0.0
    var centerY: CGFloat = 0.0
    // 초침, 분침, 시침 그리기 위해 바꾸는 끝점 좌표 설정
    var newX: CGFloat = 0.0
    var newY: CGFloat = 0.0
    // 초침, 분침, 시침의 길이 설정
    var lenSecond: CGFloat = 145.0
    var lenMinute: CGFloat = 130.0
    var lenHour: CGFloat = 110.0
    // 초침, 분침, 시침의 굵기 설정
    var widthSecond: CGFloat = 2.0
    var widthMinute: CGFloat = 5.0
    var widthHour: CGFloat = 7.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // 타이머 그케줄 함수 설정
        centerX = imgView.frame.width/2
        centerY = imgView.frame.height/2
    }
    
    // 현재 초, 분, 시를 받아서 그려진 이미지를 이미지 뷰에 보여주는 함수
    func drawTime(_ dSecond: Int, _ dMinute: Int, _ dHour: Int) {
    // 현재 초, 분, 시를 타입변경
        let aSecond = CGFloat(dSecond)
        let aMinute = CGFloat(dMinute)
        let aHour = CGFloat(dHour)
        UIGraphicsBeginImageContext(imgView.frame.size) // 콘텍스트 생성
        let context = UIGraphicsGetCurrentContext()! // 콘텍스트 정보 획득
    // 시계 모양 그리기
        context.setLineWidth(7) // 테두리의 굵기 설정
        context.setStrokeColor(UIColor.gray.cgColor) // 선의 컬러 설정
        context.setFillColor(UIColor.white.cgColor) // 채운 컬러 성정
        let circle = CGRect(x: 0.0, y: 0.0, width: centerX*2, height: centerY*2)
        let border = CGRect(x: 3.5, y: 3.5, width: centerX*2-7, height: centerY*2-7)
        context.fillEllipse(in: circle) // 원 채우기
        // 시계 중간 접점 그리기
        context.setFillColor(UIColor.black.cgColor)
        context.fillEllipse(in: CGRect(x: centerX-6, y: centerY-6, width: 12.0, height:12.0))
        context.addEllipse(in: border) // 원 (테두리) 그리기
        context.strokePath() // 추가한 원을 콘텍스트에 그리기
    // 시침 그리기
        // 매분마다 시침 위치 바꾸게끔 설정
        newX = sin((aHour*30 + aMinute*0.5) * 3.14/180) * lenHour + centerX
        newY = centerY - (cos((aHour*30 + aMinute*0.5) * 3.14/180) * lenHour)
        context.setLineWidth(widthHour) // 선의 굵기 설정
        context.setStrokeColor(UIColor.black.cgColor) // 선의 컬러 설정
        context.move(to: CGPoint(x: centerX, y: centerY)) // 시작 점
        context.addLine(to: CGPoint(x: newX, y: newY)) // 끝 점까지 연결
        context.strokePath() // 추가한 선을 콘텍스트에 그리기
    // 분침 그리기
        // 분침 매분 마다 위치 바꿈
        newX = sin(aMinute * 6 * 3.14 / 180) * lenMinute + centerX
        newY = centerY - (cos(aMinute * 6 * 3.14 / 180) * lenMinute)
        context.setLineWidth(widthMinute)
        context.setStrokeColor(UIColor.black.cgColor)
        context.move(to: CGPoint(x: centerX, y: centerY))
        context.addLine(to: CGPoint(x: newX, y: newY))
        context.strokePath()
    // 초침 그리기
        // 초침 매초마다 위치 바꿈
        newX = sin(aSecond * 6 * 3.14 / 180) * lenSecond + centerX
        newY = centerY - (cos(aSecond * 6 * 3.14 / 180) * lenSecond)
        context.setLineWidth(widthSecond)
        context.setStrokeColor(UIColor.red.cgColor)
        context.move(to: CGPoint(x: centerX, y: centerY))
        context.addLine(to: CGPoint(x: newX, y: newY))
        context.strokePath()
    // mark 그리기
        for i in 1...12 { // 1시 ~ 12시
            let h = CGFloat(i)
            // mark를 그리기 위해 시작 점 좌표 설정
            let hourX = sin(h * 30 * 3.14 / 180) * centerY + centerX
            let hourY = centerY - (cos(h * 30 * 3.14 / 180) * centerY)
            // mark를 그리기 위애 끝 점 좌표 설정
            let newhourX = sin(h * 30 * 3.14 / 180) * (centerY-15) + centerX
            let newhourY = centerY - (cos(h * 30 * 3.14 / 180) * (centerY-15))
            context.setLineWidth(4)
            context.setStrokeColor(UIColor.black.cgColor)
            context.move(to: CGPoint(x: hourX, y: hourY))
            context.addLine(to: CGPoint(x: newhourX, y: newhourY))
            context.strokePath()
        }
        // 현재 콘텍스트에 그려진 이미지를 이미지 뷰에 보여줌.
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() // 그림 그리는 작업 끝내기
        
    }
    
    @objc func currentTime() { // 1초마다 함수 호출
        let date = NSDate() // 현재 시간 가져오기
        let formatter = DateFormatter() // 형식을 정하기 위해 formatter변수 만들기
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss: EEE" // dormatter의 dateFormat속성을 설정
        lbl.text = "현재 시간: " + formatter.string(from: date as Date) // 현재시간
        formatter.dateFormat = "ss"
        dSecond = Int(formatter.string(from: date as Date))! // 현재 초
        formatter.dateFormat = "mm"
        dMinute = Int(formatter.string(from: date as Date))! // 현재 분
        formatter.dateFormat = "HH"
        dHour = Int(formatter.string(from: date as Date))! // 현재 시
        drawTime(dSecond, dMinute, dHour) //1초마다 함수 호출해서 그리기
    } }
