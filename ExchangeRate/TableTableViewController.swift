//
//  TableTableViewController.swift
//  ExchangeRate
//
//  Created by admin on 2017. 9. 10..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    var searchDate = String()
    var resultArr = [Double]()
    var cur_unitArr = [String]()
    var cur_deal_bas_rArr = [String]()
    var cur_nmArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authkey:String = "XMWwDJ3osCzcO4UanBGQorRGd3MAftYo"    //OpenAPI 신청시 발급된 인증키
       // let searchdate = self.searchDate //ex) 20150101, (DEFAULT)현재일
        let searchdate = "20170908"
        let data:String = "AP01"   //AP01 : 환율, AP02 : 대출금리, AP03 : 국제금리
        print("\(searchdate)")
        let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=\(authkey)&data=\(data)&searchdate=\(searchdate)"
        
        let serverURL:URL! = URL(string: url)
        let serverData = try! Data(contentsOf: serverURL)
        print(url)
        do{
            let dict = try JSONSerialization.jsonObject(with: serverData, options: []) as! [[String:Any]]
            
            for dictIndex in dict{
                resultArr.append(dictIndex["result"] as! Double)
                cur_unitArr.append(dictIndex["cur_unit"] as! String)
                cur_deal_bas_rArr.append(dictIndex["deal_bas_r"] as! String)
                cur_nmArr.append(dictIndex["cur_nm"] as! String)
                
            }
//            for i in 0..<resultArr.count {
//                print("\(cur_unitArr[i]) \(cur_nmArr[i]) \(cur_deal_bas_rArr[i])")
//            }
        } catch{
            print("Error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        
        cell.cur_cd.text = cur_unitArr[indexPath.row]
        cell.cur_nm.text = cur_nmArr[indexPath.row]
        cell.deal_vas_r.text = cur_deal_bas_rArr[indexPath.row]
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
