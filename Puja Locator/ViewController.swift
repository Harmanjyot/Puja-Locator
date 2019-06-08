//
//  ViewController.swift
//  Puja Locator
//
//  Created by Harmanjyot on 07/06/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit

extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: self.frame.height))
        self.leftView = paddingView
        
    }
    
    func setBottomBorder() {
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.attributedPlaceholder = NSAttributedString(string: "Email ID", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
    
    func setIcon(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 5, y: -7, width: 40, height: 40))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)
        self.leftView = iconContainerView
        self.leftViewMode = .always
    }
    
}
class ViewController: UIViewController {

    @IBOutlet weak var EmailID: UITextField! {
        didSet{
            EmailID.setPadding()
            EmailID.setBottomBorder()
            EmailID.tintColor = UIColor.lightGray
            EmailID.setIcon(image: #imageLiteral(resourceName: "email icon-2"))
        }
    }
    
    
    @IBOutlet weak var Password: UITextField! {
        didSet{
            Password.setPadding()
            Password.setBottomBorder()
            Password.tintColor = UIColor.lightGray
            Password.setIcon(image: #imageLiteral(resourceName: "request icon"))
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


}

