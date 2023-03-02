//
//  EditVC.swift
//  SketchNavigation
//
//  Created by 정구니 on 2019/11/13.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func fooSetLineColor(_ red2: CGFloat, green2: CGFloat, blue2: CGFloat)
    func fooSetLineWidth(_ width2: CGFloat)
    func fooSet(_ sketchType2: Int, fillType2: Bool)
}

class EditVC: UIViewController {
    var bufferEdit: String = ""
    @IBOutlet var lblEdit: UILabel!
    @IBOutlet var sliderWidth: UISlider!
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    var Red2: CGFloat = 0.0
    var Green2: CGFloat = 0.0
    var Blue2: CGFloat = 0.0
    var Width2: CGFloat = 0.0
    var delegate: EditDelegate? // delegate 변수를 생성한다
    var sketchType2: Int = 1
    var fillType2: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderWidth.maximumValue = 10.0
        sliderWidth.minimumValue = 0.0
        sliderWidth.value = Float(Width2)
        sliderRed.maximumValue = 1.0
        sliderRed.minimumValue = 0.0
        sliderRed.value = Float(Red2)
        sliderGreen.maximumValue = 1.0
        sliderGreen.minimumValue = 0.0
        sliderGreen.value = Float(Green2)
        sliderBlue.maximumValue = 1.0
        sliderBlue.minimumValue = 0.0
        sliderBlue.value = Float(Blue2)
        lblEdit.text = bufferEdit
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 메인화면 객체 생성
        let viewController = segue.destination as! ViewController
        // 메인화면 버튼을 누르면 데이터 전송 수정화면 -> 메인화면
        if segue.identifier == "mainButton" {
            viewController.sliderRed1 = CGFloat(sliderRed.value)
            viewController.sliderGreen1 = CGFloat(sliderGreen.value)
            viewController.sliderBlue1 = CGFloat(sliderBlue.value)
            viewController.lineSize = CGFloat(sliderWidth.value)
            viewController.sketchType = sketchType2
            viewController.fillType = fillType2
        }
    }
    
    @IBAction func btn(_ sender: UIButton) {
        sketchType2 = 1
    }
    @IBAction func btnLine(_ sender: UIButton) {
        sketchType2 = 2
    }
    @IBAction func btnRect(_ sender: UIButton) {
        sketchType2 = 3
    }
    @IBAction func btnCircle(_ sender: UIButton) {
        sketchType2 = 4
    }
    @IBAction func btnFillColor(_ sender: UIButton) {
        fillType2 = !fillType2
    }
    @IBAction func btnRed(_ sender: UIButton) {
        sliderRed.value = 1.0
        sliderGreen.value = 0.0
        sliderBlue.value = 0.0
    }
    @IBAction func btnGreen(_ sender: UIButton) {
        sliderRed.value = 0.0
        sliderGreen.value = 1.0
        sliderBlue.value = 0.0
    }
    @IBAction func btnBlue(_ sender: UIButton) {
        sliderRed.value = 0.0
        sliderGreen.value = 0.0
        sliderBlue.value = 1.0
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        Red2 = CGFloat(sliderRed.value)
        Green2 = CGFloat(sliderGreen.value)
        Blue2 = CGFloat(sliderBlue.value)
        Width2 = CGFloat(sliderWidth.value)
        // 함수 호츨
        if delegate != nil{
            delegate?.fooSetLineColor(Red2, green2: Green2, blue2: Blue2)
            delegate?.fooSetLineWidth(Width2)
            delegate?.fooSet(sketchType2, fillType2: fillType2)
        }
        // 세그웨이를 사용하지 않고 메인화면으로 되돌아가는 방법
        _ = navigationController?.popViewController(animated: true)
    }
}
