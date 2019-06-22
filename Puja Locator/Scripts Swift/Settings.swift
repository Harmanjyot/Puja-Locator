//
//  Settings.swift
//  Puja Locator
//
//  Created by Harmanjyot on 10/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit


extension String {
    func localizableString(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}



extension UIButton {
    func buttonDesign(){
        
        self.layer.cornerRadius = 25
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5
    }
}

class Settings: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var selectionLbl: UILabel!
    @IBOutlet weak var settingsLbl: UILabel!
    @IBOutlet weak var enfBtn: UIButton!
    @IBOutlet weak var hindiBtn: UIButton!
    @IBOutlet weak var marathiBtn: UIButton!
    var lang : Int!

    
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
    
    //THE FOLLOWING AS THE BUTTON ACTION FUNCTIONS
    
    @IBAction func engSelected(_ sender: Any) {
        lang = 0
        self.changeLang(strLan: "en")
        setPreferences()
    }
    
    
    @IBAction func hindiSelected(_ sender: Any) {
        lang = 1
        self.changeLang(strLan: "hi")
        setPreferences()
    }
    
    
    @IBAction func marathiSelected(_ sender: Any) {
        lang = 2
        self.changeLang(strLan: "mr-IN")
        setPreferences()
    }
    
    //THE FOLLOWING IS TO CHANGE THE LANGUAGE
    
    func changeLang(strLan: String) {
        selectionLbl.text = "languageSelect".localizableString(loc: strLan)
        settingsLbl.text = "settingsKey".localizableString(loc: strLan)
        engBtnOut.setTitle("englishKey".localizableString(loc: strLan), for: .normal)
        hindiBtn.setTitle("hindiKey".localizableString(loc: strLan), for: .normal)
        marathiBtn.setTitle("marathiKey".localizableString(loc: strLan), for: .normal)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPreference()

        // Do any additional setup after loading the view.
    }
    
    func setPreferences(){
        defaults.set(lang, forKey: "langNumber")
    }
    
    func checkPreference(){
        lang = defaults.integer(forKey: "langNumber")
        if (lang == 0){
            changeLang(strLan: "en")
        }
        else if (lang == 1) {
            changeLang(strLan: "hi")
        }
        else {
            changeLang(strLan: "mr-IN")
        }
    }
    

}
