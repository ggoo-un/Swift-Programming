//
//  ViewController.swift
//  mapView2
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
    @IBOutlet var latitudeSL: UISlider! //위도 슬라이더
    @IBOutlet var longitudeSL: UISlider! //경도 슬라이더
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Silder 초기화
        // 위도 범위를 34.0~38.0 , 경도 범위를 126,0~130.0로 설정
        latitudeSL.maximumValue = 38.0
        latitudeSL.minimumValue = 34.0
        longitudeSL.maximumValue = 130.0
        longitudeSL.minimumValue = 126.0
        latitudeSL.value = 37.5665
        longitudeSL.value = 126.9780
        
    }
    
    func Change(){
        let lat = Double(latitudeSL.value) //입력 위도를 double 타입으로 변환
        let long = Double(longitudeSL.value)//입력 경도를 double 타입으로 변환
        let location = CLLocationCoordinate2DMake(lat, long) //위도와 경도 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) //확대 혹은 축소를 하기 위해서 지도의 범위(스팬)를 설정
        let region = MKCoordinateRegion(center: location, span: span) //위도, 경도 ,스팬을 이용하여 범위를 설정
        mapView.setRegion(region, animated: true) //설정된 범위를 맵뷰에 출력
        
    }
    
    @IBAction func latitude(_ sender:  UISlider) {
        Change()
        
    }
    
    @IBAction func longitude(_ sender:  UISlider) {
        Change()
    }
    
}
