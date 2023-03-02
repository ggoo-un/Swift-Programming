//
//  ViewController.swift
//  Navigation
//
//  Created by 정구니 on 2019/11/14.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate { // 프로토콜 EditDelegate를 상속받는다
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn1 = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 수정화면 객체 생성
        let editViewController = segue.destination as! EditViewController
        // if문과 else문을 이용해 세그웨이 별로 다른 문자열을 전송한다.
        if segue.identifier == "editButton" { // 버튼을 클릭한 경우
            editViewController.lblTextWay = "EditButton2"
        } else if segue.identifier == "editBarButton" { // 바 버튼을 클릭한 경우
            editViewController.lblTextWay = "EditBarButton1"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn2 = isOn1
        editViewController.delegate = self // 위임자를 설정
    }
    
    // protocol을 이용하여 데이터를 송신측에서 수신측으로 전달하기 위해
    // 메인 프로그램(수신측)의 함수를 구현한다
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            isOn1 = true
        } else {
            imgView.image = imgOff
            isOn1 = false
        }
    }
    
    
}










