//
//  PickCardViewController.swift
//  magic
//
//  Created by 世明 on 2018/5/15.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit

class PickCardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let cardTitle = ["♠︎", "♦︎", "♥︎", "♣︎"]
    let cardNum = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addAct(_ sender: Any) {
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return cardTitle.count
        } else if component == 1{
            return cardNum.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return cardTitle[row]
        } else if component == 1{
            return cardNum[row]
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print("\(cardTitle[row])")
        } else if component == 1{
            print("\(cardNum[row])")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
