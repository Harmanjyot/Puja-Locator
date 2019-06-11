//
//  FAQ3.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension String {
    func localizableStringFAQ3(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

class FAQ3: UIViewController {

    @IBOutlet weak var q3Lbl: UILabel!
    @IBOutlet weak var a3Lbl: UILabel!
    
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
        q3Lbl.text = "faqQ3".localizableStringFAQ3(loc: strLan)
        a3Lbl.text = "faqA3".localizableStringFAQ3(loc: strLan)
        
    }
    
    
}
