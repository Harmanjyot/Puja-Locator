//
//  requestPage.swift
//  Puja Locator
//
//  Created by Harmanjyot on 27/07/19.
//  Copyright © 2019 Harmanjyot. All rights reserved.
//

import UIKit


var textReqname: String?
var textarea: String?
var textReqmobile: String?
var textvenue: String?
var textDate: String?
var textPuja: String?

class requestPage: UIViewController {
    @IBOutlet weak var dateTextUI: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var area: UITextField!
    @IBOutlet weak var venue: UITextField!
    @IBOutlet weak var mobiNo: UITextField!

    @IBOutlet weak var pujaText: UITextField!
    
   let pujaList = ["Rudra Puja", "Poohja"]
    private var datePicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPujaPicker()
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(self.dateTimeChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(gestureRecognizer:)))

        view.addGestureRecognizer(tapGesture)
        dateTextUI.inputView = datePicker
    }
    
    func createPujaPicker() {
        let pujaPicker = UIPickerView()
        pujaPicker.delegate = self as! UIPickerViewDelegate
        pujaText.inputView = pujaPicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateTimeChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YYYY HH:MM"
        dateTextUI.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    
    
    @IBAction func submitbTN(_ sender: Any) {
        if((name.text?.isEmpty)! || (area.text?.isEmpty)! || (mobiNo.text?.isEmpty)! || (venue.text?.isEmpty)! || (dateTextUI.text?.isEmpty)! || (pujaText.text?.isEmpty)!){
            
            let alertController = UIAlertController(title: "Incomplete Information", message: "Please fill all the required fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            textReqname = name.text
            textarea = area.text
            textReqmobile = mobiNo.text
            textvenue = venue.text
            textDate = dateTextUI.text
            textPuja = pujaText.text
            
            defaults.set(textReqname, forKey: "textReqname")
            defaults.set(textarea, forKey: "textarea")
            defaults.set(textReqmobile, forKey: "textReqmobile")
            defaults.set(textvenue, forKey: "textvenue")
            defaults.set(textDate, forKey: "textDate")
            defaults.set(textPuja, forKey: "textPuja")
            
            let url = URL(string: "http://localhost/Puja%20Locator/register.php")
            var request = URLRequest(url: url!)
            print(url)
            request.httpMethod = "POST"
            let body = "name=\(textReqname!)&emailID=\(textarea!)&phoneNo=\(textReqmobile!)&city=\(textvenue!)"
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
    
}

extension requestPage: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pujaList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pujaList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedPuja = pujaList[row]
        pujaText.text = selectedPuja
    }

}
