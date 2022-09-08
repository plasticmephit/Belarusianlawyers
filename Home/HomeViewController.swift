//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit
var flagPerehod: Int = 0
var lawyersGlobal: [[String]]=[]
var lawyersGlobalFilter: [[String]]=[]
var collegionssGlobal: [[String]]=[]
var consultsGlobal: [[String]]=[]

protocol TabBarPerehodDelegate: AnyObject
{
    func perehod()
}

class HomeViewController: UIViewController, TabBarPerehodDelegate {
    
    
    func perehod() {
        print("sscddf")
    }
    
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
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NSNotification.Name.connectivityStatus.rawValue),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotificationNetwork)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenNotify),
                                               name: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil)
        onlineLawyersTextLawyer.text = "адвокатов онлайн"
        onlineLawyersText.text = "0"
        lawyersGlobal = parseLawyersUserDefaults()
        consultsGlobal = parseConsultsUserDefaults()
        collegionssGlobal = parseCollegionUserDefaults()
        print(lawyersGlobal.count)
        loadLawyersConsultsAnd()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
    override func viewWillAppear(_ animated: Bool) {
        if flagPerehod == 1{
            flagPerehod = 0
            let detailVC = LawyerViewController()
            navigationController?.pushViewController(detailVC, animated: true)
            
        }
        print("aa")
    }
    func catchNotificationNetwork(notification:Notification) -> Void {
        loadLawyersConsultsAnd()
        print(NetworkMonitor.shared.isConnected)
        
    }
    func loadLawyersConsultsAnd(){
        
        let queue = DispatchQueue.global(qos: .utility)
      
            if lawyersGlobal.count > 10{
                
                queue.async{ [self] in
                    indexOnline.removeAll()
                    for i in 1...lawyersGlobal.count-1
                    {
                        if lawyersGlobal[i][29] == "да"
                        {
                            self.indexOnline.append(lawyersGlobal[i])
                        }
                    }
                    //            print(lawyersGlobal[885][19])
                    
                    
                }
            
        }
        if NetworkMonitor.shared.isConnected{
            queue.async{
                print("work")
                let kostil = parseLawyers()
                
                if kostil.count > 10
                {
                    lawyersGlobal = kostil
                    consultsGlobal = parseConsults()
                    collegionssGlobal = parseCollegion()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
                    self.indexOnline.removeAll()
                    for i in 0...lawyersGlobal.count-1
                    {
                        if lawyersGlobal[i][29] == "да"
                        {
                            self.indexOnline.append(lawyersGlobal[i])
                        }
                    }
                    DispatchQueue.main.async { [self] in
                       
                            onlineLawyersText.text = String(indexOnline.count)
                        }
                    //            print(lawyersGlobal[885][19])
                    
                }
            }
        }
        DispatchQueue.main.async { [self] in
            if NetworkMonitor.shared.isConnected{
                onlineLawyersText.text = String(indexOnline.count)
            }
            else{
                onlineLawyersText.text = "нет сети"
            }
        }
    }
}
