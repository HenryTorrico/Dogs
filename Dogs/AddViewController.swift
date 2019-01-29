//
//  AddViewController.swift
//  Dogs
//
//  Created by steve on 2018-07-11.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var colorTextField: UITextField!
  
  var dataManager: DataManager!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    guard let name = nameTextField.text,
     let age = ageTextField.text,
      let color = colorTextField.text, let ageInt = Int16(age) else { return }
    dataManager.createDog(with: name, age: ageInt, color: color)
    navigationController?.popViewController(animated: true)
  }
}
