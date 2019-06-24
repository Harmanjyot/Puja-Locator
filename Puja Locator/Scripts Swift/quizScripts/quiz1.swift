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
    
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    
    @IBOutlet weak var done: UIButton!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    var seconds = 60
    var timer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        score = 0
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
        b1.setTitle("Haridwar".localizableStringFAQ(loc: strLan), for: .normal)
        b2.setTitle("Harvest".localizableStringFAQ(loc: strLan), for: .normal)
        b3.setTitle("Harish".localizableStringFAQ(loc: strLan), for: .normal)
        b4.setTitle("Harman".localizableStringFAQ(loc: strLan), for: .normal)
        b11.setTitle("Water Melon".localizableStringFAQ(loc: strLan), for: .normal)
        b12.setTitle("Lemon".localizableStringFAQ(loc: strLan), for: .normal)
        b13.setTitle("Cactus".localizableStringFAQ(loc: strLan), for: .normal)
        b14.setTitle("Coconut".localizableStringFAQ(loc: strLan), for: .normal)
        text1.text = "My first three is another name for the hindu god Shiva. my last four create something to wear. Toogether I might use a scythe. What am I?".localizableString(loc: strLan)
        text2.text = "It has three eyes, but is no Shiva; it lives on top of a tree, but it is no bird; it is full of water, but it is no a pot.".localizableString(loc: strLan)
        
    }

    func setDisable()  {
        b1.isEnabled = false
        b2.isEnabled = false
        b3.isEnabled = false
        b4.isEnabled = false
        
    }
    
    @IBAction func button1(_ sender: Any) {
        b1.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
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
        b13.backgroundColor = UIColor.red
        b14.backgroundColor = UIColor.green
        score = 0 + score
        setDisableQ2()
    }
    @IBAction func button14(_ sender: Any) {
        b14.backgroundColor = UIColor.green
        score = 100 + score
        setDisableQ2()
    }
    
    @IBAction func done(_ sender: Any) {
        if score == 0 {
            score = 0
        } else {
            score = score + seconds
        }
        
        performSegue(withIdentifier: "quiz1Segue", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz1Segue"{
            guard let langquiz = segue.destination as? endQuiz1 else {return}
            langquiz.langsetquiz = langquiz1
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
            guard let week1Score = segue.destination as? endQuiz1 else { return }
            week1Score.score = score
        }
        
    }
    
    
}
