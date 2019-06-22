//
//  FAQ2.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit
extension String {
    func localizableStringFAQ2(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

class FAQ2: UIViewController {
    var langsettings: Int!
    var langAns: Int!
    @IBOutlet weak var q2Lbl: UILabel!
    @IBOutlet weak var a2Lbl: UILabel!
    
    
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
        q2Lbl.text = "faqQ2".localizableStringFAQ2(loc: strLan)
        a2Lbl.text = "faqA2".localizableStringFAQ2(loc: strLan)
        
    }
    
    


}
