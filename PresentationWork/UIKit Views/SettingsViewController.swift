//
//  SettingsViewController.swift
//  PresentationWork
//
//  Created by Moiz Amjad on 05/01/2024.
//

import UIKit
import SwiftUI

class SettingsViewController: UIViewController {
//    var didSelectRowCallback: (() -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
        // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
        // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
            // set the text from the data model
        cell.cellLabel.text = indexPath.row == 0 ? "View Profile" : "Switch to tab 1 Root"
        
        return cell
    }
    
        // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        if indexPath.row == 0 {
            self.present(UIHostingController(rootView: Profile()),animated: true)
        }
        else{ //tabbar
//            dismiss(animated: true, completion: nil)
        }
    }
}

