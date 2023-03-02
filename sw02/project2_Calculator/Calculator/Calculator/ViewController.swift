//
//  ViewController.swift
//  Calculator
//
//  Created by 정구니 on 25/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num1TF: UITextField!
    @IBOutlet weak var num2TF: UITextField!
    @IBOutlet weak var opTF: UITextField!
    @IBOutlet weak var equalTF: UITextField!
    @IBOutlet weak var resultTF: UITextField!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    
    var op : String! //연산자 (+, -, *, /)중 하나를 가지는 변수
    var sw: Bool!
    var msgRes : String!//결과
    var randnum1: Int!, randnum2: Int!, opkey: Int! //random수를 저장하는 변수
    var quizop = [1:"+", 2:"-", 3:"*", 4:"/",] //op Doctionary
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기화
        op = ""
        sw = false
        msgRes = ""
        btnCheck.isEnabled = false
        // Do any additional setup after loading the view.
    }
    @IBAction func ButtonUpNum(_ sender: UIButton) {
        let keyNo = sender.currentTitle! // 누른 버튼의 title 문자
        NSLog(String(keyNo))
        if sw == false{ //첫번째 창
            num1TF.text = num1TF.text! + "\(keyNo)"
        }
        else { // sw == true -->두 번째 창
            num2TF.text = num2TF.text! + "\(keyNo)"
        }
    }
    
    @IBAction func ButtonUpClear(_ sender: UIButton) { //모든 내용 초기화한 액션 함수
        num1TF.text = ""
        num2TF.text = ""
        opTF.text = ""
        equalTF.text = ""
        resultTF.text = ""
        lbl.text = ""
        op = ""
        sw = false
        btnCheck.isEnabled = false
        lbl.text = ""
    }
    @IBAction func ButtonUpCancel(_ sender: UIButton) { //클릭하면 숫자를 뒤에서 하나씩 지운다
        
        if sw == false{ //첫번째 창
            if (num1TF.text!.count>=2){
                let upperBound1 = String.Index(encodedOffset: num1TF.text!.count-2)
                let text1 = num1TF.text![...upperBound1] //지운후 내용
                num1TF.text = String(text1) //출력
            }else{ //한자리 수 일떄
                num1TF.text = nil
            }
        }else{ //두번째 창
            if (num2TF.text!.count>=2){
                let upperBound1 = String.Index(encodedOffset: num2TF.text!.count-2)
                let text2 = num2TF.text![...upperBound1] //지운후 내용
                num2TF.text = String(text2) //출력
            }else{ //한자리 수 일떄
                num2TF.text = nil
            }
        }
    }
    func equal(){ //계산과정
        let num1 = Int(num1TF.text!)!
        let num2 = Int(num2TF.text!)!
        equalTF.text = "="
        switch op {
        case "+":
            let res = num1 + num2
            msgRes = "\(res)"
        case "-":
            let res = num1 - num2
            msgRes = "\(res)"
        case "*":
            let res = num1 * num2
            msgRes = "\(res)"
        case "/":
            let resD :Double = (Double(num1) / Double(num2))
            msgRes = "\(resD)"
        default:
            msgRes = "error"
        }
        sw = false
        btnCheck.isEnabled = false //btnCheck사용불가
        lbl.text = ""
        
    }
    @IBAction func ButtonEqual(_ sender: Any) {
        equal()
        resultTF.text = msgRes
        
    }
    @IBAction func ButtonUpOperation(_ sender: UIButton) {
        let digit = sender.currentTitle! // 누른 버튼의 title 문자
//             NSLog("op :" + op)
            op = digit
            sw = true
            opTF.text = op

    }
    @IBAction func btnQuiz(_ sender: UIButton) {
        lbl.text = "1~500까지의 정수 4칙 연산을 계산하시오."
        randnum1 = Int(arc4random_uniform(500)+1) //1~500까지의 정수
        randnum2 = Int(arc4random_uniform(500)+1)
        opkey = Int(arc4random_uniform(4)+1) //1~4까지의 정수
        op = quizop[opkey] //키에 따라 op를 random
        num1TF.text = String(randnum1)
        num2TF.text = String(randnum2)
        equalTF.text = "="
        resultTF.text = ""
        opTF.text = op
        btnCheck.isEnabled = true //btnCheck사용가능
    }
    @IBAction func btnCheck(_ sender: UIButton) {
        let result = resultTF.text
        equal()
        if result == msgRes{
            lbl.text = "축하합니다.맞았습니다"
            msgRes = ""
        }else{
            lbl.text = "죄송합니다.틀렸습니다.정답은 " + msgRes + " 입니다"
            msgRes = ""
        }
        btnCheck.isEnabled = false
    }
}
