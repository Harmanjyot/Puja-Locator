//
//  ViewController.swift
//  Puja Locator
//
//  Created by Harmanjyot on 07/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var Password: UITextField! {
        didSet{
//            Password.setPadding()
            Password.setBottomBorder()
            Password.attributedPlaceholder = NSAttributedString(string: "Enter Name")
            Password.tintColor = UIColor.lightGray
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
    
    
    
    //THE LOGIN BUTTON
    
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


}

