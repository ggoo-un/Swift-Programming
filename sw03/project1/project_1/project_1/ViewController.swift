//
//  ViewController.swift
//  project_1
//
//  Created by 정구니 on 01/10/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var labels = ["컴퓨터", "빅데이터", "IoT", "콘텐츠IT", "전자공학"] //배열 만들기
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = labels.count //페이지 개수
        pageControl.currentPage = 0                //현재 페이지를 첫페이지 설정
        pageControl.pageIndicatorTintColor = UIColor.green //컬러 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red //현재 컬러
        lbl.text = labels[0]                    //label초기화
        
    }
    @IBAction func pageChange(_ sender: UIPageControl) { //PageControl 액션함수
        lbl.text = labels[pageControl.currentPage] //현재 패이지를 받아와서 배열 내용을 출력
        
    }
    

}

