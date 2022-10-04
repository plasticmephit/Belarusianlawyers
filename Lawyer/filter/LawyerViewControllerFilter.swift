//
//  LawyerViewControllerFilter.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 18.08.22.
//

import UIKit

protocol LawyerViewControllerFilterWorkDelegate: AnyObject{
    func updateMesto(text: String)
}
protocol LawyerViewControllerFilterCollegiaDelegate: AnyObject{
    func updateCollegia(text: String)
}
protocol LawyerViewControllerFilterOtraslDelegate: AnyObject{
    func updateOtrasli(text: String)
}
protocol LawyerViewControllerFilterOnlineDelegate: AnyObject{
    func updateOnline(text: String)
}
protocol LawyerViewControllerFilterMediatorDelegate: AnyObject{
    func updateMediator(text: String)
}
class LawyerViewControllerFilter: UIViewController, LawyerViewControllerFilterWorkDelegate, LawyerViewControllerFilterCollegiaDelegate, LawyerViewControllerFilterOtraslDelegate, LawyerViewControllerFilterOnlineDelegate, LawyerViewControllerFilterMediatorDelegate{
    var noconnection = UILabel()
    lazy var scroll = UIScrollView()
    var lawyers:[[String]] = []
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    var filteredlawyers:[[String]] = []
   
    var filterCollegii:String = ""
    var filterOtrasli:String = ""
    var filterMesto:String = ""
    var filterOnline:String = ""
    var filterMediator:String = ""
    var workBut = UIButton()
    var collegionBut  = UIButton()
    var otraskiBut  = UIButton()
    var onlineBut  = UIButton()
    var mediatorBut  = UIButton()
    
    var primenitBut  = UIButton()
    
    weak var delegate: LawyerViewControllerForFilterDelegate?
    weak var delegateTabBar: TabBarPerehodDelegate?
    
    func updateOtrasli(text: String) {
        otraskiBut.setTitle(text, for: .normal)
        defaults.removeObject(forKey: "filterotrasli")
        defaults.set(text, forKey: "filterotrasli")
        filterOtrasli = text
        filteredlawyers = filteredlawyers.filter { $0[18].contains(text) }
        if let name = defaults.string(forKey: "filterMesto")
        {
            filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
        }
        if let name = defaults.string(forKey: "filterCollegia")
        {
            filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
        }
        if let name = defaults.string(forKey: "filterOnline")
        {
            filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            filteredlawyers = filteredlawyers.filter { $0[24].contains(name) }
        }
        defaults.removeObject(forKey: "filterCount")
        defaults.set(filteredlawyers.count, forKey: "filterCount")
        primenitBut.setTitle(String(filteredlawyers.count), for: .normal)
    }
    func updateOnline(text: String) {
        onlineBut.setTitle(text, for: .normal)
        defaults.removeObject(forKey: "filterOnline")
        defaults.set(text, forKey: "filterOnline")
        filterOnline = text
        filteredlawyers = filteredlawyers.filter { $0[29].contains(text) }
        if let name = defaults.string(forKey: "filterMesto")
        {
            filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
            
        }
        if let name = defaults.string(forKey: "filterCollegia")
        {
            filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
        }
        if let name = defaults.string(forKey: "filterotrasli")
        {
            filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            filteredlawyers = filteredlawyers.filter { $0[24].contains(name) }
        }
        defaults.removeObject(forKey: "filterCount")
        defaults.set(filteredlawyers.count, forKey: "filterCount")
        primenitBut.setTitle(String(filteredlawyers.count), for: .normal)
    }
    func updateMediator(text: String) {
        mediatorBut.setTitle(text, for: .normal)
        defaults.removeObject(forKey: "filterMediator")
        defaults.set(text, forKey: "filterMediator")
        filterMediator = text
        filteredlawyers = filteredlawyers.filter { $0[24].contains(text) }
        if let name = defaults.string(forKey: "filterMesto")
        {
            filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
            
        }
        if let name = defaults.string(forKey: "filterCollegia")
        {
            filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
        }
        if let name = defaults.string(forKey: "filterotrasli")
        {
            filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
        }
        if let name = defaults.string(forKey: "filterOnline")
        {
            filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
        }
        defaults.removeObject(forKey: "filterCount")
        defaults.set(filteredlawyers.count, forKey: "filterCount")
        primenitBut.setTitle(String(filteredlawyers.count), for: .normal)
    }
    
