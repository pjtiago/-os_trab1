//
//  ViewController.swift
//  trabalho1_ios
//
//  Created by Joao Viana on 5/11/17.
//  Copyright © 2017 pjota.joaoviana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var btn1: UIButton!
    
    @IBAction func btn1Action(_ sender: Any) {
        self.performSegue(withIdentifier: "segue1", sender: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

