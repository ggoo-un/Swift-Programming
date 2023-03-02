//
//  ViewController.swift
//  PickerView
//
//  Created by 정구니 on 18/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

//UIPickerViewDelegate, UIPickerViewDataSource 프로토콜 채택
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    //변수 및 상수 추가
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]()
    //이미지 이름 배열 선언
    var imageFileName = [ "01.png", "02.png", "03.png","04.png", "05.png",
                          "06.png", "07.png", "08.png", "09.png", "10.png", ]
    
    @IBOutlet weak var pickerImage: UIPickerView! //피커 뷰 아웃렛 변수 추가
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    //선택한 이미지를 이미지 뷰에 출력하기
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM{ //이미지 배열 만들기
            let image = UIImage(named: imageFileName[i]) //imageFileName배열에서 이미지 이름을 하나씩 갖고와 UIImage타입의 이미지 생성해서 image변수에 할당
            imageArray.append(image) // 방금 만든 image를 추가
        }
        //초기값
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        //프로토콜을 준수하면서 대신 일을 수행할 대리자를 정한다.
        pickerImage.delegate = self
        pickerImage.dataSource = self
    }
    // 생성할 컴포넌트(피커 뷰애 표시되는 열의 개수)의 개수 정의
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        NSLog("333")
        return PICKER_VIEW_COLUMN
    }
    // 룰렛의 높이 변경하기
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    // 컴포넌트가 가질 목록의 길이
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count //배열 imageFileName의 개수 값인 10을 imageFileName.count를 사용하여 넘겨줍니다.
    }
    // 피커 뷰 룰렛에 이미지 출력하기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {//피커 뷰에게 컴포넌트의 각 열의 뷰를 UIView타입의 값으로 넘겨준다
        let imageView = UIImageView(image: imageArray[row]) //선택된 row에 해당하는 이미지를 imageArray에서 가져온다
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 80) //이미지 뷰의 프레임 크기를 설정
        return imageView
        }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { //피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넙겨줍니다.
//        return imageFileName[row] //imageFileName에 저장되어 있는 파일명을 넘겨줍니다.
//    }
    
    // 컴포넌트의 행을 선택했을 때 실행할 합수
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row] //선택한 row값에 해당하는 이미지 이름을 표시
        imageView.image = imageArray[row] //선택한 row값에 해당하는 이미지 표시
    }


}

