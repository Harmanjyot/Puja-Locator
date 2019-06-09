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
    
    @IBOutlet weak var buttonLbl: UIButton!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLbl.setTitle(String(count), for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }
    
    
    //BUTTON PRESSES!
    @IBAction func buttonAct(_ sender: Any) {
        
        count = count+1
        buttonLbl.setTitle(String(count), for: UIControl.State.normal)
        if count == 108 {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate) //iPhone WILL VIBRATE
            count = 0
            
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
