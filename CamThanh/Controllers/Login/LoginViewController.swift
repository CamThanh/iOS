//
//  LoginViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 8/30/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var loginLine: UIView!
    
    @IBOutlet weak var bltSIgnUp: UIButton!
    @IBOutlet weak var signUpLine: UIView!
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var signUpView: UIView!
    
    @IBOutlet weak var loginEmail: UIView!
    @IBOutlet weak var loginPassword: UIView!
    
    @IBOutlet weak var signUpEmail: UIView!
    @IBOutlet weak var btnLoginAction: UIButton!
    
    @IBOutlet weak var signUpConfirm: UIView!
    @IBOutlet weak var signUpPassword: UIView!
    @IBOutlet weak var loginViewExtra: UIView!
    
    @IBOutlet weak var btnSignUpAction: UIButton!
    @IBOutlet weak var signupViewExtra: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tfUserSignup: UITextField!
    
    @IBOutlet weak var tfConfirm: UITextField!
    @IBOutlet weak var tfPasswordSignup: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loginEmail.layer.cornerRadius = self.loginEmail.frame.size.height / 2
        self.loginEmail.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.loginEmail.layer.shadowColor = UIColor.black.cgColor
        self.loginEmail.layer.shadowRadius = 1
        self.loginEmail.layer.shadowOpacity = 0.25
        self.loginEmail.clipsToBounds = true
        self.loginEmail.layer.masksToBounds = false
        
        self.loginPassword.layer.cornerRadius = self.loginEmail.frame.size.height / 2
        self.loginPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.loginPassword.layer.shadowColor = UIColor.black.cgColor
        self.loginPassword.layer.shadowRadius = 1
        self.loginPassword.layer.shadowOpacity = 0.25
        self.loginPassword.clipsToBounds = true
        self.loginPassword.layer.masksToBounds = false
        
        self.btnLoginAction.layer.cornerRadius = self.loginEmail.frame.size.height / 2
        
        self.btnLoginAction.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.btnLoginAction.layer.shadowColor = UIColor.black.cgColor
        self.btnLoginAction.layer.shadowRadius = 1
        self.btnLoginAction.layer.shadowOpacity = 0.25
        self.btnLoginAction.clipsToBounds = true
        self.btnLoginAction.layer.masksToBounds = false
        
        
        self.signUpEmail.layer.cornerRadius = self.signUpEmail.frame.size.height / 2
        self.signUpEmail.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.signUpEmail.layer.shadowColor = UIColor.black.cgColor
        self.signUpEmail.layer.shadowRadius = 1
        self.signUpEmail.layer.shadowOpacity = 0.25
        self.signUpEmail.clipsToBounds = true
        self.signUpEmail.layer.masksToBounds = false
        
        self.signUpPassword.layer.cornerRadius = self.signUpPassword.frame.size.height / 2
        self.signUpPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.signUpPassword.layer.shadowColor = UIColor.black.cgColor
        self.signUpPassword.layer.shadowRadius = 1
        self.signUpPassword.layer.shadowOpacity = 0.25
        self.signUpPassword.clipsToBounds = true
        self.signUpPassword.layer.masksToBounds = false
        
        self.signUpConfirm.layer.cornerRadius = self.signUpConfirm.frame.size.height / 2
        self.signUpConfirm.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.signUpConfirm.layer.shadowColor = UIColor.black.cgColor
        self.signUpConfirm.layer.shadowRadius = 1
        self.signUpConfirm.layer.shadowOpacity = 0.25
        self.signUpConfirm.clipsToBounds = true
        self.signUpConfirm.layer.masksToBounds = false
        
        self.btnSignUpAction.layer.cornerRadius = self.btnSignUpAction.frame.size.height / 2
        self.btnSignUpAction.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.btnSignUpAction.layer.shadowColor = UIColor.black.cgColor
        self.btnSignUpAction.layer.shadowRadius = 1
        self.btnSignUpAction.layer.shadowOpacity = 0.25
        self.btnSignUpAction.clipsToBounds = true
        self.btnSignUpAction.layer.masksToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    //MARK: - actions
    
    @IBAction func didTapLogin(_ sender: Any) {
        self.hideAllKBs()
        self.showHideLoginForm(show: true)
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        self.hideAllKBs()
        self.showHideLoginForm(show: false)
    }
    
    func showHideLoginForm(show:Bool) {
        
        if show {
            self.loginLine.isHidden = false
            self.signUpLine.isHidden = true
            
            self.loginView.isHidden = false
            self.signUpView.isHidden = true
            self.loginViewExtra.isHidden = false
            self.signupViewExtra.isHidden = true
        }else{
            self.loginLine.isHidden = true
            self.signUpLine.isHidden = false
            
            self.loginView.isHidden = true
            self.signUpView.isHidden = false
            self.loginViewExtra.isHidden = true
            self.signupViewExtra.isHidden = false
        }
    }
    
    func hideAllKBs() {
        
        self.tfUsername.resignFirstResponder()
        self.tfPassword.resignFirstResponder()
        self.tfUserSignup.resignFirstResponder()
        self.tfPasswordSignup.resignFirstResponder()
        self.tfConfirm.resignFirstResponder()
        
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height - 40
        self.scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
}


