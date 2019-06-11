//
//  FAQ8.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class FAQ8: UIViewController {
    var langsettings: Int!
    var langAns: Int!

    @IBOutlet weak var q8Lbl: UILabel!
    @IBOutlet weak var a8Lbl: UILabel!
    
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
        q8Lbl.text = "faqQ8".localizableStringFAQ2(loc: strLan)
        a8Lbl.text = "faqA8".localizableStringFAQ2(loc: strLan)
        
    }
    

}
