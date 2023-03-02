//
//  ViewController.swift
//  SketchNavigation
//
//  Created by 정구니 on 2019/11/13.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var txtMain: UITextField!
    @IBOutlet var imgView: UIImageView!
    var lastPoint: CGPoint!
    var firstPoint: CGPoint!
    var clearPoint: CGPoint!
    var currentPoint: CGPoint!
    var lineSize:CGFloat = 2.0
    var sliderRed1: CGFloat = 0.0
    var sliderGreen1: CGFloat = 0.0
    var sliderBlue1: CGFloat = 0.0
    var lineColor = UIColor.red.cgColor
    var clearColor = UIColor.white.cgColor
    var fillColor = UIColor.blue.cgColor
    var sketchType: Int = 1
    var fillType: Bool = false // 채우기 여부 true -> 채우기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColor = UIColor(displayP3Red:
            CGFloat(sliderRed1), green: CGFloat(sliderGreen1), blue: CGFloat(sliderBlue1), alpha: 1.0)
        lineColor = myColor.cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let str = txtMain.text!
        // 수정화면 객체 생성
        let editViewController = segue.destination as! EditVC
        // if문과 else문을 이용해 세그웨이 별로 다른 문자열을 전송한다.
        if segue.identifier == "editButton" { // 버튼을 클릭한 경우
            editViewController.bufferEdit = "EditButton 2: " + str
        }else if segue.identifier == "editBarButton"{ // 바 버튼을 클릭한 경우
            editViewController.bufferEdit = "EditBarButton 1: " + str
        }
        // 메인화면 -> 수정화면
        editViewController.Red2 = sliderRed1
        editViewController.Green2 = sliderGreen1
        editViewController.Blue2 = sliderBlue1
        editViewController.Width2 = lineSize
        editViewController.sketchType2 = sketchType
        editViewController.fillType2 = fillType
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        imgView.image = nil
        sketchType = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치가 시작될 때 호출
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imgView)
        firstPoint = lastPoint
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치 손가락이 움직였을 때 호출
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(lineColor)
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(lineSize)
        //        if sketchType != 1 {
        //            print("last:\(lastPoint) clear:\(clearPoint)")
        //            print("ok!")
        //            context.setStrokeColor(clearColor)
        //            context.move(to: CGPoint(x: clearPoint.x, y: clearPoint.y))
        //            context.addLine(to: CGPoint(x: clearPoint.x, y: clearPoint.y))
        //        }
        let touch = touches.first! as UITouch
        currentPoint = touch.location(in: imgView)
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        if sketchType == 1{
            context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            context.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        }
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        clearPoint = currentPoint
        lastPoint = currentPoint
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { // 화면에서 손가락을 떼었을 때 호출
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(lineColor)
        context.setLineCap(CGLineCap.round)
        context.setLineWidth(lineSize)
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        if sketchType == 1 {
            context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            context.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            
        }else if sketchType == 2 { // 직선
            context.move(to: CGPoint(x: firstPoint.x, y: firstPoint.y))
            context.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            
        }else if sketchType == 3 { // 사각형
            if fillType == true { // 채우기 여부 확인
                context.setFillColor(fillColor)
                let ractangle = CGRect(x: firstPoint.x, y: firstPoint.y, width: (lastPoint.x-firstPoint.x), height: (lastPoint.y-firstPoint.y))
                context.addRect(ractangle)
                context.fill(ractangle) }
            context.addRect(CGRect(x: firstPoint.x, y: firstPoint.y, width: (lastPoint.x-firstPoint.x), height: (lastPoint.y-firstPoint.y)))
            
        } else if sketchType == 4 { // 원
            if fillType == true { // 채우기 여부 확인
                context.setFillColor(fillColor)
                let cicle = CGRect(x: firstPoint.x, y: firstPoint.y, width: (lastPoint.x-firstPoint.x), height: (lastPoint.y-firstPoint.y))
                context.addEllipse(in: cicle)
                context.fillEllipse(in: cicle) }
            context.addEllipse(in: CGRect(x: firstPoint.x, y: firstPoint.y, width: (lastPoint.x-firstPoint.x), height: (lastPoint.y-firstPoint.y)))
            
        }
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
}







