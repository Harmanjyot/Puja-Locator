//
//  FAQ9.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class FAQ9: UIViewController {
    var langsettings: Int!
    var langAns: Int!
    @IBOutlet weak var q9Lbl: UILabel!
    @IBOutlet weak var a9Lbl: UILabel!
    
    
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
        q9Lbl.text = "faqQ9".localizableStringFAQ2(loc: strLan)
        a9Lbl.text = "faqA9".localizableStringFAQ2(loc: strLan)
        
    }
    

}
