//
//  ViewController.swift
//  Calculator
//
//  Created by 정구니 on 25/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtCalcul: UITextField! //계산과정 창
    @IBOutlet weak var txtVar: UITextField! //입력 창
    var result : Int! // 결과값을 저장하는 변수
    //2자리 수의 연산을 위해 num1, num2 변수를 선언한다.
    var num1 : Int!
    var num2 : Int!
    var op : String! //연산자 (+, -, *, /)중 하나를 가지는 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기화
        num1 = 0
        num2 = 0
        op = ""
        result = 0
        // Do any additional setup after loading the view.
    }
    @IBAction func ButtonUpNum(_ sender: UIButton) { //숫자 버튼이 클릭되었을 때 작동하는 액션 함수
        let digit = sender.currentTitle! // 누른 버튼의 title 문자
        NSLog("result : " + String(result) + ", num1 : " + String(num1) + ", num2 :" + String(num2) + ", op : " + op)
        
        if(op == "" && result != 0) //이미 계산했던 상황에 첫번째 수를 입력한 상황
        {
            txtVar.text = txtVar.text! + digit //입력한 숫자를 전에 계산한 결과 값뒤에 연결해서 첫번째 숫자로 결정, 입력 창에 출력
            txtCalcul.text = txtVar.text! //계산과정 창은 입력창과 같다
            
        }
        else //기타 상황(1.결과값 없고 첫번쨰수 입력 2.결과값 없고 두번째수 입력 3.결과값 있고 두번째수 입력)
        {
            txtVar.text = txtVar.text! + digit
            txtCalcul.text = txtCalcul.text! + digit
        }
        
    }
    @IBAction func ButtonUpOperation(_ sender: UIButton) { //연산자 버튼이 클릭되었을 때 작동하는 액션 함수
        let digit = sender.currentTitle! //누른 연산자 버튼의 title 문자
        NSLog("op :" + op)
        NSLog("num1 :"+String(num1))
        NSLog("num2 :"+String(num2))
        if digit != "="{ //[+, -, *, /] 버튼 누를때
            if(op == ""){ //연산자가 없을때 누르면
                op = digit
                num1 = Int(txtVar.text!)
                txtVar.text = "" //연산자를 누르면 입력창은 ""로 초기화
                txtCalcul.text = String(num1) + op //계산과정 창은 연산자를 추가해서 출력
            }
            else{ //연산자가 입력 되어있었는데 다시 연산자를 누른다면 연산자 수정
                op = digit
                let txtNum = txtCalcul.text!
                let startIndex = txtNum.startIndex //문자열txtNum 제일 처음을 가리키는 인덱스를 starIndex에 저장
                
                let endIndex = txtNum.index(before:txtNum.endIndex) //문자열txtNum 제일 마지막을 가리키는 인덱스를 endIndex에 저장
//              endIndex = txtNum.endIndex 이렇게 쓰면 마지막 인덱스 뒤에 있는 끝부분을 가리킵니다.
                let range = startIndex..<endIndex //반 닫힌 번위, 문자열 처음부터 마지막 문자열 인덱스 미만까지 (starIndex ~ endIndex-1)
                //range를 사용하는 이유는 txtCalcul 문자열의 범위를 사용하여 연산자 이전의 문자열만 사용하기 위함이다.
                num1 = Int(txtNum[range]) //연산자 전의 숫자 값을 num1에게 준다
                txtVar.text = nil
                txtCalcul.text = String(num1) + op //새로 입력한 연산자로 업데이트
            }
        }
        else { //"=" 버튼 누를 떄

            NSLog("txtVar.text = " + txtVar.text!)
            if(txtVar.text! == ""){ //두번째 수를 입력하지 않고 "="버튼 누를 때 num1를 바로 출력한다
                num2 = 0
                result = num1
                txtVar.text = String(result)
                txtCalcul.text = ""
            }
            else{
                num2 = Int(txtVar.text!) //두번째 입력한 수를 num2에 저장
                //계산과정 --> 계산하고 txtVar의 text로 출력, txtCalcul.text는 초기화
                if(op=="+"){
                    result = num1 + num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="-"){
                    result = num1 - num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="*"){
                    result = num1 * num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
                else if(op=="/"){
                    result = num1 / num2
                    txtVar.text = String(result)
                    txtCalcul.text = ""
                }
            }
            //계산 끝난후 num1, num2, op를 초기화 한다.
            op = ""
            num1 = 0
            num2 = 0
        }

    }
    @IBAction func ButtonUpClear(_ sender: UIButton) { //C버튼이 클릭되었을 때 작동하는 액션 함수, 모든 값들을 초기화 해준다.
        txtVar.text = ""
        txtCalcul.text = ""
        num1 = 0
        num2 = 0
        op = ""
        result = 0
    }
    @IBAction func ButtonUpCancel(_ sender: UIButton) { //<-버튼이 클릭되었을 때 작동하는 액션 함수이다.
        
        if txtVar.text != "" //지울 수 있는 내용이 없는 경우에는 예외처리를 한다
        {
            if(txtVar.text!.count>=2){ //한자리 수는 아래 txtVar.text!.count-2를 사용할 수 없기에 나눠야 함
                let upperBound1 = String.Index(encodedOffset: txtVar.text!.count-2) //한자리 지웠기에 뒤로 2번째의 Index를 저장
                let text1 = txtVar.text![...upperBound1] //한자리 지운후의 문자열
                NSLog(String(text1))
                txtVar.text = String(text1) //출력
            }
            else{ //한자리 수와 아무수 없을 떄
                txtVar.text = nil
            }
            if(txtCalcul.text!.count >= 2 )
            {
                let upperBound2 = String.Index(encodedOffset: txtCalcul.text!.count-2) //한자리 지웠기에 뒤로 2번째의 Index를 저장
                let text2 = txtCalcul.text![...upperBound2] //한자리 지운후의 문자열
                txtCalcul.text = String(text2) //출력
            }
            else{ //한자리 수와 아무수 없을 떄
                txtCalcul.text = nil
            }
            
        }
        
    }

}


