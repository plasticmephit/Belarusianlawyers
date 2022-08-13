//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit

var lawyersGlobal: [[String]]=[]
class HomeViewController: UIViewController {
    
 
    let menuView = UIView()
    
    let lawyersBut = UIButton()
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenNotify),
                                               name: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil)
        
        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
        queueConc.async {
            lawyersGlobal = parseLawyers()
          
            print(lawyersGlobal.count)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
        }
        // Do any additional setup after loading the view.
    }
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
}
