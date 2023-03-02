//
//  ViewController.swift
//  Map
//
//  Created by 정구니 on 2019/10/30.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate {
    // CLLocationManagerDelegate를 채택

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    func goLoction(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D{
        // 지정된 위치로 관련된 위도와 경도를 반환한다.
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        
        // 지도 영역의 너비와 높이 지정
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        
        // 특정 위도와 경도를 중심으로하는 직사각형 지리적 영역.
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        
        // 현재 표시되는 영역을 변경하고 필요에 따라 새 영역을 보고 싶을 경우 animate를 true를 지정한다. false 경우 지정된 영역에 지도가 중앙에 오도록 하게 한다.
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    // 특정 위도와 경도에 핀을 설치하고 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        // 핀을 설치하기 위해 MKPointAnnotation 함수를 사용
        let annotation = MKPointAnnotation()
        // coordinate 값을 받기위해 goLocation 함수를 사용하여 반환 값을 대입
        annotation.coordinate = goLoction(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle // 제목
        annotation.subtitle = strSubtitle // 부제목
        myMap.addAnnotation(annotation)
    }
    
    // CLGeocoder class : 주소 -> 좌표 , 좌표 -> 주소로 변경할 수있는 기능을 가진 클래스
    // reverseGeocodeLocation : 좌표 값을 주소로 변경해주는 함수
    // 매개변수 = placemarks : 지정된 주소 값을 가지고 있는 배열. 단, 단일 위치로 확인할 수 없는 상황에서는 여러 장소 표시 객체를 반환 할 수 있다.
    // 매개변수 = error : 위치 표시 데이터가 반환되지 않는 이유를 가지고 있는 오류 코드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // 위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
        NSLog("Here is locationManager function!")
        let pLocation = locations.last // 마지막 위치 값을 저장
        goLoction(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: { (placemarks, error) -> Void in
            let pm = placemarks!.first // 첫 부분만 대입
            let country = pm!.country // 나라 값을 대입
            var address:String = country! // 나라 값을 문자열에 대입
            if pm!.locality != nil { // 지역 값이 존재 한다면
                address += " "
                address += pm!.locality! // 지역을 address 에 추가 대입
            }
            if pm!.thoroughfare != nil { // 도로 값이 존재한다면
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self // 위임자를 정한다
        // 정확도를 최고로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구하는 함수.
        locationManager.requestWhenInUseAuthorization()
        // 위치 업데이트 시작 함수
        locationManager.startUpdatingLocation()
        // 위치 보기 값을 true (허용)으로 설정
        myMap.showsUserLocation = true
        
    }
    
    // 세그먼트 컨트롤을 선택하였을 때 호출
    @IBAction func sgChangeLpcation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // 현재위치
            self.lblLocationInfo1.text = " "
            self.lblLocationInfo2.text = " "
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 { // 한림대학교
            setAnnotation(latitudeValue: 37.8862292, longitudeValue: 127.7377722, delta: 1, title: "한림대학교", subtitle: "강원도 춘천시 옥천동 한림대학길 1") // 핀 설정
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한림대학교"
        }
        else if sender.selectedSegmentIndex == 2 { // 인천공항
            setAnnotation(latitudeValue: 37.447688, longitudeValue: 126.452483, delta: 1, title: "인천국제공항역", subtitle: "인천광역시 운서동") // 핀 설정
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "인천공항"
        }
    }
    

}

