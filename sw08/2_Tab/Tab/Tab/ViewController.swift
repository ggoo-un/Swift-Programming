//
//  ViewController.swift
//  MapView3
//
//  Created by 정구니 on 2019/10/22.
//  Copyright © 2019 gooni. All rights reserved.
//

//UIKit 이외에 지도를 사용하기 위해서 MapKit를 import 해야 한다
import UIKit
import MapKit

class ViewController: UIViewController {
    // 아웃렛 변수
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func set(_ latitude: Double, _ longitude: Double, _ annTitle: String, _ annSubtitle: String ){
        //위도와 경도 설정
        let location = CLLocationCoordinate2DMake(latitude, longitude)
        //확대 혹은 축소를 하기 위해서 지도의 범위(스팬)를 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        //위도, 경도 ,스팬을 이용하여 범위를 설정
        let region = MKCoordinateRegion(center: location, span: span)
        //설정된 범위를 맵뷰에 출력
        mapView.setRegion(region, animated: true)
        //MKPointAnnotation()을 이용하여 annotation 객체를 생성한다.
        let annotation = MKPointAnnotation()
        //여기서는 annotation 객체에 지도와 같은 위도와 경도를 설정한다.
        annotation.coordinate = location
        //annotation 객체에 타이틀과 서브타이틀을 설정한다.
        annotation.title = annTitle
        annotation.subtitle = annSubtitle
        //위치, 타이틀과 서브타이틀을 설정한 annotation 객체를 맵 뷰에 출력한다.
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func sgChange1(_ sender: UISegmentedControl) { //집, 학교 자주가는 곳 세그먼트
        if sender.selectedSegmentIndex == 0 { //집
            set(37.885858, 127.740677, "집", "강원도 춘천시 옥천동 한림대학길 1 학생생활관 2관")
        }
        else if sender.selectedSegmentIndex == 1 { //학교
            set(37.886297, 127.737783, "한림대학교", "강원도 춘천시 옥천동 한림대학길 1")
        }
        else if sender.selectedSegmentIndex == 2{ //자주 가는 곳
            set(37.515913, 126.907497, "영들포역 롯데백화점", "서울 영등포구 경인로 846")
        }
        
    }
    @IBAction func sgChange2(_ sender: UISegmentedControl) { //좋아하는 여행지 3곳 세그먼트
        if sender.selectedSegmentIndex == 0 { //여행지1
            set(48.858335, 2.294546, "Eiffel Tower", "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France")
        }
        else if sender.selectedSegmentIndex == 1 { //여행지2
            set(31.239699, 121.499889, "Oriental Pearl TV Tower", "1 Century Ave, Lu Jia Zui, Pudong, Shanghai, China")
        }
        else if sender.selectedSegmentIndex == 2 { //여행지3
            set(51.425118, -116.177545, "Lake Louise", "Lake Louise Dr, Lake Louise, AB, Canada")
        }
    }
    
    
}

