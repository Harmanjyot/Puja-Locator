//
//  Q2.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension String {
    func localizableStringFAQans(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

class Q2: UIViewController {
    var langsettings: Int!
    var langAns: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        langAns = langsettings
        langSet(langAnsFAQ: langAns)
        
        // Do any additional setup after loading the view.
    }
    
    
    func langSet(langAnsFAQ: Int) {
        if (langAnsFAQ == 0){
            changeLang(strLan: "en")
        }
        else if (langAnsFAQ == 1) {
            changeLang(strLan: "hi")
        }
        else {
            changeLang(strLan: "mr-IN")
        }
        
    }
    
    func changeLang(strLan: String) {
        q1Lbl.text = "faqQ1".localizableStringMain(loc: strLan)
        a1Lbl.text = "faqA1".localizableStringMain(loc: strLan)
        
    }
    


}
