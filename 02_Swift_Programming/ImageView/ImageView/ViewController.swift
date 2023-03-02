//
//  ViewController.swift
//  ImageView
//
//  Created by 정구니 on 09/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var canUse: Bool?
    //var isZoom = false
    var imgOn: UIImage?  //켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage?  //꺼진 전구 이미지가 있는 UIImage 타입의 변수
    var imgRemove: UIImage? //remove 이미지가 있는 UIImage 타입의 변수
    @IBOutlet weak var imgView: UIImageView! //이미지 뷰 아웃렛 변수 추가
    @IBOutlet weak var btnResize: UIButton! //버튼 아웃렛 변수 추가
    @IBOutlet weak var btnUse: UIButton! //버튼 아웃렛 변수 추가
    @IBOutlet weak var switcher: UISwitch! //스위치 아웃렛 변수 추가
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        canUse = true
        imgOn = UIImage(named: "lamp-on.png")
        imgOff = UIImage(named: "lamp-off.png")
        imgRemove = UIImage(named: "lamp-remove.png")
        imgView.image = imgOn
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let digit = sender.currentTitle!  //현재 Resize버튼의 타이틀을 digit에 저장
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (digit == "확대"  && canUse == true){ //확대button누르고 사용가능한 상태면 실행, digit == "확대" => isZoom == flase
            newWidth = imgView.frame.width*scale //넓이를 2배로 확대
            newHeight = imgView.frame.height*scale //높이를 2배로 확대
            imgView.frame.size = CGSize(width: newWidth, height: newHeight) //이미지 확대
            
            btnResize.setTitle("축소", for: .normal) //버튼 타이틀 변경
        }
            
        else if (digit == "축소"  && canUse == true) { //축소button누르고 사용가능한 상태면 실행, digit == "축소" => isZoom == true
            newWidth = imgView.frame.width/scale //넓이를 2배로 축소
            newHeight = imgView.frame.height/scale //넓이를 2배로 춧소
            imgView.frame.size = CGSize(width: newWidth, height: newHeight) //이미지 축소
            
            btnResize.setTitle("확대", for: .normal) //버튼 타이틀 변경
        }
        // isZoom = !isZoom  => 버튼 누를떄 변환
        
    }
    @IBAction func btnUseImage(_ sender: UIButton) {
        if (sender.currentTitle! == "사용") //현재 Use버튼의 타이틀은 "사용" => canUse == true
        {
            canUse = false
            btnUse.setTitle("제거", for: .normal) //버튼 타이틀 "제거"로 변경
            imgView.image = imgRemove
            
            btnResize.isEnabled = false //버튼 사용 금지
            switcher.isEnabled = false //스위치 사용 금지
            
            
        }
        else{ //canUse == false
            canUse = true
            btnUse.setTitle("사용", for: .normal) //버튼 타이틀 "사용"으로 변경
            btnResize.isEnabled = true //버튼 사용 가능
            switcher.isEnabled = true //스위치 사용 가능
            
            //제거후 이미지 변경
            if (switcher.isOn) { //스위치가 On 상태
                imgView.image = imgOn
            }
            else{ //스위치가 Off 상태
                imgView.image = imgOff
            }
        }
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if (sender.isOn && canUse == true){ //스위치 On 이고 사용 가능한 상태
            imgView.image = imgOn
        }
        else if (sender.isOn == false && canUse == true){ //스위치 Off 이고 사용 가능한 상태
            imgView.image = imgOff
        }
    }
    
}


