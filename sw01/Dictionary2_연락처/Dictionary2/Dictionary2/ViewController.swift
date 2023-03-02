//
//  ViewController.swift
//  Dictionary2
//
//  Created by 정구니 on 19/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField! //이름 텍스트 필드 아웃렛 변수 추가
    @IBOutlet weak var numberTF: UITextField! //번호 텍스트 필드 아웃렛 변수 추가
    @IBOutlet weak var addressTF: UITextField! //주소 텍스트 필드 아웃렛 변수 추가
    @IBOutlet weak var txtView: UITextView! //택스트 뷰 아웃렛 변수 추가
    //    numDict --> [이름:번호]
    var numDict = ["서준":"010-2374-4829", "도윤":"010-2374-4291", "하은":"010-3119-2842", "시우":"010-0193-4728", "지우":"010-2374-4293",
                    "서윤":"010-2384-4829", "민준":"010-2374-4929", "예준":"010-1122-4232", "소울":"010-1726-9791", "지아":"010-4927-2823",
                    "유주":"010-2635-2536", "준우":"010-4466-9977", "지혜":"010-2817-9937", "채림":"010-2884-1093", "승우":"010-2274-4211",
                    "지호":"010-1049-9958", "나은":"010-4827-8857", "예나":"010-5588-1983", "유나":"010-9998-6574", "민서":"010-3944-6857" ]
    //    addDict --> [이름:주소]
    var addDict = ["서준":"한림대학교 학생생활관 2관 101", "도윤":"한림대학교 학생생활관 1관 102", "하은":"한림대학교 학생생활관 3관 103", "시우":"한림대학교 학생생활관 6관 104",
                   "지우":"한림대학교 학생생활관 8관 105", "서윤":"한림대학교 학생생활관 7관 106", "민준":"한림대학교 학생생활관 6관 107", "예준":"한림대학교 학생생활관 1관 108",
                   "소울":"한림대학교 학생생활관 4관 201", "지아":"한림대학교 학생생활관 5관 202", "유주":"한림대학교 학생생활관 6관 203", "준우":"한림대학교 학생생활관 8관 204",
                   "지혜":"한림대학교 학생생활관 3관 205", "채림":"한림대학교 학생생활관 4관 206", "승우":"한림대학교 학생생활관 1관 207", "지호":"한림대학교 학생생활관 2관 208",
                   "나은":"한림대학교 학생생활관 7관 301", "예나":"한림대학교 학생생활관 8관 302", "유나":"한림대학교 학생생활관 3관 303", "민서":"한림대학교 학생생활관 6관 304" ]
    var name: String = ""
    var num: String = ""
    var address: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func listFunc(){ //딕셔너리에 있는 내용을 텍스트 뷰에 모두 출력한다
        txtView.text = ""
        var i: Int = 1

        for (name, num) in numDict { //이름과 번호를 가져온다
            address = addDict[name]! //name을 addDict의 키값으로 입력하여 주소를 찾아 address에 저장
            txtView.text = txtView.text! + "\(i). 이름: \(name) \n전화번호: \(num) \n주소: \(address) \n\n"
            i = i+1
        }
    }
    
    @IBAction func btnList(_ sender: Any) { //딕셔너리에 있는 내용을 텍스트 뷰에 모두 출력한다
        listFunc()
    }
    
    @IBAction func btnSearch(_ sender: Any) { //이름을 키로 입력하여 전화번호와 주소를 찾아서 아래형식으로 출력한다
        name = nameTF.text! //nameTF에 입력한 내용을 변수 name에 저장
        num = numDict[name]! //name을 numDict의 키값으로 입력하여 번호를 찾아 num에 저장
        address = addDict[name]! //name을 addDict의 키값으로 입력하여 주소를 찾아 address에 저장
        txtView.text = ""
        txtView.text = "이름: \(name) \n전화번호: \(num) \n주소: \(address)"
    }
    
    @IBAction func btnUpdate(_ sender: Any) { //이름, 번호, 주소를 입력하여 데이터를 업데이트
        name = nameTF.text!
        num = numberTF.text! //numTF에 입력한 내용을 변수 num에 저장
        address = addressTF.text! //addressTF에 입력한 내용을 변수 address에 저장
        numDict.updateValue(num, forKey: name) //num을 키값 name으로 업데이트
        addDict.updateValue(address, forKey: name) //address을 키값 name으로 업데이트
        listFunc()
    }
    
    @IBAction func btnInsert(_ sender: Any) { //이름, 번호, 주소를 입력하여 데이터를 추가
        name = nameTF.text!
        num = numberTF.text!
        address = addressTF.text!
        numDict[name] = num
        addDict[name] = address
        listFunc()
    }
    
    @IBAction func btnRemove(_ sender: Any) { //값을 딕셔너리에서 지운다
        name = nameTF.text!
        numDict[name] = nil
        listFunc()
    }
    
}


