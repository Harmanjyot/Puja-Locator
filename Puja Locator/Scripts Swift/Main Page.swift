//
//  Main Page.swift
//  Puja Locator
//
//  Created by Harmanjyot on 08/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension String {
    func localizableStringMain(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

class Main_Page: UIViewController {
    
    //INITIALIZING VALIABLES
    let defaults = UserDefaults.standard
    var langMain: Int!
    var EmailID: String!
    var PhoneNo: String!
    @IBOutlet weak var topHead: UILabel!
    @IBOutlet weak var stripLbl: UILabel!
    @IBOutlet weak var quizLbl: UIButton!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langMain = defaults.integer(forKey: "langNumberMain")
        if (langMain == 0){
            changeLang(strLan: "en")
        }
        else if (langMain == 1) {
            changeLang(strLan: "hi")
        }
        else {
            changeLang(strLan: "mr-IN")
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFAQ" {
            guard let langset = segue.destination as? FAQs else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "toQuizPage" {
            guard let quizPage = segue.destination as? quizMainPage else { return }
            quizPage.langSettings = langMain
            quizPage.EmailID = EmailID
            quizPage.PhoneNo = PhoneNo
        }
            
        else if segue.identifier == "t1" {
            guard let langset = segue.destination as? RudraPuja else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t2" {
            guard let langset = segue.destination as? DakshinamurtiPuja else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t3" {
            guard let langset = segue.destination as? GaneshHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t4" {
            guard let langset = segue.destination as? DurgaHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t5" {
            guard let langset = segue.destination as? NavchandiHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t6" {
            guard let langset = segue.destination as? Upanayan else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t7" {
            guard let langset = segue.destination as? DhanvantariHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t8" {
            guard let langset = segue.destination as? VidyarambhamSanskar else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t9" {
            guard let langset = segue.destination as? ChandiHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t10" {
            guard let langset = segue.destination as? MahaGanapati else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t11" {
            guard let langset = segue.destination as? KalashSthapana else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t12" {
            guard let langset = segue.destination as? MahalaxmiHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t13" {
            guard let langset = segue.destination as? MahaRudraPuja else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t14" {
            guard let langset = segue.destination as? NavagrahaHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t15" {
            guard let langset = segue.destination as? SudharshanHoma else{return}
            langset.langSettings = langMain
        }
        else if segue.identifier == "t16" {
            guard let langset = segue.destination as? VaastuShantiHoma else{return}
            langset.langSettings = langMain
        }
        

    }
    
    
    @IBAction func unwindToMainPage(_ sender: UIStoryboardSegue){}
    
    
    //THE FOLLOWING TWO FUNCTIONS IS FOR LANGUAGE AND UNWINDING WITH DATA FROM SETTINGS
    
    @IBAction func unwindFromSettings(_ sender: UIStoryboardSegue){
        guard let langSettings = sender.source as? Settings else {return}
        langMain = langSettings.lang
        if (langMain == 0){
            changeLang(strLan: "en")
            setPreferences()
        }
        else if (langMain == 1) {
            changeLang(strLan: "hi")
            setPreferences()
        }
        else {
            changeLang(strLan: "mr-IN")
            setPreferences()
        }
    }
    func changeLang(strLan: String) {
        topHead.text = "mainHead".localizableStringMain(loc: strLan)
        stripLbl.text = "mainpgLabl".localizableStringMain(loc: strLan)
        quizLbl.setTitle("quizMainpg".localizableStringMain(loc: strLan), for: .normal)
    }
    
    func setPreferences(){
        defaults.set(langMain, forKey: "langNumberMain")
    }
    

}
