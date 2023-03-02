//
//  AddVC.swift
//  Table
//
//  Created by 정구니 on 2019/11/27.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class AddVC: UIViewController ,UIPickerViewDelegate, UIPickerViewDataSource{
    // 초기화
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COMUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.png", "2.png", "3.png" ]
    var fileName = ""
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var mobileTF: UITextField!
    @IBOutlet var DateTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 이미지 배열
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image!)
        }
        imageView.image = imageArray[0]
        fileName = imageFileName[0]
        
        // 현재 시간 --> 년 월 일
        let d = NSDate()
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyy-MM-dd"
        DateTF.text = dateForm.string(from: d as Date)
    }
    
    @IBAction func btnAddItem(_ sender: Any) {
        // 배열에 추가
        name.append(nameTF.text!)
        mobile.append(mobileTF.text!)
        date.append(DateTF.text!)
        itemsImageFile.append(fileName)
        // 클릭하고 변수 초기화
        nameTF.text=""
        mobileTF.text=""
        DateTF.text=""
        _ = navigationController?.popViewController(animated: true)
    }
    // 컨포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COMUMN
    }
    // 컴포넌트 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    // 열의 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    // 이미지 뷰의 프레임 크기 변경 --> 컴토넌트의 각 열에 이미지 뷰를 리턴
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return imageView
    }
    // 피커 뷰가 선택 될때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        fileName = imageFileName[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
