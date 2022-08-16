//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit

var lawyersGlobal: [[String]]=[]
class HomeViewController: UIViewController {
    var online:Int = 0
    var indexOnline:[[String]] = []
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
        
        let queueConc = OperationQueue()
        queueConc.maxConcurrentOperationCount = 1
        if parseLawyersUserDefaults().count > 1{
                print(11)

                lawyersGlobal = parseLawyersUserDefaults()
            print(lawyersGlobal.count)
        }
        queueConc.addOperation{
          
            print(12)
            let kostil = parseLawyers()
            if lawyersGlobal.count < 10
            {
                lawyersGlobal = kostil
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
            }
           
        }
        queueConc.addOperation {
            print(13)
            for i in 1...lawyersGlobal.count-1
            {
                if lawyersGlobal[i][29] == "да"
                {
                    self.indexOnline.append(lawyersGlobal[i])
                }
            }
            //            print(lawyersGlobal[885][19])
            print(self.indexOnline.count)
        }
        // Do any additional setup after loading the view.
    }
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
}
