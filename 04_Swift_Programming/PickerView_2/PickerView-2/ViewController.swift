//
//  ViewController.swift
//  PickerView-2
//
//  Created by 정구니 on 18/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
//UIPickerViewDelegate, UIPickerViewDataSource 프로토콜 채택
class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{
    //변수 및 상수 추가
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    //이미지 이름 배열 선언
    var backgroundImageFileName = ["01.png","02.png","03.png","04.png","05.png",
                                   "06.png","07.png","08.png","09.png","10.png"]
    var animalImageFileName = ["a01.png","a02.png","a03.png","a04.png","a05.png",
                               "a06.png","a07.png","a08.png","a09.png","a10.png"]
    var imageArray = [UIImage?]()
    
    @IBOutlet var pickerImage: UIPickerView! //피커 뷰 아웃렛 변수 추가
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    var whatImage = false //false-->배경 true-->동물
    var currentCheck1 = 0
    var currentCheck2 = 0
    //선택한 이미지를 이미지 뷰에 출력하기
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageArray.removeAll() //함수 호출 할떄 데이터 삭제 --> 버튼 누를 때 새로운 배열 필요하기 때문
        NSLog("CurrentRow1:----"+String(currentCheck1))
        NSLog("CurrentRow2:----"+String(currentCheck2))
        if whatImage == false 
        {
            for i in 0..<MAX_ARRAY_NUM{ //이미지 배열 만들기
                let image = UIImage(named: backgroundImageFileName[i]) //imageFileName배열에서 이미지 이름을 하나씩 갖고와 UIImage타입의 이미지 생성해서 image변수에 할당
                imageArray.append(image) // 방금 만든 image를 추가
            }
            //배경 초기값
            lblImageFileName.text = backgroundImageFileName[currentCheck1]
            imageView.image = imageArray[currentCheck1]
        }
        else
        {
            for i in 0..<MAX_ARRAY_NUM{
                let image = UIImage(named: animalImageFileName[i])
                imageArray.append(image)
                
            }
            //동물 초기값
            lblImageFileName.text = animalImageFileName[currentCheck2]
            imageView.image = imageArray[currentCheck2]
        }
        //프로토콜을 준수하면서 대신 일을 수행할 대리자를 정한다.
        pickerImage.delegate = self
        pickerImage.dataSource = self
        
    }
    
    // 생성할 컴포넌트(피커 뷰애 표시되는 열의 개수)의 개수 정의
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        NSLog("333")
        return PICKER_VIEW_COLUMN
    }
    // 컴포넌트가 가질 목록의 길이
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        NSLog("222")
        //배열의 개수를 .count를 사용하여 넘겨줍니다.
        if whatImage == false{
            return backgroundImageFileName.count
        }
        else{
            return animalImageFileName.count
        }
    }
    /*
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String?{ // 드래그를 하고 있을 경우 (선택 이전에 마우스 클릭하여 유지하고 있을 경우
     NSLog("111")
     return backgroundImageFileName[row]
     }
     */
    // 룰렛의 높이 변경하기
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int)-> CGFloat{
        return PICKER_VIEW_HEIGHT
    }
    // 피커 뷰 룰렛에 이미지 출력하기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing View:UIView?)-> UIView{ //피커 뷰에게 컴포넌트의 각 열의 뷰를 UIView타입의 값으로 넘겨준다
        if(whatImage == false)
        {
            NSLog(String(whatImage)+"row:"+String(row))
            NSLog("CurrentRow1:"+String(currentCheck1))
            NSLog("CurrentRow2:"+String(currentCheck2))
            currentCheck1 = row //현재row확인
            let imageView2 = UIImageView(image:imageArray[currentCheck1]) //선택된 row에 해당하는 이미지를 imageArray에서 가져온다
            imageView2.frame = CGRect(x:0, y: 0, width: 100, height: 80) //이미지 뷰의 프레임 크기를 설정
            return imageView2
        }
        else{
            NSLog(String(whatImage)+"row:"+String(row))
            currentCheck2 = row
            let imageView1 = UIImageView(image:imageArray[currentCheck2])
            imageView1.frame = CGRect(x:0, y: 0, width: 100, height: 80)
            return imageView1
        }
    }
    
    // 컴포넌트의 행을 선택했을 때 실행할 함수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        NSLog("component : "+String(component))
        if whatImage == false
        {
            NSLog("row:"+String(row)+"backgroundImage:"+backgroundImageFileName[row])
            lblImageFileName.text = backgroundImageFileName[row] //선택한 row값에 해당하는 배경이름을 출력
            imageView.image = imageArray[row] //선택한 row값에 해당하는 배경이미지를 출력
        }
        else
        {
            NSLog("row:"+String(row)+"animalImageFileName:"+animalImageFileName[row])
            lblImageFileName.text = animalImageFileName[row] //선택한 row값에 해당하는 동물이름을 출력
            imageView.image = imageArray[row] //선택한 row값에 해당하는 동물이미지를 출력
        }
    }
    @IBAction func BtnChange(_ sender: UIButton) {
        let imageNow = sender.currentTitle
        if(imageNow == "배경") //배경
        {
            whatImage = false
        }
        else //동물
        {
            whatImage = true
        }
        viewDidLoad()
    }
    
}
