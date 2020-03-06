//
//  BlueViewController.swift
//  TDD_Coordinators
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController, BlueViewControllerProtocol {
    
    @IBOutlet weak var fruitTableView: UITableView!
    
    var blueVM: BlueScreenViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.accessibilityIdentifier = "blueVC"
        view.tag = ViewTag.blueVc.rawValue
        
        blueVM?.delegate = self
        fruitTableView.tableFooterView = UIView()
        fruitTableView.tag = ViewTag.blueVCTableView.rawValue
        fruitTableView.dataSource = self
        fruitTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fruitTableView.reloadData()
    }
    
    
    func didGetData() {
        DispatchQueue.main.async {
            self.fruitTableView.reloadData()
        }
    }
    
    func didGetError(message: String) {
        
    }
    
}

extension BlueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = blueVM else {return 0}
        return vm.numberOfRows(inSection: 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath)
        guard let vm = blueVM else {return cell}
        let stringToDisplay = vm.string(forRow: indexPath.row, inSection: indexPath.section)
        cell.textLabel?.textColor = .yellow
        cell.textLabel?.text = stringToDisplay
        return cell
    }
    
    
}
