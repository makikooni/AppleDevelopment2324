//
//  ViewController.swift
//  twoButtons
//
//  Created by Felice Leighton on 08/11/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func resetTextButtonTapped(_ sender: Any) {
        label.text = " "
    }
    @IBAction func setTextButtonTapped(_ sender: Any) {
        label.text = textField.text
    }
}

