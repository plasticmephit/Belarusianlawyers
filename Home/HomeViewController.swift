//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//
let myNotificationKey = "com.bobthedeveloper.notificationKey"
let myNotificationKey2 = "com.bobthedeveloper.notificationKey2"
let myNotificationKeyNetwork = "com.bobthedeveloper.notificationKey23"
let myNotificationKeyCollegion = "com.bobthedeveloper.notificationKey234"
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
//        print("sscddf")
    }
    
    var online:Int = 0
    var indexOnline:[[String]] = []
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    let lawyersBut = UIButton()
    let lawyersText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/43)
        return label
    }()
    
    let otrasli = UIButton()
    let otrasliText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/43)
        return label
    }()
    let kollegii = UIButton()
    let kollegiiText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/43)
        return label
    }()
    let brka = UIButton()
    let brkaText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/43)
        return label
    }()
    let onlineLawyers = UIButton()
    var onlineLawyersText : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/8.5)
        return label
    }()
    var onlineLawyersTextLawyer : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/50)
        return label
    }()
    let potokzagr = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")!


        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")!

        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        setupHomeViewController()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NSNotification.Name.connectivityStatus.rawValue),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotificationNetwork)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenNotify),
                                               name: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenCollegionDownloaded),
                                               name: NSNotification.Name(rawValue: myNotificationKeyCollegion),
                                               object: nil)
        onlineLawyersTextLawyer.text = "адвокатов онлайн"
        onlineLawyersText.text = "0"
//        defaults.removeObject(forKey: "lawyersGlobal")
        lawyersGlobal = parseLawyersUserDefaults()
       
        consultsGlobal = parseConsultsUserDefaults()
        collegionssGlobal = parseCollegionUserDefaults()
        
        potokzagr.maxConcurrentOperationCount = 1
        loadLawyersConsultsAnd()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
    
    @objc func doThisWhenCollegionDownloaded() { print("I've sent a spark2!")
    }
    override func viewWillAppear(_ animated: Bool) {
        if lawyersGlobal.count<10
        {
        loadLawyersConsultsAnd()
        }
        if flagPerehod == 1{
            flagPerehod = 0
            let detailVC = LawyerViewController()
            navigationController?.pushViewController(detailVC, animated: true)
            
        }
        
    }
    func catchNotificationNetwork(notification:Notification) -> Void {
        loadLawyersConsultsAnd()
//        print(NetworkMonitor.shared.isConnected)
    }
    func loadLawyersConsultsAnd(){
            if lawyersGlobal.count > 10{
                potokzagr.addOperation{ [self] in
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
            potokzagr.addOperation{
//                print("work")
                let kostil = parseLawyers()
                
                if kostil.count > 10
                {
                    lawyersGlobal = kostil
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
                    consultsGlobal = parseConsults()
                    collegionssGlobal = parseCollegion()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKeyCollegion), object: nil, userInfo: ["name":collegionssGlobal])
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
