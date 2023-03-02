//
//  ViewController.swift
//  Dictionary_test
//
//  Created by 정구니 on 25/09/2019.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Dic = [1:["A","B"]] //키는 1이고 value는 문자형 배열인 ["A","B"]를 갖고있는 Dictionary를 생성 --> Dic
    var Dic2 : [Int : [String]] = [:] //KeyType이 Int고, ValueType이 문자형 배열변수인 Dictionary를 생성 --> Dic2
    var Dic3 = [1:["AAA":"BBB"]] //키는 1이고 value는 다른 딕셔너리인 ["AAA":"BBB"]를 갖고있는 Dictionary를 생성 (2중 딕셔너리)--> Dic3
    var Dic4 = ["김동영":["주소":"1211","전화번호":"010-1111-1111"]] //키는 "김동영"이고 value는 다른 딕셔너리인 ["주소":"1211","전화번호":"010-1111-1111"]를 갖고 있는 Dictionary를 생성 (2중 딕셔너리) --> Dic4

    override func viewDidLoad() {
        super.viewDidLoad()
        Dic[2] = ["C","D"] //키가 2이고 value이 ["C","D"]인 값을 Dic에 추가
        for (DicKey, DicValue) in Dic{ //Dic에 있는 키와 value를 받아서 출력
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+DicValue[1]) //딕셔너리는 랜덤으로 출력
            // 1. Dic의 키값이 DicKey에 저장되어 있어서 먼저 Dic의 키값을 출력하고 DicValue는 Dic의 value값이고 문자형 배열 이기 때문에 index값이 있다. DicValue[0]는 value의 첫번째 값, DicValue[1]는 value의 두번째 값이다.
    
        }
        Dic2[1] = ["CC","DD"] //키가 1이고 value이 ["CC","DD"]인 값을 Dic2에 추가
        Dic2[2] = ["KK","ZZ"] //키가 2이고 value이 ["KK","ZZ"]인 값을 Dic2에 추가
        Dic2[3] = ["HHH","AAA"] //키가 3이고 value이 ["HHH","AAA"]인 값을 Dic2에 추가
        Dic2.updateValue(["DDDD", "ZZZZZZZ"],forKey: 2) //Dic2에 키가 2인 value를 ["DDDD", "ZZZZZZZ"]로 수정
    
        for (DicKey, DicValue) in Dic2{ //Dic2에 있는 키와 value를 받아서 출력
            NSLog("DicKey : "+String(DicKey)+", DicValue : "+DicValue[0]+DicValue[1]) //랜덤으로 출력
            // 2. Dic2의 키값이 DicKey에 저장되어 있어서 먼저 Dic2의 키값을 출력하고 DicValue는 Dic2의 value값이고 문자형 배열 이기 때문에 index값이 있다. DicValue[0]는 value의 첫번째 값, DicValue[1]는 value의 두번째 값이다.
        }
        NSLog("Dic3[1] value's key : "+String(Dic3[1]!.keys.randomElement()!)+"Dic3[1] value's value : "+String(Dic3[1]!.values.randomElement()!))
            // 3. Dic3[1]=["AAA":"BBB"], Dic3[1]는 딕셔너리고 Dic3[1]의 키값은 "AAA"밖에 없어서 "AAA"출력
            // 마찬가지로 Dic3[1]의 value값도 "BBB"밖에 없어서 "BBB"출력
        NSLog("Dic4[key]'s 주소 : "+Dic4["김동영"]!["주소"]!+"/Dic4[key]'s 전화번호 : "+Dic4["김동영"]!["전화번호"]!)
            // 4. Dic4["김동영"]=["주소":"1211","전화번호":"010-1111-1111"] , Dic4["김동영"]는 딕셔너리이고 Dic4["김동영"]의 키값 "주소"에 의해서 2중 딕셔너리의 값 "1211"를 출력
            // 마찬가지로 Dic4["김동영"]의 키값 "전화번호"에 의해서 2중 딕셔너리의 값 "010-1111-1111"를 출력
    }
}

