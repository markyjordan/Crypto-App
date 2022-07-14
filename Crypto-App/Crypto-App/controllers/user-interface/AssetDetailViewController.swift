//
//  AssetDetailViewController.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/13/22.
//

import UIKit

class AssetDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapSave(_ sender: Any) {
        alertSaveCrypto(with: "Are you sure you want to save a new token?")
    }
    
    private func alertSaveCrypto(with message: String) {
        let alert = UIAlertController(title: "Confirm Add Token", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true, completion: nil)
        
        let 
    }
}

