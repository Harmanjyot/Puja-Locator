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
let week1Quiz = "July 01, 2019"
let week2Quiz = "July 08, 2019"
let week3Quiz = "July 15, 2019"
let week4Quiz = "July 22, 2019"

var quiz1Done: Bool!
var quiz1Avail: Bool!
var quiz1Enter: Bool!

var quiz2Done: Bool!
var quiz2Avail: Bool!
var quiz2Enter: Bool!

var quiz3Done: Bool!
var quiz3Avail: Bool!
var quiz3Enter: Bool!

var quiz4Done: Bool!
var quiz4Avail: Bool!
var quiz4Enter: Bool!

extension Date {
    func dateToString(style: DateFormatter.Style) -> String {
        df.dateStyle = style
        return df.string(from: self)
    }
}



class quizMainPage: UIViewController {

    @IBOutlet weak var buttonWeek1: UIButton!
    @IBOutlet weak var buttonWeek2: UIButton!
    @IBOutlet weak var buttonWeek3: UIButton!
    @IBOutlet weak var buttonWeek4: UIButton!
        
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTestConditions()
        setButtonStatus()
        
    }
    
    func getTestConditions() {
        let rightNowStr = rightNow.dateToString(style: .long)
        if rightNowStr == week1Quiz {
            quiz1Avail = true
        }
        else {
            quiz1Avail = false
            print("works")
        }
        
        if rightNowStr == week2Quiz {
            quiz2Avail = true
        }
        else {
            quiz2Avail = false
            print("works")
        }
        
        if rightNowStr == week3Quiz {
            quiz3Avail = true
        }
        else {
            quiz3Avail = false
            print("works")
        }
        
        if rightNowStr == week4Quiz {
            quiz4Avail = true
        }
        else {
            quiz4Avail = false
            print("works")
        }
    }
    
    func setButtonStatus(){
        if (quiz1Done == true || quiz1Avail == false)
        {
            buttonWeek1.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
        }
        
        if (quiz2Done == true || quiz2Avail == false)
        {
            buttonWeek2.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
        }
        
        if (quiz3Done == true || quiz3Avail == false)
        {
            buttonWeek3.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
        }
        
        if (quiz4Done == true || quiz4Avail == false)
        {
            buttonWeek4.setBackgroundImage(UIImage(named: "greyPlay-icon.png"), for: .normal)
        }
    }
    
    
    @IBAction func quiz1Btn(_ sender: Any) {
        quiz1Enter = true
        quiz1Avail = false
        quiz1Done = true
    }
    
    @IBAction func quiz2Btn(_ sender: Any) {
        quiz2Enter = true
        quiz2Avail = false
        quiz2Done = true
    }
    
    @IBAction func quiz3Btn(_ sender: Any) {
        quiz3Enter = true
        quiz3Avail = false
        quiz3Done = true
    }
    
    @IBAction func quiz4Btn(_ sender: Any) {
        quiz4Enter = true
        quiz4Avail = false
        quiz4Done = true
    }
    
}

