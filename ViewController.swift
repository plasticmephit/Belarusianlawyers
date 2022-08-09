//
//  ViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit
import CSV
class ViewController: UIViewController {
var lawyers:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      lawyers = parseLawyers()
        DispatchQueue.main.asyncAfter(deadline: .now()+7) {
            print(self.lawyers)
        }
        print(lawyers)
        
    }
    
    
}
