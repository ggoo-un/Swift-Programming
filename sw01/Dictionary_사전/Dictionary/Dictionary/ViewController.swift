//
//  ViewController.swift
//  Dictionary
//
//  Created by 정구니 on 19/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var korTF: UITextField! //korTF 텍스트 필드 아웃렛 변수 추가
    @IBOutlet weak var engTF: UITextField! //engTF 텍스트 필드 아웃렛 변수 추가
    @IBOutlet weak var txtView: UITextView! //택스트 뷰 아웃렛 변수 추가
    //    dict --> [kor:eng]
    var dict = ["감도":"sensitivity", "직선성":"linearity", "기억효과":"memory effect", "선택도":"selectivity", "안정성":"stability",
                "응답속도":"response time", "취미":"pastime", "기한":"deadline", "기체":"gas", "노력":"endeavor",
                "추상적인":"abstract", "변형시키다":"transform", "생산하다":"produce", "정밀도":"resolution", "정확도":"accuracy",
                "부분":"portion", "구조":"constitution", "성향":"tendency", "지속":"duration", "장애물":"obstacle" ]
    var kor: String = ""
    var eng: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func listFunc(){ //딕셔너리에 있는 내용을 텍스트 뷰에 모두 출력한다
        txtView.text = ""
        for (kor, eng) in dict { //kor과 eng를 가져온다
            txtView.text = txtView.text! + "\(kor) : \(eng) \n"
        }
    }
    
    @IBAction func btnList(_ sender: Any) { //딕셔너리에 있는 내용을 텍스트 뷰에 모두 출력한다
        listFunc()
        
    }
    
    @IBAction func btnSearch(_ sender: Any) { //입력된 한국어를 key값으로 영어인 value값을 찾아서 kor:eng의 형태로 텍스트 뷰에 출력
        kor = korTF.text! //korTF에 입력한 내용을 변수 kor에 저장
        eng = dict[kor]! //kor을 dict의 키값으로 입력하여 영어를 찾아 eng에 저장
        txtView.text = ""
        txtView.text = "\(kor) : \(eng)"
    }
    
    @IBAction func btnUpdate(_ sender: Any) { //텍스트 필드에 있는 kor와 eng으로 업데이트
        kor = korTF.text!
        eng = engTF.text! //engTF에 입력한 내용을 변수 eng에 저장
        dict.updateValue(eng, forKey: kor) //eng를 키값 kor으로 업데이트
        listFunc()
    }
    
    @IBAction func btnInsert(_ sender: Any) { //텍스트 필드에 있는 kor와 eng를 읽은 후, kor기준으로 딕셔너리에 추가
        kor = korTF.text!
        eng = engTF.text!
        dict[kor] = eng //추가
        listFunc()
        
    }
    
    @IBAction func btnRemove(_ sender: Any) { //값을 딕셔너리에서 지운다
        kor = korTF.text!
        eng = engTF.text!
        dict[kor] = nil
        listFunc()
    }
    
}

