//
//  ChantingPage.swift
//  Puja Locator
//
//  Created by Harmanjyot on 08/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit
import AudioToolbox

class ChantingPage: UIViewController {
    
    //INITIALIZING VARIABLES AND INSTANCES
    
  
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var chantLbl: UILabel!
    
    @IBOutlet weak var buttonLbl: UIButton!
    var count = 0
    var malaCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = String(0)
        // Do any additional setup after loading the view.
    }
    
    
    //BUTTON PRESSES!
    @IBAction func buttonAct(_ sender: Any) {
        
        count = count+1
        countLabel.text = String(count)
        if count == 108 {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate) //iPhone WILL VIBRATE
            count = 0
            malaCount = malaCount + 1
            chantLbl.text = String(malaCount) + " Malas counted"
            
        }
        
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
