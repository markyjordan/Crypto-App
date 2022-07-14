//
//  TabBarController.swift
//  Crypto-App
//
//  Copyright © 2022 Marky Jordan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - View Controller Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Unhighlight unselected tab bar items.
        self.tabBar.unselectedItemTintColor = .darkGray
    }
}
