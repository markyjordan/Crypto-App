//
//  RegisterViewController.swift
//  Crypto-App
//
//  Copyright © 2022 Marky Jordan. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    private let registerLabel: UILabel = {
        let registerLabel = UILabel()
        registerLabel.text = "Create Account"
        registerLabel.textAlignment = .left
        registerLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        registerLabel.textColor = .systemCyan
        return registerLabel
    }()
    
    private let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        firstNameLabel.textAlignment = .left
        firstNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        firstNameLabel.textColor = .systemCyan
        return firstNameLabel
    }()
    
    private let firstNameTextField: UITextField = {
        let firstNameTextField = UITextField()
        firstNameTextField.placeholder = "Marky"
        firstNameTextField.font = .systemFont(ofSize: 14)
        firstNameTextField.layer.borderWidth = 2
        firstNameTextField.layer.borderColor = UIColor.systemCyan.cgColor
        firstNameTextField.layer.cornerRadius = 5
        firstNameTextField.backgroundColor = .white
        firstNameTextField.setPadding()
        firstNameTextField.autocorrectionType = .no
        firstNameTextField.autocapitalizationType = .none
        firstNameTextField.returnKeyType = .continue
        return firstNameTextField
    }()
    
    private let lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.text = "Last Name"
        lastNameLabel.textAlignment = .left
        lastNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        lastNameLabel.textColor = .systemCyan
        return lastNameLabel
    }()
    
    private let lastNameTextField: UITextField = {
        let lastNameTextField = UITextField()
        lastNameTextField.placeholder = "Jordan"
        lastNameTextField.font = .systemFont(ofSize: 14)
        lastNameTextField.layer.borderWidth = 2
        lastNameTextField.layer.borderColor = UIColor.systemCyan.cgColor
        lastNameTextField.layer.cornerRadius = 5
        lastNameTextField.backgroundColor = .white
        lastNameTextField.setPadding()
        lastNameTextField.autocorrectionType = .no
        lastNameTextField.autocapitalizationType = .none
        lastNameTextField.returnKeyType = .continue
        return lastNameTextField
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
    
    private let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.backgroundColor = .systemCyan
        registerButton.layer.cornerRadius = 5
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        return registerButton
    }()
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        return activityIndicatorView
    }()
    
    // Boolean flags to signal whether the text fields are empty.
    
    var firstNameTextFieldIsEmpty = true
    var lastNameTextFieldIsEmpty = true
    var emailTextFieldIsEmpty = true
    var passwordTextFieldIsEmpty = true
    
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        // Layout subviews.
//        view.addSubview(backToSignInButton)
        view.addSubview(registerLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameLabel)
        view.addSubview(lastNameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordVerificationLabel)
        view.addSubview(registerButton)
        view.addSubview(activityIndicatorView)
        
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        
        // Configure text field delegates.
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstNameTextField.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//
//        backToSignInButton.frame = CGRect(x: 20,
//                                          y: 50,
//                                          width: view.frame.size.width - 40,
//                                          height: 20)
        
        registerLabel.frame = CGRect(x: 20,
                                     y: 100,
                                     width: view.frame.size.width,
                                     height: 50)
        
        firstNameLabel.frame = CGRect(x: 20, y: registerLabel.frame.origin.y + registerLabel.frame.size.height + 20,
                                  width: view.frame.size.width - 40,
                                  height: 20)
        
        firstNameTextField.frame = CGRect(x: 20,
                                      y: firstNameLabel.frame.origin.y + firstNameLabel.frame.size.height + 5,
                                      width: view.frame.size.width - 40,
                                      height: 50)
        
        lastNameLabel.frame = CGRect(x: 20, y: firstNameTextField.frame.origin.y + firstNameTextField.frame.size.height + 20,
                                  width: view.frame.size.width - 40,
                                  height: 20)
        
        lastNameTextField.frame = CGRect(x: 20,
                                      y: lastNameLabel.frame.origin.y + lastNameLabel.frame.size.height + 5,
                                      width: view.frame.size.width - 40,
                                      height: 50)
        
        emailLabel.frame = CGRect(x: 20, y: lastNameTextField.frame.origin.y + lastNameTextField.frame.size.height + 20,
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
        
        registerButton.frame = CGRect(x: 20,
                                      y: passwordVerificationLabel.frame.origin.y + passwordVerificationLabel.frame.size.height + 25,
                                      width: view.frame.size.width - 40,
                                      height: 50)
        
        activityIndicatorView.frame = CGRect(x: 20,
                                      y: registerButton.frame.origin.y + registerButton.frame.size.height + 30,
                                      width: view.frame.size.width - 40,
                                      height: 50)
        
    }
    
    
    // MARK: - Helper Methods

    @objc
    private func didTapRegisterButton() {
        print("Register button tapped.")
        setRegisteringUserState(true)
        
        guard
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text, !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty
        else { return }
        
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exists in
            guard let strongSelf = self else {
                return
            }
            
            guard !exists else {
                strongSelf.alertUserSignIn(with: "Register failed. Account with that email already exists.")
                
                self?.setRegisteringUserState(false)
                
                return
            }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                
                guard authResult != nil, error == nil else {
                    print("Error registering user: \(error?.localizedDescription ?? "")")
                    self?.setRegisteringUserState(false)
                    return
                }
                
                let user = authResult?.user
                print("Registered User: \(String(describing: user))")
                
                DatabaseManager.shared.insertUser(with: CryptoAppUser(firstName: firstName,
                                                                      lastName: lastName, emailAddress: email))
                
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            })
        })
    }
    
    private func setRegisteringUserState(_ registeringUser: Bool) {
        if registeringUser {
            DispatchQueue.main.async {
                self.activityIndicatorView.startAnimating()
                self.disableButton(false, button: self.registerButton)
            }
        }
        else {
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.disableButton(true, button: self.registerButton)
            }
        }
        
        // Enable/disable all UI view objects.
        DispatchQueue.main.async {
            self.firstNameTextField.isEnabled = !registeringUser
            self.lastNameTextField.isEnabled = !registeringUser
            self.emailTextField.isEnabled = !registeringUser
            self.passwordTextField.isEnabled = !registeringUser
            self.registerButton.isEnabled = !registeringUser
        }
    }
    
    private func alertUserSignIn(with message: String) {
        let alert = UIAlertController(title: "Sign-in Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }

    
    // MARK: - UITextFieldDelegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNameTextField {
            let inputText = firstNameTextField.text ?? ""
            
            guard let stringRange = Range(range, in: inputText) else { return false }
            
            let updatedText = inputText.replacingCharacters(in: stringRange, with: string)
            
            if updatedText.isEmpty && updatedText == "" {
                firstNameTextFieldIsEmpty = true
            }
            else {
                firstNameTextFieldIsEmpty = false
            }
        }
        
        if textField == lastNameTextField {
            let inputText = lastNameTextField.text ?? ""
            
            guard let stringRange = Range(range, in: inputText) else { return false }
            
            let updatedText = inputText.replacingCharacters(in: stringRange, with: string)
            
            if updatedText.isEmpty && updatedText == "" {
                lastNameTextFieldIsEmpty = true
            }
            else {
                lastNameTextFieldIsEmpty = false
            }
        }
        
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
        
        if firstNameTextFieldIsEmpty == false, lastNameTextFieldIsEmpty == false, emailTextFieldIsEmpty == false, passwordTextFieldIsEmpty == false {
            disableButton(true, button: registerButton)
        }
        else {
            disableButton(false, button: registerButton)
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        disableButton(false, button: registerButton)
        
        if textField == firstNameTextField {
            firstNameTextFieldIsEmpty = true
        }
        if textField == lastNameTextField {
            lastNameTextFieldIsEmpty = true
        }
        if textField == emailTextField {
            emailTextFieldIsEmpty = true
        }
        if textField == passwordTextField {
            passwordTextFieldIsEmpty = true
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        }
        else if textField == lastNameTextField {
            emailTextField.becomeFirstResponder()
        }
        // Shift focus to the password textfield when the user hits the return key while in the email textfield.
        else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        // Automatically execute sign in attempt when the user hits the return key while in the password textfield.
        else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            didTapRegisterButton()
        }
        
        return true
    }
}
