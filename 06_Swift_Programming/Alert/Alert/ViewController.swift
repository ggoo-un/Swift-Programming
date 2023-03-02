//
//  ViewController.swift
//  Alert
//
//  Created by 정구니 on 02/10/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png") //켜진 전구 이미지
    let imgOff = UIImage(named: "lamp-off.png") //꺼진 전구 이미지
    let imgRemove = UIImage(named: "lamp-remove.png") //제거 이미지
    var isLampOn = true //true-->켜기 false-->끄기
    var canUse: Bool? //true-->생성 false-->제거
    @IBOutlet var btnOn: UIButton! //켜기 아웃렛 변수
    @IBOutlet var btnOff: UIButton! //끄기 아웃렛 변수
    @IBOutlet var btnRemove: UIButton! //제거 아웃렛 변수
    @IBOutlet var lampImg: UIImageView! //이미지 뷰 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lampImg.image = imgOn //처음 이미지 뷰 초기화
    }
    
    //    1.UIAlertController(title : 제목, message : 문구 perferredStyle : 얼럿 스타일)
    //                      [alert  : 얼럿 창을 가운데 배치, actionSheet : 얼럿 창을 아래에 배치]
    //    2.UIAlertAction(title : 버튼에 띄울 문구 style : 버튼 스타일 설정 , handler : 버튼 누른 후 실행할 행동)
    //    3.lamponAlert.addAction(onAction) = lamponAlert 얼럿에  onAction 버튼 추가 하기
    //    4.present(lampOnAlert, animated: true, completion : nil)
    //                      [lampOnAlert 얼럿을 화면에 나타나오도록 한다.
    //                       animated  : true  = 화면에 얼럿이 부드럽게 나오도록 한다.
    //                                   false =  화면에 얼럿이 한번에 나오도록 한다.
    //                       completion : 얼럿을 화면에 나오게 한 후 행동 . 행동을 하지 않을꺼면 nil 로 지정]
    
    func warningOn(){ //전구가 켜진 상태에서 또 전구 키라고 하면 경고를 나오게 하는 함수
        let lampOnAlert = UIAlertController(title: "경고", message: "현재 On상태입니다", preferredStyle: UIAlertController.Style.alert) //창 제목, 문구 지정
        let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
        //버튼 문구 지정, 버튼 누른후 실행할 행동 없음
        lampOnAlert.addAction(onAction) //버튼 추가
        present(lampOnAlert, animated: true, completion: nil) //위에 있는 설명 4
    }
    func warningOff(){ //전구가 꺼진 상태에서 또 전구 끄라고 하면 경고를 나오게 하는 함수
        let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off상태입니다", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
        lampOffAlert.addAction(offAction)
        present(lampOffAlert, animated: true, completion: nil)
    }
    func warningButton(){ //램프 제거 완료 후 버튼을 누를때 버튼 사용할 수 없는 경고를 나오게 하는 함수
        
        let btnAlert = UIAlertController(title: "경고", message: "해당 버튼을 사용할 수 없습니다", preferredStyle: UIAlertController.Style.alert)
        let btnCancel = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
        btnAlert.addAction(btnCancel)
        present(btnAlert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnLampOn(_ sender: UIButton) { //켜기 버튼 액션함수
        if canUse == false{ //제거 상태면
            warningButton() //램프 제거 완료후 버튼 누르면 버튼 사용할 수 없는 경고창이 나오게 한다. 함수에 버튼이 있어서 함수 실행되면 아래 소스 실행 안함
        }
        if isLampOn{ //전구가 켜진 상태에서 또 전구 키라고 하면 경고를 나오게 한다
            warningOn()
        }
        else{ //전구가 꺼진 상태면 전구 켜기 여부를 확인한다.
            let checkOnAlert = UIAlertController(title: "램프 켜기", message: "램프를 켜시겠습니까?", preferredStyle: UIAlertController.Style.alert) //창 제목, 문구 지정
            let checkOnAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { //전구 켜기
                ACTION in self.lampImg.image = self.imgOn //이미지 뷰애 이미지 변환
                self.isLampOn = true
            })
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil) //취소
            
            checkOnAlert.addAction(checkOnAction)
            checkOnAlert.addAction(cancelAction)
            
            present(checkOnAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) { //끄기 버튼 액션함수
        if canUse == false{ //제거 상태면
            warningButton() //램프 제거 완료후 버튼 누르면 버튼 사용할 수 없는 경고창이 나오게 한다. 함수에 버튼이 있어서 함수 실행되면 아래 소스 실행 안함
        }
        if isLampOn{ //전구가 켜진 상태면 전구 끄기 여부를 확인한다.
            let checkOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert) //창 제목, 문구 지정
            let checkOffAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { //전구 끄기
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니요", style: UIAlertAction.Style.default, handler: nil) //취소
            
            checkOffAlert.addAction(checkOffAction)
            checkOffAlert.addAction(cancelAction)
            
            present(checkOffAlert, animated: true, completion: nil)
        }
        else{ //전구가 꺼진 상태에서 또 전구 끄라고 하면 경고를 나오게 한다
            warningOff()
        }
        
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) { //제거 버튼 액션함수
        
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            if self.isLampOn{ //전구가 켜진 상태면 전구 끄기
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            }else{ //전구가 끈 상태면 이미 꺼졌다고 경고가 나온다
                self.warningOff()
            }
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            if self.isLampOn{ //전구가 켜진 상태면 이미 켜졌다고 경고가 나온다
                self.warningOn()
            }else{ //전구가 꺼진 상태면 전구 켜기
                self.lampImg.image = self.imgOn
                self.isLampOn = true
            }
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.canUse = false //제거 상태
            self.btnRemove.setTitle("생성", for: .normal) //버튼이름을 "생성"으로 변경
        })
        let cancelRemove = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil) //제거 취소
        
        if (btnRemove.currentTitle! == "제거"){ //누른 버튼이 "제거"버튼이면 램프 제거창이 뜬다
            
            lampRemoveAlert.addAction(offAction)
            lampRemoveAlert.addAction(onAction)
            lampRemoveAlert.addAction(removeAction)
            lampRemoveAlert.addAction(cancelRemove)
            present(lampRemoveAlert, animated: true, completion: nil)
        }
        else { //누른 버튼이 "생성"버튼이면 램프 생성 창이 뜬다
            let lampCreatAlert = UIAlertController(title: "램프 생성", message: "램프를 생성하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let creatAction = UIAlertAction(title: "네, 생성합니다", style: UIAlertAction.Style.default, handler: {
                ACTION in
                //제거하기 전의 전구 상태로 복구
                if (self.isLampOn) {
                    self.lampImg.image = self.imgOn
                }
                else{
                    self.lampImg.image = self.imgOff
                }
                
                self.canUse = true //생성 상태
                self.btnRemove.setTitle("제거", for: .normal) //버튼이름을 "제거"으로 변경
                
            })
            let cancelCreat = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil) //취소 생성
            
            lampCreatAlert.addAction(creatAction)
            lampCreatAlert.addAction(cancelCreat)
            present(lampCreatAlert, animated: true, completion: nil)
        }
        
    }
    
}

