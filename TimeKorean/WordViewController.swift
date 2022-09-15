//
//  WordViewController.swift
//  TimeKorean
//
//  Created by 春田実利 on 2022/09/13.
//

import UIKit
import RealmSwift

class WordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let realm = try! Realm()
    
    @IBOutlet var wordTableView: UITableView!
    
    @IBOutlet var japaneseLabel: UILabel!
    @IBOutlet var koreanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(Word.self)
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let userData = realm.objects(Word.self)
        
        //cell.textLabel!.text = "日本語：\(userData[indexPath.row].japanese)"
        //cell.textLabel!.text = "韓国語：\(userData[indexPath.row].korean)"
        
        japaneseLabel.text = "日本語：\(userData[indexPath.row].japanese)"
        koreanLabel.text = "韓国語：\(userData[indexPath.row].korean)"
        
        cell.textLabel?.numberOfLines=0
        
        return cell
        
    }

    //55行目までラベルを二つにしたくの実装。うまくいってない。
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userData = realm.objects(Word.self)
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as! TableViewCell
            cell.japaneseLabel.text = "日本語：\(userData[indexPath.row].japanese)"
            cell.koreanLabel.text = "韓国語：\(userData[indexPath.row].korean)"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
