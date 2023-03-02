//
//  ViewController.swift
//  Age
//
//  Created by 정구니 on 25/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var dayTF: UITextField!
    var end = 0 //매달 마지막 날짜
    var yeartotal = 0, montotal = 0, daytotal = 0 //나이 년, 월, 일 변수
    var yearCurrent = 0, monthCurrent = 0, dayCurrent = 0 //현재 시간 변수
    var yearbool = true, monthbool = true, daybool = true
    
    @IBAction func btn(_ sender: UIButton) {
        let date = NSDate()
//        년
        let yearForm = DateFormatter()
        yearForm.dateFormat = "yyyy"
        let year = yearForm.string(from: date as Date)
        yearCurrent = Int(year)!
        let yearYour = Int(yearTF.text!)!
//        월
        let monthForm = DateFormatter()
        monthForm.dateFormat = "MM"
        let month = monthForm.string(from: date as Date)
        monthCurrent = Int(month)!
        let monthYour = Int(monthTF.text!)!
//        일
        let dayForm = DateFormatter()
        dayForm.dateFormat = "dd"
        let day = dayForm.string(from: date as Date)
        dayCurrent = Int(day)!
        let dayYour = Int(dayTF.text!)!
        
        //오늘의 날짜 출력
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        lbldate.text = ""
        lbldate.text = lbldate.text! + "오늘의 날짜는 " + formatter.string(from: date as Date)
        
        daybool = dayYour >= 1 && dayYour <= 31 // 일의 범위 지정
        monthbool = monthYour >= 1 && monthYour <= 12 //월의 범위 지정
        yearbool = yearYour >= 0 //0년부터 계산가능하도록 설정
        if (daybool && monthbool && daybool) == false{ //범위를 벗어나면
            NSLog("날짜범위 벗어남")
            lbl.text = "정확한 날짜를 입력하세요.오류1"
        }
        
        //        매달의 마지막 날짜 정하기
        switch monthCurrent-1 { //한 달의 일수를 빌려온 후의 달
            case 0, 1, 3, 5, 7, 8, 10:
                end = 31
            case 4, 6, 9, 11:
                end = 30
            case 2:
                if (yearCurrent%4==0 && yearCurrent != 100 || yearCurrent%400==0){ //윤년
                    end = 29
                }
                else{ //평년
                    end = 28
                }
            default:
                end = 0
        }
        
        //계산 --> 일부터 계산
        if (dayCurrent >= dayYour){
            daytotal = dayCurrent - dayYour
        }
        else{
            monthCurrent = monthCurrent-1 //한 달의 일수를 빌려와서 계산한다. 따라서 -1
            daytotal = end + dayCurrent - dayYour
        }
        // --> 개월수 계산
        if (monthCurrent >= monthYour){
            montotal = monthCurrent - monthYour
        }
        else{
            yearCurrent = yearCurrent - 1 //한 해의 달수를 빌려와서 계산한다. 따라서 -1
            montotal = 12 + monthCurrent - monthYour
        }
        // --> 년도수 계산
        if (yearCurrent >= yearYour){
            yeartotal = yearCurrent - yearYour
        }
        else { //현재시간 이후의 시간을 입력한 상황
            NSLog("미래시간 입력"+String(yearCurrent)+"..."+String(yearYour))
            lbl.text = "정확한 날짜를 입력하세요.오류2"
        }
        NSLog(String(yeartotal)+"=="+String(montotal)+"=="+String(daytotal))
        
        yearbool = yearCurrent >= yearYour && yearYour >= 0 //년도수는 0년부터 계산가능 하고
        if (yearbool && monthbool && daybool){
            lbl.text =  "\n\n당신의 정확한 나이는 \n\(yeartotal)년 \(montotal)개월 \(daytotal)일입니다."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


