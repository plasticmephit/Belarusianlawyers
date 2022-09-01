//
//  HomeViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit

var lawyersGlobal: [[String]]=[]
var lawyersGlobalFilter: [[String]]=[]
var collegionssGlobal: [[String]]=[]
var consultsGlobal: [[String]]=[]
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
        
        onlineLawyersText.text = "0"
        
        let queue = DispatchQueue.global(qos: .utility)
        
        if parseLawyersUserDefaults().count > 1{
            
            
            lawyersGlobal = parseLawyersUserDefaults()
            lawyersGlobal.remove(at: 0)
            lawyersGlobal.sort { ($0[29]) < ($1[29]) }
            consultsGlobal = parseConsultsUserDefaults()
            collegionssGlobal = parseCollegionUserDefaults()
            if lawyersGlobal.count > 10{
                
                queue.async{ [self] in
                  
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
                   
                }
            }
        }
        
        
        queue.async{
            
            
            let kostil = parseLawyers()
            print("parcer")
            if lawyersGlobal.count < 10
            {
                lawyersGlobal = kostil
                lawyersGlobal.remove(at: 0)
                lawyersGlobal.sort { ($0[29]) < ($1[29]) }
                consultsGlobal = parseConsults()
                collegionssGlobal = parseCollegion()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: myNotificationKey), object: nil, userInfo: ["name":lawyersGlobal])
                
                
                
               
                for i in 0...lawyersGlobal.count-1
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
                
                
                
            }
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    @objc func doThisWhenNotify() { print("I've sent a spark!")
    }
}
