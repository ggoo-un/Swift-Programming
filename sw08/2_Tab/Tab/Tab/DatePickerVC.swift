//
//  ViewController.swift
//  DatePicker
//
//  Created by 정구니 on 17/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    @IBOutlet var btnAlarmStop: UIButton! //알람중지버튼 아웃렛 변수 추가
    @IBOutlet var datePicker: UIDatePicker! //Picker 아웃렛 변수 추가
    
    let timeSelector: Selector = #selector(DatePickerVC.updateTime) //selector타입의 변수 --> updateTime함수 호출
    let interval = 1.0 //동작 간격 변수 1초로 지정
    var count = 0 //1분을 count한 변수
    var isRed : Bool! //빨간색 화면 여부 --> 알람상태
    
    //각 라벨의 기능을 사용하기 위한 아울렛 변수
    @IBOutlet var lblCurrentTime: UILabel! //현재사간
    @IBOutlet var lblPickerTime: UILabel! //선택사간
    
    var alarm : String!
    //프로그램 실행되면 자동적으로 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        //1초마다 Timer 객체를 생성하여 selector된 ViewController.updateTime 함수 호출
        //timeInterval: 동작 간격 지정(초 단위 기준); target: 타이머를 동작 시킬 대상; selector: 지정된 시간이 지날 경우 호출되는 함수 지정; userInfo: 타이머 동작시 전달할 객체 지정; repeats: 타이머 반복 여부
        Timer.scheduledTimer( timeInterval: interval, target: self,
                              selector: timeSelector, userInfo: nil, repeats: true)
        
        isRed = false
        btnAlarmStop.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //DatePicker의 액션함수
    @IBAction func changeDataPicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()//날짜 포맷터
        /*yyyy : 네자리로 연도를 표시 MM : 두 자리로 월을 표시
         dd : 01 ~ 31까지 일을 표시 HH : 01~24까지 24시간 시각을 표시
         mm : 00~59까지 분을 표시 ss : 00~59까지 초를 표시
         EEE : Sun ~ Sat까지 3글자 요일 표시
         */
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" //date 형식 지정
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date) //Picker date를 가져와서 화면에 출력
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarm = formatter.string(from: datePickerView.date) //선택된 시간을 분까지 알람 시간으로 지정
    }
    
    //@objc가 들어간 이유는 Selector을 사용하기 위한 함수는 Object-C타입의 함수여야 하기 때문에 다음과 같은 함수로 선언한다
    @objc func updateTime(){//1초씩 동작
        //lblCurrentTime.text = String(count)
        //count = count + 1
        let date = NSDate() //현재시간 가져오기
        
        let formatter = DateFormatter() //날짜 포맷터
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" //date 형식 지정
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) //현재시간을 Date형식으로 변환해서 출력
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        if( (formatter.string(from: date as Date) == alarm) && isRed == false)//현재시간과 알람시간 분까지 같고 알람상태가 아니면
        {
            view.backgroundColor = UIColor.red //화면 빨간색으로 전환
            isRed = true

            btnAlarmStop.isEnabled = true //알람중지버튼 사용가능
            datePicker.isEnabled = false //피커 사용불가
            NSLog("Same Date : "+formatter.string(from: date as Date) + " / " + alarm) //현재시간과 알람시간을 콘솔에 출력
            
        }
        if(isRed == true && count < 60) //알람 상태고 알람상태가 1분이내면
        {
            NSLog(String(count)) //알람 상태 시간을 콘솔에 출력
            count = count + 1
            if(count == 60) //1분이 됐으면 AlarmStopfunc() 실행
            {
                AlarmStopfunc()
            }
        }
        
    }
    @IBAction func AlarmStop(_ sender: UIButton) {
        if(isRed == true) //화면이 빨간 상태면 AlarmStopfunc() 실행
        {
            AlarmStopfunc()
        }
    }
    func AlarmStopfunc()
    {
        isRed = false //알람상태를 false로 변경
        count = 0 //초기화
        view.backgroundColor = UIColor.white //화면을 하얀색으로 변경
        btnAlarmStop.isEnabled = false //알람중지버튼 사용불가
        datePicker.isEnabled = true //피커 사용가능
        
        alarm = nil //초기화
    }
    
}

