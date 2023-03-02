//
//  ViewController.swift
//  MapView
//
//  Created by 정구니 on 2019/10/22.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController{
    @IBOutlet var mapView: MKMapView!
  
    @IBOutlet var latitudeTF: UITextField! //위도 텍스트 필드
    @IBOutlet var longitudeTF: UITextField! //경도 텍스트 필드
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btn(_ sender: UIButton) {
        let latitude = Double(latitudeTF.text!)! //입력 위도를 double 타입으로 변환
        let longitude = Double(longitudeTF.text!)! //입력 경도를 double 타입으로 변환
        let location = CLLocationCoordinate2DMake(latitude, longitude) //위도와 경도 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) //확대 혹은 축소를 하기 위해서 지도의 범위(스팬)를 설정
        let region = MKCoordinateRegion(center: location, span: span) //위도, 경도 ,스팬을 이용하여 범위를 설정
        mapView.setRegion(region, animated: true) //설정된 범위를 맵뷰에 출력
        let annotation = MKPointAnnotation() //MKPointAnnotation()을 이용하여 annotation 객체를 생성한다
        annotation.coordinate = location //annotation 객체에 위도와 경도를 설정한다
        annotation.title = "위도 : \(latitude) 경도 : \(longitude)" //annotation 객체에 타이틀을 설정한다.
        mapView.addAnnotation(annotation) //위치, 타이틀을 설정한 annotation 객체를 맵 뷰에 출력한다.

    }
}
