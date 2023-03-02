//
//  ViewController.swift
//  Sketch
//
//  Created by 정구니 on 2019/11/07.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var sliderW: UISlider!
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    var lastPoint: CGPoint!
    var firstPoint: CGPoint!
    var clearPoint: CGPoint!
    var currentPoint: CGPoint!
    var lineSize:CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    var clearColor = UIColor.white.cgColor
    var fillColor = UIColor.blue.cgColor
    var sketchType: Int = 1
    var fillType: Bool = false // 채우기 여부 true -> 채우기
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
        sliderW.maximumValue = 10.0
        sliderW.minimumValue = 0.0
        sliderW.value = 2.0
        sliderRed.maximumValue = 1.0
        sliderRed.minimumValue = 0.0
        sliderRed.value = 0.0
        sliderGreen.maximumValue = 1.0
        sliderGreen.minimumValue = 0.0
        sliderGreen.value = 0.0
        sliderBlue.maximumValue = 1.0
        sliderBlue.minimumValue = 0.0
        sliderBlue.value = 1.0
        let myColor = UIColor(displayP3Red:
        CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
        lineColor = myColor.cgColor
        
    }
    @IBAction func btnClear(_ sender: UIButton) {
        imgView.image = nil
        sketchType = 1
    }
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
        sliderRed.value = 1.0
        sliderGreen.value = 0.0
        sliderBlue.value = 0.0
    }
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
        sliderRed.value = 0.0
        sliderGreen.value = 1.0
        sliderBlue.value = 0.0
    }
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
        sliderRed.value = 0.0
        sliderGreen.value = 0.0
        sliderBlue.value = 1.0
    }
    @IBAction func btnLine(_ sender: UIButton) {
        sketchType = 2
    }
    @IBAction func btnRect(_ sender: UIButton) {
        sketchType = 3
    }
    @IBAction func btnCicle(_ sender: UIButton) {
        sketchType = 4
    }
    @IBAction func btnFillColor(_ sender: UIButton) {
        fillColor = UIColor.green.cgColor
        fillType = !fillType
    }
    @IBAction func slWchanged(_ sender: UISlider) {
        lineSize = CGFloat(sliderW.value)
    }
    @IBAction func slRedChanged(_ sender: UISlider) {
        let myColor = UIColor(displayP3Red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
        lineColor = myColor.cgColor
    }
    @IBAction func slGreenChanged(_ sender: UISlider) {
        let myColor = UIColor(displayP3Red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
        lineColor = myColor.cgColor
    }
    @IBAction func slBlueChanged(_ sender: UISlider) {
        let myColor = UIColor(displayP3Red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
        lineColor = myColor.cgColor
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치가 시작될 때 호출
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imgView)
        firstPoint = lastPoint
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { // 터치 손가락이 움직였을 때 호출
        print(sketchType)
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
        print(sketchType)
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
  

