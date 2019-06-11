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
        guard let langset = segue.destination as? FAQs else{return}
        langset.langSettings = langMain
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
