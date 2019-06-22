//
//  quiz9.swift
//  Puja Locator
//
//  Created by Harmanjyot on 22/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class quiz9: UIViewController {

    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func button1(_ sender: Any) {
        b1.backgroundColor = UIColor.red
        b4.backgroundColor = UIColor.green
        performSegue(withIdentifier: "quiz9Segue", sender: nil)
    }
    @IBAction func button2(_ sender: Any) {
        b2.backgroundColor = UIColor.red
        b4.backgroundColor = UIColor.green
        performSegue(withIdentifier: "quiz9Segue", sender: nil)
    }
    @IBAction func button3(_ sender: Any) {
        b3.backgroundColor = UIColor.red
        b4.backgroundColor = UIColor.green
        performSegue(withIdentifier: "quiz9Segue", sender: nil)
    }
    @IBAction func button4(_ sender: Any) {
        b4.backgroundColor = UIColor.green
        performSegue(withIdentifier: "quiz9Segue", sender: nil)
    }
    

}
