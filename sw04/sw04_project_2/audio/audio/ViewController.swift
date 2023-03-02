//
//  ViewController.swift
//  audio
//
//  Created by 정구니 on 2019/10/10.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer : AVAudioPlayer! // AVAudioPlayer 인스턴스 변수
    var audioFile : URL! //재생할 노디노의 파일명 변수
    var count: Int!
    var con : Int!
    var isplay : Bool = false //재생 여부 (false --> 중지)
    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var imageView: UIImageView!
    var musicNames = [ "Hotel California" , "California dream" , "Before the dawn" , "Yesterday" , "El condor pasa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        con = 0
        
        //slider 설정
        volumeSlider.isEnabled = false
        volumeSlider.maximumValue = 2.0
        volumeSlider.minimumValue = 0.0
        volumeSlider.value = 1.0
        audioFile = Bundle.main.url(forResource: musicNames[0], withExtension: "mp3") //오디오 파일명 설정
        //오디오 파일이 없을때 대비하여 do-try-catch 문을 사용
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile) //audioFile를 파라미터로 audioPlayer객체를 만든다
        }catch let error as NSError{
            print("Error : \(error)")
        }
        audioPlayer.prepareToPlay() //오디오 객체 준비
        audioPlayer.volume = volumeSlider.value //볼륨 초기화
    }
    
    @IBAction func volumeChangeSlider(_ sender: UISlider) {
        audioPlayer.volume = volumeSlider.value //볼륨 설정
    }
    
    @IBAction func sgControl(_ sender: UISegmentedControl) {
        count = sender.selectedSegmentIndex //현재 선택한 세그먼트 index
        lbltitle.text = String(count+1) + "." + musicNames[count] //제목
        if (con == count)&&(isplay == true) { //플레이 중인 세그먼트를 다시 클릭 할 때
            audioPlayer.stop() //중지
            isplay = false
            lbltitle.text = lbltitle.text! + "(중지)"
            volumeSlider.isEnabled = false
        }
        else{
            
            isplay = true
            imageView.image = UIImage(named: musicNames[count]+".png")
            
            audioFile = Bundle.main.url(forResource: musicNames[count], withExtension: "mp3")
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
            }catch let error as NSError{
                print("Error : \(error)")
            }
            audioPlayer.play() //재생
            con = count
            lbltitle.text = lbltitle.text! + "(재생)" //제목
            volumeSlider.isEnabled = true
        }
    }
    
    
}

