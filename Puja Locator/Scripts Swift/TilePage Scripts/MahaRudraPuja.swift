//
//  MahaRudraPuja.swift
//  Puja Locator
//
//  Created by Harmanjyot on 11/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class MahaRudraPuja: UIViewController {
    @IBOutlet weak var topHead: UILabel!
    @IBOutlet weak var lbl: UILabel!
    
        var langTile: Int!
        var langSettings: Int!
        override func viewDidLoad() {
            super.viewDidLoad()
            langTile = langSettings
            langSet(langTile: langTile)
        }
        
        func langSet(langTile: Int) {
            if (langTile == 0){
                changeLang(strLan: "en")
            }
            else if (langTile == 1) {
                changeLang(strLan: "hi")
            }
            else {
                changeLang(strLan: "mr-IN")
            }
            
        }
        
        func changeLang(strLan: String) {
            topHead.text = "headtitleMaharudraPuja".localizableString(loc: strLan)
            lbl.text = "comingSoonKey".localizableString(loc: strLan)
        }

}
