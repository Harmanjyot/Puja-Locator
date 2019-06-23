//
//  quizMainPage.swift
//  Puja Locator
//
//  Created by Harmanjyot on 12/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit
import Foundation



let df = DateFormatter()
let calendar = Calendar.current
let rightNow = Date()
let week1Quiz = "June 23, 2019"
let week2Quiz = "June 23, 2019"
let week3Quiz = "June 23, 2019"
let week4Quiz = "June 23, 2019"


var quiz1Done: Bool!
var quiz1Avail: Bool!

var quiz2Done: Bool!
var quiz2Avail: Bool!

var quiz3Done: Bool!
var quiz3Avail: Bool!

var quiz4Done: Bool!
var quiz4Avail: Bool!

extension Date {
    func dateToString(style: DateFormatter.Style) -> String {
        df.dateStyle = style
        return df.string(from: self)
    }
}

class quizMainPage: UIViewController {
    
    let defaults  =  UserDefaults.standard
    
    
    var langQuiz: Int!
    var langSettings: Int!
    var EmailID: String!
    var PhoneNo: String!

    @IBOutlet weak var buttonWeek1: UIButton!
    @IBOutlet weak var buttonWeek2: UIButton!
    @IBOutlet weak var buttonWeek3: UIButton!
    @IBOutlet weak var buttonWeek4: UIButton!
    
    @IBOutlet weak var head: UILabel!
    
    @IBOutlet weak var w1: UILabel!
    @IBOutlet weak var w2: UILabel!
    @IBOutlet weak var w3: UILabel!
    @IBOutlet weak var w4: UILabel!
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    
    @IBOutlet weak var d1: UILabel!
    @IBOutlet weak var d2: UILabel!
    @IBOutlet weak var d3: UILabel!
    @IBOutlet weak var d4: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        langQuiz = langSettings
        langSet(langFAQ: langQuiz)
        
        quiz1Avail = defaults.bool(forKey: "quiz1avail")
        quiz1Done = defaults.bool(forKey: "quiz1done")
        quiz2Avail = defaults.bool(forKey: "quiz2avail")
        quiz2Done = defaults.bool(forKey: "quiz2done")
        quiz3Avail = defaults.bool(forKey: "quiz3avail")
        quiz3Done = defaults.bool(forKey: "quiz3done")
        quiz4Avail = defaults.bool(forKey: "quiz4avail")
        quiz4Done = defaults.bool(forKey: "quiz4done")
        
        getTestConditions()
        setButtonStatus()
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
        buttonWeek1.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
        buttonWeek2.setTitle("faqQ2".localizableStringFAQ(loc: strLan), for: .normal)
        buttonWeek3.setTitle("faqQ3".localizableStringFAQ(loc: strLan), for: .normal)
        buttonWeek4.setTitle("faqQ11".localizableStringFAQ(loc: strLan), for: .normal)
        head.text = "".localizableString(loc: strLan)
        w1.text = "faqQ1".localizableStringMain(loc: strLan)
        w2.text = "faqQ1".localizableStringMain(loc: strLan)
        w3.text = "faqQ1".localizableStringMain(loc: strLan)
        w4.text = "faqQ1".localizableStringMain(loc: strLan)
        l1.text = "faqQ1".localizableStringMain(loc: strLan)
        l2.text = "faqQ1".localizableStringMain(loc: strLan)
        l3.text = "faqQ1".localizableStringMain(loc: strLan)
        l4.text = "faqQ1".localizableStringMain(loc: strLan)
        d1.text = "faqQ1".localizableStringMain(loc: strLan)
        d2.text = "faqQ1".localizableStringMain(loc: strLan)
        d3.text = "faqQ1".localizableStringMain(loc: strLan)
        d4.text = "faqQ1".localizableStringMain(loc: strLan)
    }
  
    func getTestConditions() {
        let rightNowStr = rightNow.dateToString(style: .long)
        if (rightNowStr == week1Quiz && quiz1Done == false) {
            quiz1Avail = true
        }
        else {
            quiz1Avail = false
        }
        
        if rightNowStr == week2Quiz && quiz2Done == false {
            quiz2Avail = true
        }
        else {
            quiz2Avail = false
        }
        
        if rightNowStr == week3Quiz && quiz3Done == false {
            quiz3Avail = true
        }
        else {
            quiz3Avail = false
        }
        
        if rightNowStr == week4Quiz && quiz4Done == false {
            quiz4Avail = true
        }
        else {
            quiz4Avail = false
        }
    }
    
    func setButtonStatus(){
        if (quiz1Done == true && quiz1Avail == false)
        {
            buttonWeek1.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
            buttonWeek1.isEnabled = false
        } else {
            buttonWeek1.isEnabled = true
            buttonWeek1.setBackgroundImage(UIImage(named: "play-icon.png"), for: .normal)
        }
        
        if (quiz2Done == true && quiz2Avail == false)
        {
            buttonWeek2.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
            buttonWeek2.isEnabled = false
        } else {
            buttonWeek2.isEnabled = true
            buttonWeek2.setBackgroundImage(UIImage(named: "play-icon.png"), for: .normal)
        }
        
        if (quiz3Done == true && quiz3Avail == false)
        {
            buttonWeek3.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
            buttonWeek3.isEnabled = false
        } else {
            buttonWeek3.isEnabled = true
            buttonWeek3.setBackgroundImage(UIImage(named: "play-icon.png"), for: .normal)
        }
        
        if (quiz4Done == true && quiz4Avail == false)
        {
            buttonWeek4.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
            buttonWeek4.isEnabled = false
        } else {
            buttonWeek4.isEnabled = true
            buttonWeek4.setBackgroundImage(UIImage(named: "play-icon.png"), for: .normal)
        }
    }
    
    @IBAction func quiz1Btn(_ sender: Any) {
        quiz1Avail = false
        quiz1Done = true
        defaults.set(quiz1Done, forKey: "quiz1done")
        defaults.set(quiz1Avail, forKey: "quiz1avail")
    }
    @IBAction func quiz2Btn(_ sender: Any) {
        quiz2Avail = false
        quiz2Done = true
        defaults.set(quiz2Done, forKey: "quiz2done")
        defaults.set(quiz2Avail, forKey: "quiz2avail")
    }
    @IBAction func quiz3Btn(_ sender: Any) {
        quiz3Avail = false
        quiz3Done = true
        defaults.set(quiz3Done, forKey: "quiz3done")
        defaults.set(quiz3Avail, forKey: "quiz3avail")
    }
    @IBAction func quiz4Btn(_ sender: Any) {
        quiz4Avail = false
        quiz4Done = true
        defaults.set(quiz4Done, forKey: "quiz4done")
        defaults.set(quiz4Avail, forKey: "quiz4avail")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "week1Segue" {
            guard let langquiz = segue.destination as? quiz1 else {return}
            langquiz.langsetquiz1 = langQuiz
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
        }
        else if segue.identifier == "week2Segue"{
            guard let langquiz = segue.destination as? quiz3 else {return}
            langquiz.langsetquiz = langQuiz
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
        }
        else if segue.identifier == "week3Segue"{
            guard let langquiz = segue.destination as? quiz5 else {return}
            langquiz.langsetquiz = langQuiz
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
        }
        else if segue.identifier == "week4Segue"{
            guard let langquiz = segue.destination as? quiz8 else {return}
            langquiz.langsetquiz = langQuiz
            langquiz.PhoneNo = PhoneNo
            langquiz.EmailID = EmailID
        }
        
    }
    
    
    
}

