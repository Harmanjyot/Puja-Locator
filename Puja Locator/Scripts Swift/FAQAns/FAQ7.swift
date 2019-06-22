//
//  FAQ7.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class FAQ7: UIViewController {

    var langsettings: Int!
    var langAns: Int!

    @IBOutlet weak var q7Lbl: UILabel!
    @IBOutlet weak var a7Lbl: UILabel!
    
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
        q7Lbl.text = "faqQ7".localizableStringFAQ2(loc: strLan)
        a7Lbl.text = "faqA7".localizableStringFAQ2(loc: strLan)
        
    }
    

}
