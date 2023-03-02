//
//  EditViewController.swift
//  Navigation
//
//  Created by bglee on 2018. 10.
//  Copyright © 2018년 bglee. All rights reserved.
//

import UIKit

// 수정화면(송신측) 프로토콜은 메인 화면의 함수를 구현하지 않고 선언만 한다.
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {

    var lblTextWay: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate? // delegate 변수를 생성한다
    var isOn2 = false
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swIsOn: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기화
        // 메인화면에서 받은 값을 출력한다
        lblWay.text = lblTextWay
        txMessage.text = textMessage
        swIsOn.isOn = isOn2
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            // 함수 호츨
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn2)
        }
        // 세그웨이를 사용하지 않고 메인화면으로 되돌아가는 방법
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn2 = true
        } else {
            isOn2 = false
        }
    }

}








