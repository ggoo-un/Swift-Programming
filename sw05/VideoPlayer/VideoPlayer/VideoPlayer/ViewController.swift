//
//  ViewController.swift
//  VideoPlayer
//
//  Created by 정구니 on 2019/10/22.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func playerVideo(_ urlVideo: NSURL){
        // AVPlayerViewController의 인스턴스 생성
        let playerViewController = AVPlayerViewController()
        // 비디오 URL로 초기화된 AVPlayer의 인스턴스를 생성
        let videoplayer = AVPlayer(url: urlVideo as URL)
        // AVPlayerViewController의 player속성에 위에서 생성한 AVPlayer 인스턴스를 할당
        playerViewController.player = videoplayer

        self.present(playerViewController, animated: true) {
          videoplayer.play() // 비디오 재생
        }

    }
    
    @IBAction func btn1(_ sender: UIButton) {
        // 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let videoFile:String? = Bundle.main.path(forResource: "christmas", ofType: "mov")
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let urlVideo = NSURL(fileURLWithPath: videoFile!)
        playerVideo(urlVideo)       // 앞에서 얻은 urlVideo를 사용하여 비디오 재생
        
    }
    
    @IBAction func btn(_ sender: UIButton) {
        //외부에 링크된 주소를 NSURL 형식으로 변경
        let urlVideo = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playerVideo(urlVideo)       // 앞에서 얻은 urlVideo를 사용하여 비디오 재생
    }
}
