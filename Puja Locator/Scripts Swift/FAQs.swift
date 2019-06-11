//
//  FAQs.swift
//  Puja Locator
//
//  Created by Harmanjyot on 08/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension String {
    func localizableStringFAQ(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}


class FAQs: UIViewController {
    
    //INITIALIZING VALIABLES
    var langFAQ: Int!
    var langSettings: Int!
    
    
    @IBOutlet weak var q1Lbl: UIButton!
    @IBOutlet weak var q2Lbl: UIButton!
    @IBOutlet weak var q3Lbl: UIButton!
    @IBOutlet weak var q4Lbl: UIButton!
    @IBOutlet weak var q5Lbl: UIButton!
    @IBOutlet weak var q6Lbl: UIButton!
    @IBOutlet weak var q7Lbl: UIButton!
    @IBOutlet weak var q8Lbl: UIButton!
    @IBOutlet weak var q9Lbl: UIButton!
    @IBOutlet weak var q10Lbl: UIButton!
    @IBOutlet weak var q11Lbl: UIButton!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueQ1"{
            guard let langset = segue.destination as? ansFAQs else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ2" {
            guard let langset = segue.destination as? FAQ2 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ3" {
            guard let langset = segue.destination as? FAQ3 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ4" {
            guard let langset = segue.destination as? FAQ4 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ5" {
            guard let langset = segue.destination as? FAQ5 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ6" {
            guard let langset = segue.destination as? FAQ6 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ7" {
            guard let langset = segue.destination as? FAQ7 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ8" {
            guard let langset = segue.destination as? FAQ8 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ9" {
            guard let langset = segue.destination as? FAQ9 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ10" {
            guard let langset = segue.destination as? FAQ10 else{return}
            langset.langsettings = langFAQ
        }
        else if segue.identifier == "segueQ11" {
            guard let langset = segue.destination as? FAQ11 else{return}
            langset.langsettings = langFAQ
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langFAQ = langSettings
        langSet(langFAQ: langFAQ)
        
        
        // Do any additional setup after loading the view.
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
        q1Lbl.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
        q2Lbl.setTitle("faqQ2".localizableStringFAQ(loc: strLan), for: .normal)
        q3Lbl.setTitle("faqQ3".localizableStringFAQ(loc: strLan), for: .normal)
        q11Lbl.setTitle("faqQ11".localizableStringFAQ(loc: strLan), for: .normal)
        q4Lbl.setTitle("faqQ4".localizableStringFAQ(loc: strLan), for: .normal)
        q5Lbl.setTitle("faqQ5".localizableStringFAQ(loc: strLan), for: .normal)
        q6Lbl.setTitle("faqQ6".localizableStringFAQ(loc: strLan), for: .normal)
        q7Lbl.setTitle("faqQ7".localizableStringFAQ(loc: strLan), for: .normal)
        q8Lbl.setTitle("faqQ8".localizableStringFAQ(loc: strLan), for: .normal)
        q9Lbl.setTitle("faqQ9".localizableStringFAQ(loc: strLan), for: .normal)
        q10Lbl.setTitle("faqQ10".localizableStringFAQ(loc: strLan), for: .normal)
    }
    
    
    @IBAction func unwindToFAQ(_ sender: UIStoryboardSegue) {}
    
    

}
