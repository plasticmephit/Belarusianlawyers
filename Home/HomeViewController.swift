//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit

class HomeViewController: UIViewController {
   
   

    let menuView = UIView()
   
    let lawyers = UIButton()
    let lawyersText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let otrasli = UIButton()
    let otrasliText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    let kollegii = UIButton()
    let kollegiiText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    let brka = UIButton()
    let brkaText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeViewController()
        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
        queueConc.async {
            alawyers = parseLawyers()
            print(alawyers[2][20])
        }
       
        // Do any additional setup after loading the view.
    }

}
