//
//  ViewController.swift
//  PageControl
//
//  Created by 정구니 on 2019/11/06.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bgName = ["덴마크 코펜하겐.jpg","중국 선전.jpg","세르비아 노비사드.jpg","미국 마이애미.jpg","멕시코 멕시코시티.jpg",
    "세네갈 다카르.jpg","네팔 카트만두.png","미국 시애틀.jpg","크로아티아 자다르.jpg","모로코 메크네스.jpg"] //여행지 파일이름 배열
    var aniName = ["강아지.jpg","고양이.jpg","다람쥐.jpg","토끼.jpg","펭귄.jpg","마못.jpg","수달.jpg","카피바라.jpg","쿼카.jpg","하프물범.jpg"] //동물 파일이름 배열
    var animalCurrent = 0, backCurrent = 0 //현재 동물이미지와 여행지 이미지의 index를 알기 위해 변수 추가
    var whatImage = true //true --> 배경 false --> 동물

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbl: UILabel! //이미지 이름 label
    @IBOutlet weak var lblTitle: UILabel! //전체 제목 label
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var slRed: UISlider! //red
    @IBOutlet var slGreen: UISlider! //green
    @IBOutlet var slBlue: UISlider! //blue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기화
        slRed.minimumValue = 0.0
        slRed.maximumValue = 1.0
        slRed.value = 1.0
        slGreen.minimumValue = 0.0
        slGreen.maximumValue = 1.0
        slGreen.value = 0.0
        slBlue.minimumValue = 0.0
        slBlue.maximumValue = 1.0
        slBlue.value = 0.0
        pageControl.numberOfPages = bgName.count //페이지 개수
        pageControl.currentPage = 0 //현재 페이지
        pageControl.pageIndicatorTintColor = UIColor.green //컬러 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red //현재 컬러
        lbl.text = bgName[0]
        lblTitle.text = "꼭 가야하는 해외 여행지"
        imageView.image = UIImage(named: bgName[0])
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) { //PageControl 액션함수
        if whatImage{ //여행지 화면
            backCurrent = pageControl.currentPage //여행지 index를 현재 페이지로 받아온다
            imageView.image = UIImage(named: bgName[backCurrent]) //이미지 뷰
            lbl.text = bgName[backCurrent] //이미지 이름 label
        }
        else{ //동물 화면
            animalCurrent = pageControl.currentPage
            imageView.image = UIImage(named: aniName[animalCurrent])
            lbl.text = aniName[animalCurrent]
        }
    }
    @IBAction func btnChange(_ sender: UIButton) { //여행지, 동물 버튼 액션함수
        let imageNow = sender.currentTitle
        if(imageNow == "여행지"){ //누른 버튼이 여행지 이면
            animalCurrent = pageControl.currentPage //현재 동물 페이지를 변수에 저장한다
            imageView.image = UIImage(named: bgName[backCurrent]) //이미지 뷰에는 전에 저장한 페이지의 여행지 이미지를 출력
            lbl.text = bgName[backCurrent]
            lblTitle.text = "꼭 가야하는 해외 여행지"
            pageControl.currentPage = backCurrent //페이지를 전에 저장한 여행지 페이지로 변경
            whatImage = true
        }
        else{ //누른 버튼이 동물 이면
            backCurrent = pageControl.currentPage //현재 여행지 페이지를 변수에 저장한다
            imageView.image = UIImage(named: aniName[animalCurrent]) //이미지 뷰에는 전에 저장한 페이지의 동물 이미지를 출력
            lbl.text = aniName[animalCurrent]
            lblTitle.text = "귀여운 동물 Top10"
            pageControl.currentPage = animalCurrent //페이지를 전에 저장한 동물 페이지로 변경
            whatImage = false
        }
    }
    @IBAction func Red(_ sender: UISlider) {
        // alpha:0-->투명 1-->부투명
        // red, green, blue는 0~1 사이의 실수 값을 가집니다.
        let myColor = UIColor(red: CGFloat(slRed.value), green: CGFloat(slGreen.value), blue: CGFloat(slBlue.value), alpha: 1)
        // 현재 페이지 컨트롤러 컬러 변경
        pageControl.currentPageIndicatorTintColor = myColor
    }
    @IBAction func Green(_ sender: UISlider) {
        let myColor = UIColor(red: CGFloat(slRed.value), green: CGFloat(slGreen.value), blue: CGFloat(slBlue.value), alpha: 1)
        pageControl.currentPageIndicatorTintColor = myColor
    }
    @IBAction func Blue(_ sender: UISlider) {
        let myColor = UIColor(red: CGFloat(slRed.value), green: CGFloat(slGreen.value), blue: CGFloat(slBlue.value), alpha: 1)
        pageControl.currentPageIndicatorTintColor = myColor
    }
}

