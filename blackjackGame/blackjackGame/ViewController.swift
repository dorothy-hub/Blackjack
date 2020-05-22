//
//  ViewController.swift
//  blackjackGame
//
//  Created by Thuc Nguyen on 2020-05-13.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(identifier: "secondVC") as! SecondViewController
        present (vc, animated: true)
    }


}


