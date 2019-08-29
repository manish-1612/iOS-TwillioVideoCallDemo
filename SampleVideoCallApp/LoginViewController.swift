//
//  LoginViewController.swift
//  SampleVideoCallApp
//
//  Created by Manish Kumar on 18/12/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

typealias GetTokenCompletionBlock = (_ response: DataResponse<GetTokenResponse>) -> Void

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var roomNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getAccessToken(_ sender: UIButton) {
        
        let name = nameTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let roomName = roomNameTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        guard let userName = name else{
            self.showAlertWith(title: "Error", description: "Please enter name to continue", cancelButtonTitle: "Okay")
            return
        }
        
        guard let chatRoomName = roomName else{
            self.showAlertWith(title: "Error", description: "Please enter room name to continue", cancelButtonTitle: "Okay")
            return
        }

        if userName.count == 0{
            self.showAlertWith(title: "Error", description: "Please enter name to continue", cancelButtonTitle: "Okay")
            return
        }
        
        if chatRoomName.count == 0{
            self.showAlertWith(title: "Error", description: "Please enter room name to continue", cancelButtonTitle: "Okay")
            return
        }
        
        let apiUrl = "http://192.168.0.33:3000/get-accesstoken?name=\(userName)&room=\(chatRoomName)"
        
        

    }
    

    
    func showAlertWith(title: String, description: String, cancelButtonTitle: String){
        
        let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertControllerStyle.alert)
        
        let actionButton = UIAlertAction(title: cancelButtonTitle, style: UIAlertActionStyle.cancel) { (action) in
            //do nothing
        }

        alert.addAction(actionButton)
        self.present(alert, animated: true, completion: nil)
    }
}
