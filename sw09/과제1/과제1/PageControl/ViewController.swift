//
//  ViewController.swift
//  PageControl
//
//  Created by Ho-Jeong Song on 2018. 10. 2..
//  Copyright © 2018년 Ho-Jeong Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    var bgImg = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg",
                  "6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"] //여행지 배열
    var aniImg = ["1a.jpg","2a.jpg","3a.jpg","4a.jpg","5a.jpg","6a.jpg","7a.jpg","8a.jpg","9a.jpg","10a.jpg"] //동물 배열
    var animalCurrent = 0, backCurrent = 0 //현재 동물이미지와 여행지 이미지의 index를 알기 위해 변수 추가
    var whatImage = true //true --> 배경 false --> 동물
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var lbl: UILabel!
    
    func didMessageEditDone(_ controller: EditVC, message: String) {
        txMessage.text = message
    }
    func fooSet(name2: String, whatImage2: Bool, currentPage: Int){
        if whatImage2{ //누른 버튼이 여행지 이면
            whatImage = whatImage2
            imgView.image = UIImage(named: name2+".jpg")
            lbl.text = "꼭 가야하는 해외 여행지"
            pageControl.currentPage = currentPage
        }
        else{ //누른 버튼이 동물 이면
            whatImage = whatImage2
            imgView.image = UIImage(named: name2+".jpg")
            lbl.text = "귀여운 동물 Top10"
            pageControl.currentPage = currentPage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기화
        pageControl.numberOfPages = bgImg.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: bgImg[0])
        // 스와이프
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 수정화면 객체 생성
        let editViewController = segue.destination as! EditVC
        // if문과 else문을 이용해 세그웨이 별로 다른 문자열을 전송한다.
        if segue.identifier == "editButton" { // 버튼을 클릭한 경우
            editViewController.img = "지구.png"
        } else if segue.identifier == "editBarButton" { // 바 버튼을 클릭한 경우
            editViewController.img = "달.png"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.delegate = self // 위임자를 설정
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @IBAction func PageChange(_ sender: UIPageControl) {
        print(whatImage)
        if whatImage{ //여행지 화면
            backCurrent = pageControl.currentPage //여행지 index를 현재 페이지로 받아온다
            imgView.image = UIImage(named: bgImg[backCurrent]) //이미지 뷰
        }
        else{ //동물 화면
            animalCurrent = pageControl.currentPage
            imgView.image = UIImage(named: aniImg[animalCurrent])
        }
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if (pageControl.currentPage<pageControl.numberOfPages-1) {
                    pageControl.currentPage = pageControl.currentPage + 1
                }
                print("Swiped Left")
            case UISwipeGestureRecognizer.Direction.right:
                if (pageControl.currentPage>0) {
                    pageControl.currentPage = pageControl.currentPage - 1
                }
                print("Swiped Right")
            default:
                break
            }
            if whatImage{ //여행지 화면
                backCurrent = pageControl.currentPage //여행지 index를 현재 페이지로 받아온다
                imgView.image = UIImage(named: bgImg[backCurrent]) //이미지 뷰
            }
            else{ //동물 화면
                animalCurrent = pageControl.currentPage
                imgView.image = UIImage(named: aniImg[animalCurrent])
            }
        }
    }
    
}

