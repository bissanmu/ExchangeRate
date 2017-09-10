//
//  MainViewController.swift
//  ExchangeRate
//
//  Created by admin on 2017. 9. 11..
//  Copyright © 2017년 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var searchDate:String = ""
    
    @IBAction func pickDate(_ sender: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyyMMdd"
        let selectedDate = dateformatter.string(from: sender.date)
        searchDate = selectedDate
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TableTableViewController{
            print("\(self.searchDate)")
            destination.searchDate = self.searchDate
        }
        
    }

}
