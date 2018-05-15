//
//  ViewController.swift
//  magic
//
//  Created by 世明 on 2018/5/14.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var posView: UIView!
    @IBOutlet var btnSet: [UIButton]!
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var labTitle: UILabel!
    
    var sound: AVAudioPlayer!
    var beforeX: CGFloat!
    var beforeY: CGFloat!
    var posHasCard = false
    var isBack = true
    var buttonSender: UIButton!
    var changeIndex = 0
    let card = ["card-a01", "card-a02", "card-a03", "card-a04", "card-a05", "card-a06", "card-a07", "card-a08", "card-a09", "card-a10", "card-a11", "card-a12", "card-a13", "card-b01", "card-b02", "card-b03", "card-b04", "card-b05", "card-b06", "card-b07", "card-b08", "card-b09", "card-b10", "card-b11", "card-b12", "card-b13", "card-c01", "card-c02", "card-c03", "card-c04", "card-c05", "card-c06", "card-c07", "card-c08", "card-c09", "card-c10", "card-c11", "card-c12", "card-c13", "card-d01", "card-d02", "card-d03", "card-d04", "card-d05", "card-d06", "card-d07", "card-d08", "card-d09", "card-d10", "card-d11", "card-d12", "card-d13"]
    var showCard = "card-d08"//default
    @IBAction func swap2PosAct(_ sender: UIButton) {
        if posHasCard {
            // posView has a card
            return
        }else{
            btnChange.isHidden = false
            buttonSender = sender
            posHasCard = true
            for a in self.btnSet{
                if a.tag == sender.tag{
                    self.beforeX = sender.center.x
                    self.beforeY = sender.center.y
                    UIView.animate(withDuration: 1) {
                        sender.center.x = self.posView.center.x
                        sender.center.y = self.posView.center.y
                    }
                }
            }
        }
    }
    @IBAction func btnInsertPeterAct(_ sender: Any) {
        showCard = "peter"
    }
    @IBAction func returnBack(_ sender: Any) {
        //change a card
        switch changeIndex {
        case 0:
            showCard = "card-a01"
        case 1:
            showCard = "card-b01"
        case 2:
            showCard = "card-c01"
        case 3:
            showCard = "card-d01"
        default:
            showCard = "peter"
        }
        changeIndex += 1
        btnChange.isHidden = true
        posHasCard = false
        buttonSender.setBackgroundImage(#imageLiteral(resourceName: "card-e04"), for: .normal)
        buttonSender.center.x = self.beforeX
        buttonSender.center.y = self.beforeY
        self.beforeX = nil
        self.beforeY = nil
    }
    @IBAction func change(_ sender: Any) {
        let num = GKRandomDistribution(lowestValue: 0, highestValue: 51).nextInt()
        showCard = card[num]
        if !isBack{
            buttonSender.setBackgroundImage(UIImage(named: showCard), for: .normal)
        }
    }
    @IBAction func testBack2Before(_ sender: UIButton) {
        if sender.center.x == posView.center.x && sender.center.y == posView.center.y{
            //on posView
            if changeIndex == 2{
                sound.play()
            }
            if isBack{
                if showCard == "peter"{
                    labTitle.text = "感恩Peter 讚嘆Peter"
                }
                isBack = false
                sender.setBackgroundImage(UIImage(named: showCard), for: .normal)
                UIView.transition(with: sender, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }else{
                isBack = true
                labTitle.text = ""
                sender.setBackgroundImage(#imageLiteral(resourceName: "card-e04"), for: .normal)
                UIView.transition(with: sender, duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "bell", withExtension: "mp3")
        do{
            sound = try AVAudioPlayer(contentsOf: url!)
            sound.prepareToPlay()
        }catch let error{
            print("Error:\(error)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

