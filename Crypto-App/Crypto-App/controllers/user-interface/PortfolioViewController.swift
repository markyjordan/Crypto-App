//
//  PortfolioViewController.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/12/22.
//

import UIKit
import FirebaseAuth

class PortfolioViewController: UIViewController {
    
    // MARK: - Properties
    
//    let ref = Database.database().reference(withPath: "portfolio-assets")
//    var refObservers: [DatabaseHandle] = []
    
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    // MARK: - Helper Methods
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let signInVC = SignInViewController()
            let navController = UINavigationController(rootViewController: signInVC)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: false)
        }
    }
    
    // Connect to Firebase.


    
    
    
    // Add cryto asset.
    private func didTapAddAsset() {
        
    }
}
