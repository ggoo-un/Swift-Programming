//
//  ViewController.swift
//  Web
//
//  Created by 정구니 on 2019/10/23.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UIWebViewDelegate{ // UIWebViewDelegate를 채택
    
    @IBOutlet var txtUrl: UITextField! //텍스트 필드 아웃렛 변수
    @IBOutlet var myWebView: UIWebView! // 웹 뷰 아웃렛 변수
    @IBOutlet var myActivityindicator: UIActivityIndicatorView! // 액티비티 인디케이터 아웃렛 변수
    
    // url의 인수를 통해 웹 페이지의 주소를 전달받아 웹페이지를 보여 준다.
    func loadWebPage(_ url : String){
        let myUrl = URL(string: url) // url 인수를 받아서 URL 주소로 변환
        let myRequest = URLRequest(url : myUrl!) //요청 양식으로 변환
        myWebView.loadRequest(myRequest) // 웹 뷰에 출력
    }
    
    
    
    func checkUrl(_ url: String) -> String{ // "http://" 문자열이 없을 경우 자동으로 삽입
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") // 문자열strUrl가 "http://"로 시작하는 지 확인
        if !flag{ // 문자열strUrl가 "http://"로 시작하지 않는다면 "http://"를 추가
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.delegate = self // 위임자를 정한다
        loadWebPage("http://www.hallym.ac.kr") // 앱 시작 초기 페이지
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) { //텍스트 필드에 적힌 주소로 웹 뷰 로딩
        let myUrl = checkUrl(txtUrl.text!) // 문자열 채크
        txtUrl.text = ""
        loadWebPage(myUrl)

    }
    
    // Smart 버튼 클릭 --> http://smart.hallym.ac.kr 로 이동
    @IBAction func btnGoSmart(_ sender: UIButton) {
        loadWebPage("http://smart.hallym.ac.kr/")
    }
    // Mail 버튼 클릭 --> http://mail.hallym.ac.kr 로 이동
    @IBAction func btnGoMail(_ sender: UIButton) {
        loadWebPage("http://mail.hallym.ac.kr/")
    }
    // Html 버튼 클릭
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        // HTML 코드를 변수에 저장한다
        let htmlString = "<h1> HTML String </h1><p> String  변수를 이용한 웹 페이지 </p><p><a href = \"http://2sam.net\">2sam.net</a>으로 이동</p>"
        // HTML 문법에 맞게 작성된 문자열 변수를 웹 뷰로 나타냄
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    // File 버튼 클릭 --> h1.html를 웹 뷰에 나타넴
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        // 모든 실행 파일은 번들 객체를 사용하여 앱 내부 나 다른 위치에 있는 알려진 번들 내에서 리소스를 찾을 수 있도록 지원한다
        let myHtmlBundle = Bundle.main
        // h1.html 파일 주소를 가져온다
        let filePath = myHtmlBundle.path(forResource: "h1", ofType: "html")
        loadWebPage(filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 웹 페이지의 로딩을 중지
    }
    
    @IBAction func btnReLoad(_ sender: UIBarButtonItem) {
        myWebView.reload() // 웹 페이지를 재로딩 (새로고침)
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() // 이전 웹 페이지로 이종
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() // 다음 웹 페이지로 이동
    }
    func webViewDidStartLoad(_ webView: UIWebView){
        // 웹 뷰가 시작될 때 인디케이터를 시작
        myActivityindicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView){
        // 웹 뷰가 종로될 때 인디케이터를 종료
        myActivityindicator.stopAnimating()
    }
    
}

