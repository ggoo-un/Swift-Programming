//
//  EditVC.swift
//  PageControl
//
//  Created by 정구니 on 2019/11/20.
//  Copyright © 2019 Ho-Jeong Song. All rights reserved.
//

import UIKit

// 수정화면(송신측) 프로토콜은 메인 화면의 함수를 구현하지 않고 선언만 한다.
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditVC, message: String)
    func fooSet( name2: String, whatImage2: Bool, currentPage: Int)
}

class EditVC: UIViewController {
    var bgDic = ["카트만두":"1", "코펜하겐":"2", "멕시코시티":"3", "메크네스":"4", "마이애미":"5", "시애틀":"6", "다카르":"7", "노비사드":"8", "선전":"9", "자다르":"10"] //여행지
    var aniDic = ["강아지":"1a","고양이":"2a","다람쥐":"3a","토끼":"4a","펭귄":"5a","마못":"6a","수달":"7a","카피바라":"8a","쿼카":"9a","하프물범":"10a"] //동물
    var lblTextWay: String = ""
    var textMessage: String = ""
    var currentPage: Int = 0
    var name2: String = ""
    var img: String = ""
    var whatImage2 = true //true --> 배경 false --> 동물
    var delegate : EditDelegate? // delegate 변수를 생성한다
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var txtView: UITextView!
    @IBOutlet var imgView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기화
        // 메인화면에서 받은 값을 출력한다
        txMessage.text = textMessage
        imgView.image = UIImage(named: img)
        for (key, value) in bgDic {
            txtView.text = txtView.text! + key + "\n"
        }
    }
    @IBAction func sgContol(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            whatImage2 = true
            txtView.text = ""
            for (key, value) in bgDic {
                txtView.text = txtView.text! + key + "\n"
            }
        }
        else if sender.selectedSegmentIndex == 1 {
            whatImage2 = false
            txtView.text = ""
            for (key, value) in aniDic {
                txtView.text = txtView.text! + key + "\n"
            }
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        let txt = txMessage.text!
        if  whatImage2 == true {
            name2 = bgDic[txt]!
            currentPage = Int(name2)!
        }else {
            name2 = aniDic[txt]!
            let startIndex = name2.startIndex //문자열txtNum 제일 처음을 가리키는 인덱스를 starIndex에 저장
            let endIndex = name2.index(before:name2.endIndex) //문자열txtNum 제일 마지막을 가리키는 인덱스를 endIndex에 저장
            let range = startIndex..<endIndex
            print(range)
            currentPage = Int(name2[range])! - 1
        }
        if delegate != nil {
            // 함수 호츨
            delegate?.didMessageEditDone(self, message: txt)
            delegate?.fooSet(name2: name2, whatImage2: whatImage2, currentPage:currentPage)
        }
        // 세그웨이를 사용하지 않고 메인화면으로 되돌아가는 방법
        _ = navigationController?.popViewController(animated: true)
    }

}
