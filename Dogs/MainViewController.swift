//
//  MainViewController.swift
//  Dogs
//
//  Created by steve on 2018-07-11.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var dataManager: DataManager!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let addVC = segue.destination as? AddViewController {
      addVC.dataManager = dataManager
    }
  }
   
}

extension MainViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
    return dataManager.dogCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
    // fetch data
    let dog = dataManager.dog(at: indexPath)
    // display data
    
    cell.textLabel?.text = dog.name
    
    return cell
  }
  
}
