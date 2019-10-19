//
//  MainUIViewController.swift
//  StanforwardStudy
//
//  Created by leaco on 2019/10/18.
//  Copyright © 2019 Leaco. All rights reserved.
//

import UIKit

class MainUIViewController: UIViewController {
    
    var filpCount=0{
        didSet{
            filpCountLabel.text="Filps:\(filpCount)"
        }
    }
    
    var emojyChoices = ["😈","😈","🎃","🎃","😈","🎃"]

    @IBOutlet weak var filpCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        filpCount += 1
        let index: Int? = cardButtons.firstIndex(of: sender)
//        print("cardNo:\(index)")
        filpCard(withEmojy: emojyChoices[index!], on: sender)
    }

    func filpCard(withEmojy emojy:String,on button:UIButton){
        
        print("filp with:\(emojy)")
        
        if button.currentTitle==emojy{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }else{
            button.setTitle(emojy, for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }

}
