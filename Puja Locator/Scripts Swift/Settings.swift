//
//  Settings.swift
//  Puja Locator
//
//  Created by Harmanjyot on 10/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension UIButton {
    func buttonDesign(){
        
        self.layer.cornerRadius = 25
    }
}

class Settings: UIViewController {
    
    //THE FOLLOWING DECLARATIONS AND SETS ARE FOR THE buttonDesign CALL FOR ALL BUTTONS
    
    @IBOutlet weak var engBtnOut: UIButton!{
        didSet {
            engBtnOut.buttonDesign()
        }
    }
    
    @IBOutlet weak var hinBtnOut: UIButton! {
        didSet {
            hinBtnOut.buttonDesign()
        }
    }
    
    @IBOutlet weak var marBtnOut: UIButton! {
        didSet {
            marBtnOut.buttonDesign()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
