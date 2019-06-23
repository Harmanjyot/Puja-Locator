//
//  quiz1.swift
//  Puja Locator
//
//  Created by Harmanjyot on 22/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit
import Foundation



class quiz1: UIViewController {
    
    var PhoneNo: String!
    var EmailID: String!
    var langsetquiz1: Int!
    var langquiz1: Int!
    
    var score: Int!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    var seconds = 60
    var timer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        langquiz1 = langsetquiz1
        langSet(langFAQ: langquiz1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
        
    }
    
    @objc func counter() {
        seconds = seconds - 1
        timeLabel.text = String(seconds)
        if seconds == 0 {
            if timer != nil {
                timer?.invalidate()
                timer = nil
                self.button1((Any).self)
            }
        }
    }
    
    
    func langSet(langFAQ: Int) {
        if (langFAQ == 0){
            changeLang(strLan: "en")
        }
        else if (langFAQ == 1) {
            changeLang(strLan: "hi")
        }
        else {
            changeLang(strLan: "mr-IN")
        }
    }
    
    func changeLang(strLan: String) {
        b1.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
        b2.setTitle("faqQ2".localizableStringFAQ(loc: strLan), for: .normal)
        b3.setTitle("faqQ3".localizableStringFAQ(loc: strLan), for: .normal)
        b4.setTitle("faqQ11".localizableStringFAQ(loc: strLan), for: .normal)
        
    }

    @IBAction func button1(_ sender: Any) {
        b1.backgroundColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1)
        b2.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 1)
        score = 0
        performSegue(withIdentifier: "quiz1Segue", sender: nil)
        
        
    }
    
    @IBAction func button2(_ sender: Any) {
        b2.backgroundColor = UIColor.green
        score = 100 + seconds
        performSegue(withIdentifier: "quiz1Segue", sender: nil)
        
    }
    @IBAction func button3(_ sender: Any) {
        b3.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
        score = 0
        performSegue(withIdentifier: "quiz1Segue", sender: nil)
        
    }
    @IBAction func button4(_ sender: Any) {
        b4.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
          score = 0
        performSegue(withIdentifier: "quiz1Segue", sender: nil)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz1Segue"{
            guard let langquiz = segue.destination as? quiz2 else {return}
            langquiz.langsetquiz = langquiz1
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
            guard let week1Score = segue.destination as? quiz2 else { return }
            week1Score.score = score
        }
        
    }
    
    
}
