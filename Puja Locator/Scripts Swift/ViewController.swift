//
//  ViewController.swift
//  Puja Locator
//
//  Created by Harmanjyot on 07/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit


let defaults = UserDefaults.standard
var userSetToiPhone: Bool?
var textname: String?
var textemail: String?
var textmobile: String?
var textcity: String?
extension UITextField {
//    func setPadding() {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: self.frame.height))
//        self.leftView = paddingView
//
//    }
    
    func setBottomBorder() {
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 0
        self.backgroundColor = .clear
    }
    
//    func setIcon(image: UIImage) {
//        let iconView = UIImageView(frame: CGRect(x: 5, y: -7, width: 40, height: 40))
//        iconView.image = image
//        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 40))
//        iconContainerView.addSubview(iconView)
//        self.leftView = iconContainerView
//        self.leftViewMode = .always
//    }
    
}
class ViewController: UIViewController {
    


    @IBOutlet weak var EmailID: UITextField! {
        didSet{
//            EmailID.setPadding()
            EmailID.setBottomBorder()
            EmailID.attributedPlaceholder = NSAttributedString(string: "Enter Email ID")
            EmailID.tintColor = UIColor.lightGray
//            EmailID.setIcon(image: #imageLiteral(resourceName: "email icon-2"))
        }
    }
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    @IBOutlet weak var Name: UITextField!{
        didSet{
            //            Password.setPadding()
            Name.setBottomBorder()
            Name.attributedPlaceholder = NSAttributedString(string: "Enter Name")
            Name.tintColor = UIColor.lightGray
            Name.textColor = UIColor.black
            //            Password.setIcon(image: #imageLiteral(resourceName: "password icon-2"))
            
        }
    }
    
    @IBOutlet weak var mobiNum: UITextField!{
        didSet {
            mobiNum.setBottomBorder()
            mobiNum.attributedPlaceholder = NSAttributedString(string: "Enter Mobile Number")
            mobiNum.tintColor = UIColor.lightGray
        }
    }
    
    @IBOutlet weak var cityLbl: UITextField!{
        
        didSet {
            cityLbl.setBottomBorder()
            cityLbl.attributedPlaceholder = NSAttributedString(string: "Enter City")
            cityLbl.tintColor = UIColor.lightGray
        }
    }
    
   
    @IBOutlet weak var logBtn: UIButton!{
        didSet {
            logBtn.layer.shadowColor = UIColor.black.cgColor
            logBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
            logBtn.layer.masksToBounds = false
            logBtn.layer.shadowRadius = 5.0
            logBtn.layer.shadowOpacity = 0.5
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userSetToiPhone = defaults.bool(forKey: "userSetToiPhone")
        if userSetToiPhone == true {
            textname = defaults.string(forKey: "textname")
            textemail = defaults.string(forKey: "textemail")
            textmobile = defaults.string(forKey: "textmobile")
            textcity = defaults.string(forKey: "textcity")

            Name.text = textname
            EmailID.text = textemail
            mobiNum.text = textmobile
            cityLbl.text = textcity
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if userSetToiPhone == true {
            performSegue(withIdentifier: "toMainPage", sender: nil)
        }

    }

    @IBAction func submitAction(_ sender: Any) {
        if((Name.text?.isEmpty)! || (EmailID.text?.isEmpty)! || (mobiNum.text?.isEmpty)! || (cityLbl.text?.isEmpty)!){
            
            let alertController = UIAlertController(title: "Incomplete Information", message: "Please fill all the required fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            textname = Name.text
            textemail = EmailID.text
            textmobile = mobiNum.text
            textcity = cityLbl.text
            userSetToiPhone = true
            
            defaults.set(textname, forKey: "textname")
            defaults.set(textemail, forKey: "textemail")
            defaults.set(textmobile, forKey: "textmobile")
            defaults.set(textcity, forKey: "textcity")
            defaults.set(userSetToiPhone, forKey: "userSetToiPhone")
            
            let url = URL(string: "http://localhost/Puja%20Locator/register.php")
            var request = URLRequest(url: url!)
            print(url)
            request.httpMethod = "POST"
            let body = "name=\(textname!)&emailID=\(textemail!)&phoneNo=\(textmobile!)&city=\(textcity!)"
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
            
            performSegue(withIdentifier: "toMainPage", sender: nil)
            }
        }
        
    }
    


