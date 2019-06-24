//
//  quiz8.swift
//  Puja Locator
//
//  Created by Harmanjyot on 22/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class quiz8: UIViewController {

    var PhoneNo: String!
    var EmailID: String!
    var score: Int!
    var langsetquiz: Int!
    
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b24: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langSet(langFAQ: langsetquiz)

        // Do any additional setup after loading the view.
    }
    var seconds = 60
    var timer: Timer?
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
        b11.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
        b12.setTitle("faqQ2".localizableStringFAQ(loc: strLan), for: .normal)
        b13.setTitle("faqQ3".localizableStringFAQ(loc: strLan), for: .normal)
        b14.setTitle("faqQ11".localizableStringFAQ(loc: strLan), for: .normal)
        b21.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
        b22.setTitle("faqQ2".localizableStringFAQ(loc: strLan), for: .normal)
        b23.setTitle("faqQ3".localizableStringFAQ(loc: strLan), for: .normal)
        b24.setTitle("faqQ11".localizableStringFAQ(loc: strLan), for: .normal)
        text1.text = "".localizableString(loc: strLan)
        text2.text = "".localizableString(loc: strLan)
        text3.text = "".localizableString(loc: strLan)
        
    }
    
    func setDisable()  {
        b1.isEnabled = false
        b2.isEnabled = false
        b3.isEnabled = false
        b4.isEnabled = false
        
    }
    
    @IBAction func button1(_ sender: Any) {
        b1.backgroundColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1)
        b2.backgroundColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 1)
        score = 0 + score
        self.setDisable()
    }
    
    @IBAction func button2(_ sender: Any) {
        b2.backgroundColor = UIColor.green
        score = 100 + score
        self.setDisable()
    }
    @IBAction func button3(_ sender: Any) {
        b3.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
        score = 0 + score
        self.setDisable()
        
    }
    @IBAction func button4(_ sender: Any) {
        b4.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
        score = 0 + score
        self.setDisable()
    }
    
    func setDisableQ2() {
        b11.isEnabled = false
        b12.isEnabled = false
        b13.isEnabled = false
        b14.isEnabled = false
    }
    
    @IBAction func button11(_ sender: Any) {
        b11.backgroundColor = UIColor.red
        b14.backgroundColor = UIColor.green
        score = 0 + score
        setDisableQ2()
    }
    @IBAction func button12(_ sender: Any) {
        b12.backgroundColor = UIColor.red
        b14.backgroundColor = UIColor.green
        score = 0 + score
        setDisableQ2()
    }
    @IBAction func button13(_ sender: Any) {
        b14.backgroundColor = UIColor.green
        b13.backgroundColor = UIColor.red
        score = 0 + score
        setDisableQ2()
    }
    @IBAction func button14(_ sender: Any) {
        b14.backgroundColor = UIColor.green
        score = 100 + score
        setDisableQ2()
    }
    
    func setDisableQ3() {
        b21.isEnabled = false
        b22.isEnabled = false
        b23.isEnabled = false
        b24.isEnabled = false
    }
    
    @IBAction func button21(_ sender: Any) {
        b21.backgroundColor = UIColor.red
        b22.backgroundColor = UIColor.green
        score = 0 + score
        self.setDisableQ2()
        
    }
    @IBAction func button22(_ sender: Any) {
        b22.backgroundColor = UIColor.green
        score = 100 + score
        self.setDisableQ2()
    }
    @IBAction func button23(_ sender: Any) {
        b23.backgroundColor = UIColor.red
        b22.backgroundColor = UIColor.green
        score = 0 + score
        self.setDisableQ2()
    }
    @IBAction func button24(_ sender: Any) {
        b24.backgroundColor = UIColor.red
        b22.backgroundColor = UIColor.green
        score = 0 + score
        self.setDisableQ2()
    }
    
    @IBAction func DONE(_ sender: Any) {
        score = score + seconds
        performSegue(withIdentifier: "quiz5Segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz8Segue"{
            guard let langquiz = segue.destination as? quiz9 else {return}
            langquiz.langsetquiz = langsetquiz
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
            langquiz.score = score
            
        }
        
    }
    
    
}
