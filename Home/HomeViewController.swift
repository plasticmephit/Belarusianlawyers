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
    var lawyers:[Lawyers] = []
    
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
    let onlineLawyers = UIButton()
    var onlineLawyersText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        return label
    }()
    var onlineLawyersTextLawyer : UILabel = {
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
        onlineLawyersTextLawyer.text = "адвокатов онлайн"
        DispatchQueue.main.async {
            self.onlineLawyersText.text = "0"
        }
        let queueConc = OperationQueue()
        
        if parseLawyersUserDefaults().count > 1{
            print(11)
            
            lawyersGlobal = parseLawyersUserDefaults()
            print(lawyersGlobal.count)
        }
        if lawyersGlobal.count < 10{
            queueConc.maxConcurrentOperationCount = 1
        }
        queueConc.addOperation{
            
            
            let kostil = parseLawyers()
            if lawyersGlobal.count < 10
            {
                lawyersGlobal = kostil
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
               
            }
            print(12)
        }
        queueConc.addOperation { [self] in
            print(13)
            for i in 1...lawyersGlobal.count-1
            {
                if lawyersGlobal[i][29] == "да"
                {
                    self.indexOnline.append(lawyersGlobal[i])
                }
            }
            //            print(lawyersGlobal[885][19])
            DispatchQueue.main.async {
                self.onlineLawyersText.text = String(self.indexOnline.count)
                
            }
            print(self.indexOnline.count)
            

        }
        // Do any additional setup after loading the view.
    }
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
}
