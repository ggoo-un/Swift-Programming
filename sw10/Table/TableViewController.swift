//
//  TableViewController.swift
//  Table
//
//  Created by 정구니 on 2019/11/27.
//  Copyright © 2019 gooni. All rights reserved.
//

import UIKit

var name = ["홍길동", "김길동", "이길동"]
var mobile = ["010-1111-2222", "010-3333-4444", "010-5555-6666"]
var date = ["2019-11-10","2019-11-13","2019-11-23"]
var itemsImageFile = ["1.png", "2.png", "3.png"]
class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 왼쪽 edit 바 버튼 추가해서 설정할 수 있음
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    // 테이블당 섹션 하나
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // 행수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }

    // 이름과 이미지를 셀에 삽입
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = name[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }

    // 목록 삭제 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 삭제
            name.remove(at: (indexPath as IndexPath).row)
            mobile.remove(at: (indexPath as IndexPath).row)
            date.remove(at: (indexPath as IndexPath).row)
            itemsImageFile.remove(at: (indexPath as IndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }
    // "delete" 를 "삭제" 로 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    // 목록 순서 바꾸기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // 이동할 아이템의 정보 저장
        let nameToMove = name[(fromIndexPath as NSIndexPath).row]
        let mobileToMove = mobile[(fromIndexPath as NSIndexPath).row]
        let dateToMove = date[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        // 이동할 아이템 삭제
        name.remove(at: (fromIndexPath as NSIndexPath).row)
        mobile.remove(at: (fromIndexPath as IndexPath).row)
        date.remove(at: (fromIndexPath as IndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        // 삭제 된 아이템을 이동할 위치로 삽입
        name.insert(nameToMove, at: (to as NSIndexPath).row)
        mobile.insert(mobileToMove, at: (to as NSIndexPath).row)
        date.insert(dateToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    
    // Main View 로 돌아올 때 호출하는 함수
    override func viewWillAppear(_ animated: Bool) {
        // 테이블 뷰 다시 불러오는 함수
        tvListView.reloadData()
    }
    
    // Main View --> DetailVC 로 값 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let datailView = segue.destination as! DetailVC
            // DetailVC의 함수 사용
            datailView.reciveItem(name: name[((indexPath as NSIndexPath?)?.row)!], mobile: mobile[((indexPath as NSIndexPath?)?.row)!], date: date[((indexPath as NSIndexPath?)?.row)!], image: itemsImageFile[((indexPath as NSIndexPath?)?.row)!])
        }
    }
    

}
