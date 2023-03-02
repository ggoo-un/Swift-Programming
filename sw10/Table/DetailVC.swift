//
//  DetailVC.swift
//  Table
//
//  Created by 정구니 on 2019/11/27.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var name1 = ""
    var mobile1 = ""
    var date1 = ""
    var img = ""
    
    @IBOutlet var namelbl: UILabel!
    @IBOutlet var mobilelbl: UILabel!
    @IBOutlet var datelbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        namelbl.text = name1
        mobilelbl.text = mobile1
        datelbl.text = date1
        imgView.image = UIImage(named: img)
    }
    
    func reciveItem(name: String, mobile: String, date: String, image: String)
    {
        
        namelbl.text = name1
        mobilelbl.text = mobile1
        datelbl.text = date1
        imgView.image = UIImage(named: img)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
