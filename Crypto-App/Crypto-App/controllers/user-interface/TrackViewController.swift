//
//  TrackViewController.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/12/22.
//

import UIKit

class TrackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Crypto Market"
        
        
        // Configure the table view.
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Table View Delegate and Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        
        cell.textLabel?.text = "Crypto"
        return cell
    }

}
