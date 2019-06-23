//
//  endQuiz2.swift
//  Puja Locator
//
//  Created by Harmanjyot on 22/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

class endQuiz2: UIViewController {

    var langsetquiz: Int!
    var PhoneNo: String!
    var EmailID: String!
    var score: Int!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var b1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langSet(langFAQ: langsetquiz)
        self.sendToDB()
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
        l1.text = "".localizableString(loc: strLan)
        l2.text = "".localizableString(loc: strLan)
        b1.setTitle("faqQ1".localizableStringFAQ(loc: strLan), for: .normal)
    }
    
    func sendToDB() {
        print(PhoneNo)
        print(score)
        let url = URL(string: "http://localhost/Puja%20Locator/week2Quiz.php")
        var request = URLRequest(url: url!)
        print(url)
        request.httpMethod = "POST"
        let body = "week2Score=\(score!)&emailID=\(EmailID!)&phoneNo=\(PhoneNo!)"
        request.httpBody = body.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                        
                        guard let parseJSON = json else {
                            print("error while parsing")
                            return
                        }
                        
                        let id = parseJSON["id"]
                        if id != nil {
                            print(parseJSON)
                        }
                        
                    } catch {
                        print("Caught error:\(error)")
                    }
                }
            } else{
                print("error:\(error)")
            }
        }).resume()
        
        
    }


}
