//
//  FAQ5.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension String {
    func localizableStringFAQ5(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

class FAQ5: UIViewController {
    var langsettings: Int!
    var langAns: Int!
    @IBOutlet weak var q5Lbl: UILabel!
    @IBOutlet weak var a5Lbl: UILabel!
    
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
        q5Lbl.text = "faqQ5".localizableStringFAQ5(loc: strLan)
        a5Lbl.text = "faqA5".localizableStringFAQ5(loc: strLan)
        
    }

}
