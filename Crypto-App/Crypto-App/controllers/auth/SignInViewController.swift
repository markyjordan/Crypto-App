//
//  SignInViewController.swift
//  Crypto-App
//
//  Copyright © 2022 Marky Jordan. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    private let welcomeBackLabel: UILabel = {
        let welcomeBackLabel = UILabel()
        welcomeBackLabel.text = "Welcome Back!"
        welcomeBackLabel.textAlignment = .left
        welcomeBackLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        welcomeBackLabel.textColor = .systemCyan
        return welcomeBackLabel
    }()
    
    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.textAlignment = .left
        emailLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        emailLabel.textColor = .systemCyan
        return emailLabel
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "user@example.com"
        emailTextField.font = .systemFont(ofSize: 14)
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.systemCyan.cgColor
        emailTextField.layer.cornerRadius = 5
        emailTextField.backgroundColor = .white
        emailTextField.setPadding()
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.returnKeyType = .continue
        return emailTextField
    }()
    
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.textAlignment = .left
        passwordLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        passwordLabel.textColor = .systemCyan
        return passwordLabel
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "pa55w0rd!"
        passwordTextField.font = .systemFont(ofSize: 14)
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.systemCyan.cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.backgroundColor = .white
        passwordTextField.setPadding()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.returnKeyType = .done
        return passwordTextField
    }()
    
    private let passwordVerificationLabel: UILabel = {
        let passwordVerificationLabel = UILabel()
//        passwordVerificationLabel.text = "Password doesn't meet minimum requirements."
        passwordVerificationLabel.textAlignment = .left
        passwordVerificationLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        passwordVerificationLabel.textColor = .white
        return passwordVerificationLabel
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.backgroundColor = .systemCyan
        signInButton.layer.cornerRadius = 5
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.setTitle("Sign-In", for: .normal)
        return signInButton
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let dontHaveAccountLabel = UILabel()
        dontHaveAccountLabel.text = "Don't have an account?"
        dontHaveAccountLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dontHaveAccountLabel.textColor = .white
        return dontHaveAccountLabel
    }()

    private let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        registerButton.setTitleColor(.systemCyan, for: .normal)
        return registerButton
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        return activityIndicatorView
    }()
    
    // Boolean flags to signal whether the text fields are empty.
    
    var emailTextFieldIsEmpty = true
    var passwordTextFieldIsEmpty = true
    
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Configure text field delegates.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Configure subviews.
        view.addSubview(welcomeBackLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordVerificationLabel)
        view.addSubview(signInButton)
        view.addSubview(dontHaveAccountLabel)
        view.addSubview(registerButton)
        view.addSubview(activityIndicatorView)
        
        // Configure button targets.
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcomeBackLabel.frame = CGRect(x: 20,
                                    y: 100,
                                    width: view.frame.size.width,
                                    height: 50)
        
        emailLabel.frame = CGRect(x: 20, y: welcomeBackLabel.frame.origin.y + welcomeBackLabel.frame.size.height + 20,
                                  width: view.frame.size.width - 40,
                                  height: 20)
        
        emailTextField.frame = CGRect(x: 20,
                                      y: emailLabel.frame.origin.y + emailLabel.frame.size.height + 5,
                                      width: view.frame.size.width - 40,
                                      height: 50)
        
        passwordLabel.frame = CGRect(x: 20,
                                     y: emailTextField.frame.origin.y + emailTextField.frame.size.height + 20,
                                     width: view.frame.size.width - 40,
                                     height: 20)
        
        passwordTextField.frame = CGRect(x: 20,
                                         y: passwordLabel.frame.origin.y + passwordLabel.frame.size.height + 5,
                                         width: view.frame.size.width - 40,
                                         height: 50)
        
        passwordVerificationLabel.frame = CGRect(x: 20, y: passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 5, width: view.frame.size.width - 40, height: 20)
        
        signInButton.frame = CGRect(x: 20,
                                    y: passwordVerificationLabel.frame.origin.y + passwordVerificationLabel.frame.size.height + 25,
                                    width: view.frame.size.width - 40,
                                    height: 50)
        
        dontHaveAccountLabel.frame = CGRect(x: 100,
                                            y: signInButton.frame.origin.y + signInButton.frame.size.height + 30,
                                            width: view.frame.size.width - 276,
                                            height: 20)
        
        registerButton.frame = CGRect(x: 246,
                                      y: signInButton.frame.origin.y + signInButton.frame.size.height + 30,
                                      width: view.frame.size.width - 324,
                                      height: 20)
        
        activityIndicatorView.frame = CGRect(x: 20,
                                      y: registerButton.frame.origin.y + registerButton.frame.size.height + 30,
                                      width: view.frame.size.width - 40,
                                      height: 50)
    }
    
    
    // MARK: - Helper Methods
    
    @objc
    private func didTapSignInButton() {
        setSigningInState(true)
        
        // Attempt to assign the text inside the email and password textfields to local variables.
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text, !email.isEmpty, !password.isEmpty
        else { return }
        
        // Attempt to authenticate user with the input email and password.
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            guard let strongSelf = self else {
                return
            }
            guard let result = authResult, error == nil else {
                print("ERROR Signing in user: \(error?.localizedDescription ?? "")")
                let alert = UIAlertController(title: "Sign-in Failed", message: error?.localizedDescription, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true, completion: nil)
                self?.setSigningInState(false)
                return
            }
            
            let user = result.user
            print("Signed-in User: \(user)")
            
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }
    
    @objc
    private func didTapRegisterButton() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func setSigningInState(_ signingIn: Bool) {
        if signingIn {
            DispatchQueue.main.async {
                self.activityIndicatorView.startAnimating()
                self.disableButton(false, button: self.signInButton)
            }
        }
        else {
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.disableButton(true, button: self.signInButton)
            }
        }
        
        // Enable/disable all UI view objects.
        DispatchQueue.main.async {
            self.emailTextField.isEnabled = !signingIn
            self.passwordTextField.isEnabled = !signingIn
            self.signInButton.isEnabled = !signingIn
            self.registerButton.isEnabled = !signingIn
        }
    }
    
    func handleSignInResponse(success: Bool, error: Error?) {
        setSigningInState(false)
        
        if success {
            DispatchQueue.main.async {
                let tabBarController = TabBarController()
                
                
            }
        }
    }
    
    
    // MARK: - UITextFieldDelegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            let inputText = emailTextField.text ?? ""
            
            guard let stringRange = Range(range, in: inputText) else { return false }
            
            let updatedText = inputText.replacingCharacters(in: stringRange, with: string)
            
            if updatedText.isEmpty && updatedText == "" {
                emailTextFieldIsEmpty = true
            }
            else {
                emailTextFieldIsEmpty = false
            }
        }
        
        if textField == passwordTextField {
            let inputText = passwordTextField.text ?? ""
            
            guard let stringRange = Range(range, in: inputText) else { return false }
            
            let updatedText = inputText.replacingCharacters(in: stringRange, with: string)
            
            if updatedText.isEmpty && updatedText == "" {
                passwordTextFieldIsEmpty = true
            } else {
                passwordTextFieldIsEmpty = false
            }
        }
        
        if emailTextFieldIsEmpty == false && passwordTextFieldIsEmpty == false {
            disableButton(true, button: signInButton)
        }
        else {
            disableButton(false, button: signInButton)
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        disableButton(false, button: signInButton)
        
        if textField == emailTextField {
            emailTextFieldIsEmpty = true
        }
        if textField == passwordTextField {
            passwordTextFieldIsEmpty = true
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Shift focus to the password textfield when the user hits the return key while in the email textfield.
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        // Automatically execute sign in attempt when the user hits the return key while in the password textfield.
        else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            didTapSignInButton()
        }
        
        return true
    }

}