    func updateCollegia(text: String) {
        collegionBut.setTitle(text, for: .normal)
        defaults.removeObject(forKey: "filterCollegia")
        defaults.set(text, forKey: "filterCollegia")
        
        filterCollegii = text
        filteredlawyers = filteredlawyers.filter { $0[4].contains(text) }
        if let name = defaults.string(forKey: "filterOnline")
        {
            filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMesto")
        {
            filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
            
        }
        if let name = defaults.string(forKey: "filterotrasli")
        {
            filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            filteredlawyers = filteredlawyers.filter { $0[24].contains(name) }
        }
        defaults.removeObject(forKey: "filterCount")
        defaults.set(filteredlawyers.count, forKey: "filterCount")
        primenitBut.setTitle(String(filteredlawyers.count), for: .normal)
    }
    
    func updateMesto(text: String) {
        workBut.setTitle(text, for: .normal)
        defaults.removeObject(forKey: "filterMesto")
        defaults.set(text, forKey: "filterMesto")
        filterMesto = text
        filteredlawyers = filteredlawyers.filter { $0[5].contains(text) }
        if let name = defaults.string(forKey: "filterCollegia")
        {
            filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
        }
        if let name = defaults.string(forKey: "filterotrasli")
        {
            filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
        }
        if let name = defaults.string(forKey: "filterOnline")
        {
            filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            filteredlawyers = filteredlawyers.filter { $0[24].contains(name) }
        }
        defaults.removeObject(forKey: "filterCount")
        defaults.set(filteredlawyers.count, forKey: "filterCount")
        primenitBut.setTitle(String(filteredlawyers.count), for: .normal)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        //
        //            lawyers = lawyersGlobal
        //
        //        filteredlawyers = lawyers
        //        print(filteredlawyers.count)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if lawyers.count > 0
        {  filteredlawyers = lawyers
            setup(height: 1200)
        }
        else{
            lawyers = lawyersGlobal
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            if filteredlawyers.count != 0{
                delegate?.update(text: filteredlawyers)
            }
            else{
                
                //                print("yte")
            }
        }
    }
    func setup(height: CGFloat)
    {
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "Фильтр"
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.addSubview(menuView)
        
        view.addSubview(viewforbeuty1)
        view.addSubview(viewforbeuty2)
        
        menuView.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        menuView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(104)
            make.bottom.right.left.equalToSuperview().inset(0)
        }
        
        viewforbeuty1.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 0.5)
        viewforbeuty1.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(7)
            make.bottom.equalTo(menuView.snp.top).offset(0)
        }
        viewforbeuty2.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 0.5)
        viewforbeuty2.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width-40)
            make.centerX.equalToSuperview()
            make.height.equalTo(14)
            make.bottom.equalTo(menuView.snp.top).offset(0)
        }
        menuView.addSubview(scroll)
       
        scroll.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scroll.backgroundColor = .clear
        if lawyersGlobal.count > 10{
            scroll.addSubview(workBut)
            if let name = defaults.string(forKey: "filterMesto")
            {
                filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
                workBut.setTitle(name, for: .normal)
                
            }
            else{
                workBut.setTitle("Место работы", for: .normal)
                
            }
            workBut.layer.cornerRadius = 10
            workBut.backgroundColor = .white
            workBut.setTitleColor(.black, for: .normal)
            
            workBut.addTarget(self, action: #selector(buttonTappedWork(_:)), for: .touchUpInside)
            workBut.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(50)
                make.left.right.equalTo(menuView).inset(10)
                make.height.equalTo(UIScreen.main.bounds.height/11)
            }
            scroll.addSubview(collegionBut)
            if let name = defaults.string(forKey: "filterCollegia")
            {
                collegionBut.setTitle(name, for: .normal)
                filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
            }
            else{
                collegionBut.setTitle("Коллегия", for: .normal)
            }
            collegionBut.layer.cornerRadius = 10
            collegionBut.backgroundColor = .white
            collegionBut.setTitleColor(.black, for: .normal)
            
            collegionBut.addTarget(self, action: #selector(buttonTappedCollegia(_:)), for: .touchUpInside)
            collegionBut.snp.makeConstraints { make in
                make.top.equalTo(workBut).inset(UIScreen.main.bounds.height/11+10)
                make.left.right.equalTo(menuView).inset(10)
                make.height.equalTo(UIScreen.main.bounds.height/11)
            }
            scroll.addSubview(otraskiBut)
            if let name = defaults.string(forKey: "filterotrasli")
            {
                otraskiBut.setTitle(name, for: .normal)
                filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
            }
            else{
                otraskiBut.setTitle("Отрасль", for: .normal)
            }
            otraskiBut.layer.cornerRadius = 10
            otraskiBut.backgroundColor = .white
            otraskiBut.setTitleColor(.black, for: .normal)
            
            otraskiBut.addTarget(self, action: #selector(buttonTappedPravo(_:)), for: .touchUpInside)
            otraskiBut.snp.makeConstraints { make in
                make.top.equalTo(collegionBut).inset(UIScreen.main.bounds.height/11+10)
                make.left.right.equalTo(menuView).inset(10)
                make.height.equalTo(UIScreen.main.bounds.height/11)
            }
            scroll.addSubview(onlineBut)
            if let name = defaults.string(forKey: "filterOnline")
            {
                onlineBut.setTitle(name, for: .normal)
                filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
            }
            else{
                onlineBut.setTitle("Онлайн", for: .normal)
            }
            onlineBut.layer.cornerRadius = 10
            onlineBut.backgroundColor = .white
            onlineBut.setTitleColor(.black, for: .normal)
            
            onlineBut.addTarget(self, action: #selector(buttonTappedOnline(_:)), for: .touchUpInside)
            onlineBut.snp.makeConstraints { make in
                make.top.equalTo(otraskiBut).inset(UIScreen.main.bounds.height/11+10)
                make.left.right.equalTo(menuView).inset(10)
                make.height.equalTo(UIScreen.main.bounds.height/11)
            }
            scroll.addSubview(mediatorBut)
            if let name = defaults.string(forKey: "filterMediator")
            {
                mediatorBut.setTitle(name, for: .normal)
                filteredlawyers = filteredlawyers.filter { $0[19].contains(name) }
            }
            else{
                mediatorBut.setTitle("Медиатор", for: .normal)
            }
            mediatorBut.layer.cornerRadius = 10
            mediatorBut.backgroundColor = .white
            mediatorBut.setTitleColor(.black, for: .normal)
            
            mediatorBut.addTarget(self, action: #selector(buttonTappedMediator(_:)), for: .touchUpInside)
            mediatorBut.snp.makeConstraints { make in
                make.top.equalTo(onlineBut).inset(UIScreen.main.bounds.height/11+10)
                make.left.right.equalTo(menuView).inset(10)
                make.height.equalTo(UIScreen.main.bounds.height/11)
            }
            scroll.addSubview(primenitBut)
            //        if let name = defaults.string(forKey: "filterCount")
            //        {
            //            primenitBut.setTitle(name, for: .normal)
            //        }
            //        else{
            //            primenitBut.setTitle("Применить", for: .normal)
            //        }
            primenitBut.setTitle("Применить "+String(filteredlawyers.count), for: .normal)
            primenitBut.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
            primenitBut.setTitleColor(.white, for: .normal)
            primenitBut.layer.cornerRadius = 10
            primenitBut.addTarget(self, action: #selector(buttonTappedPrimenit(_:)), for: .touchUpInside)
            primenitBut.snp.makeConstraints { make in
                make.top.equalTo(menuView.snp.bottom).inset(120)
                make.left.right.equalTo(menuView).inset(40)
                make.height.equalTo(30)
            }
            noconnection.text = ""
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(buttonTappedSbros))
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        }
        else{
            
            
            view.addSubview(noconnection)
            noconnection.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(20)
            }
            noconnection.text = "нет данных"
            
            primenitBut  = UIButton()
            noconnection.text = "нет данных"
        }
    }
    
    @objc func buttonTappedWork(_ sender: Any) {
        let detailVC = FilterWorksViewController()
        detailVC.delegate = self
        filteredlawyers = lawyers
        //        filteredlawyers = filteringlawyers
        showDetailViewController(detailVC, sender: self)
    }
    @objc func buttonTappedCollegia(_ sender: Any) {
        let detailVC = FilterCollegiaViewController()
        detailVC.delegate = self
        filteredlawyers = lawyers
        //       filteredlawyers = filteringlawyers
        showDetailViewController(detailVC, sender: self)
    }
    @objc func buttonTappedPravo(_ sender: Any) {
        let detailVC = FilterOtraslViewController()
        filteredlawyers = lawyers
        detailVC.delegate = self
        //        filteredlawyers = filteringlawyers
        showDetailViewController(detailVC, sender: self)
    }
    @objc func buttonTappedOnline(_ sender: Any) {
        let detailVC = FilterOnlineViewController()
        filteredlawyers = lawyers
        detailVC.delegate = self
        //        filteredlawyers = filteringlawyers
        showDetailViewController(detailVC, sender: self)
    }
    @objc func buttonTappedMediator(_ sender: Any) {
        let detailVC = FilterMediatorViewController()
        filteredlawyers = lawyers
        detailVC.delegate = self
        //        filteredlawyers = filteringlawyers
        showDetailViewController(detailVC, sender: self)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @objc func buttonTappedPrimenit(_ sender: Any) {
        
        if self.isMovingFromParent {
            
            if filteredlawyers.count != 0{
                delegate?.update(text: filteredlawyers)
                
            }
            else{
                //            print("yte")
            }
        }
        
//        if let tabBarController = self.navigationController?.tabBarController  {
//            flagPerehod = 1
//            tabBarController.selectedIndex = 0
//
//
//        }
        
        navigationController?.popViewController(animated: true)
        
        //            let detailVC = LawyerViewController()
        //            detailVC.lawyers = filteredlawyers
        //            detailVC.lawyersFilterSave = filteredlawyers
        //            navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func buttonTappedSbros(_ sender: Any) {
        filteredlawyers = lawyers
        collegionBut.setTitle("Коллегия", for: .normal)
        workBut.setTitle("Место работы", for: .normal)
        otraskiBut.setTitle("Отрасль", for: .normal)
        onlineBut.setTitle("Онлайн", for: .normal)
        mediatorBut.setTitle("Медиатор", for: .normal)
        primenitBut.setTitle("Применить "+String(filteredlawyers.count), for: .normal)
        defaults.removeObject(forKey: "filterCollegia")
        defaults.removeObject(forKey: "filterotrasli")
        defaults.removeObject(forKey: "filterMesto")
        defaults.removeObject(forKey: "filterOnline")
        defaults.removeObject(forKey: "filterMediator")
        defaults.removeObject(forKey: "filterCount")
    }
}

