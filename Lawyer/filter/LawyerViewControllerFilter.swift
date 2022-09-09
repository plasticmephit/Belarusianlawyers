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
    var lawyers:[[String]] = []
    var filteredlawyers:[[String]] = []
    var filteringlawyers:[[String]] = []
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
        view.backgroundColor = .white
        
            lawyers = lawyersGlobal
        
        filteredlawyers = lawyers
        setup()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
            lawyers = lawyersGlobal
        
        filteredlawyers = lawyers
        setup()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            if filteredlawyers.count != 0{
                delegate?.update(text: filteredlawyers)
            }
            else{
                print("yte")
            }
        }
    }
    func setup()
    {
        view.addSubview(noconnection)
        noconnection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        if lawyersGlobal.count > 10{
        view.addSubview(workBut)
        if let name = defaults.string(forKey: "filterMesto")
        {
            filteredlawyers = filteredlawyers.filter { $0[5].contains(name) }
            workBut.setTitle(name, for: .normal)
            
        }
        else{
            workBut.setTitle("Место работы", for: .normal)
            
        }
        workBut.backgroundColor = .white
        workBut.setTitleColor(.systemBlue, for: .normal)
        
        workBut.addTarget(self, action: #selector(buttonTappedWork(_:)), for: .touchUpInside)
        workBut.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(collegionBut)
        if let name = defaults.string(forKey: "filterCollegia")
        {
            collegionBut.setTitle(name, for: .normal)
            filteredlawyers = filteredlawyers.filter { $0[4].contains(name) }
        }
        else{
            collegionBut.setTitle("Коллегия", for: .normal)
        }
        
        collegionBut.backgroundColor = .white
        collegionBut.setTitleColor(.systemBlue, for: .normal)
        
        collegionBut.addTarget(self, action: #selector(buttonTappedCollegia(_:)), for: .touchUpInside)
        collegionBut.snp.makeConstraints { make in
            make.top.equalTo(workBut).inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(otraskiBut)
        if let name = defaults.string(forKey: "filterotrasli")
        {
            otraskiBut.setTitle(name, for: .normal)
            filteredlawyers = filteredlawyers.filter { $0[18].contains(name) }
        }
        else{
            otraskiBut.setTitle("Отрасль", for: .normal)
        }
        otraskiBut.backgroundColor = .white
        otraskiBut.setTitleColor(.systemBlue, for: .normal)
        
        otraskiBut.addTarget(self, action: #selector(buttonTappedPravo(_:)), for: .touchUpInside)
        otraskiBut.snp.makeConstraints { make in
            make.top.equalTo(collegionBut).inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(onlineBut)
        if let name = defaults.string(forKey: "filterOnline")
        {
            onlineBut.setTitle(name, for: .normal)
            filteredlawyers = filteredlawyers.filter { $0[29].contains(name) }
        }
        else{
            onlineBut.setTitle("Онлайн", for: .normal)
        }
        onlineBut.backgroundColor = .white
        onlineBut.setTitleColor(.systemBlue, for: .normal)
        
        onlineBut.addTarget(self, action: #selector(buttonTappedOnline(_:)), for: .touchUpInside)
        onlineBut.snp.makeConstraints { make in
            make.top.equalTo(otraskiBut).inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(mediatorBut)
        if let name = defaults.string(forKey: "filterMediator")
        {
            mediatorBut.setTitle(name, for: .normal)
            filteredlawyers = filteredlawyers.filter { $0[19].contains(name) }
        }
        else{
            mediatorBut.setTitle("Медиатор", for: .normal)
        }
        mediatorBut.backgroundColor = .white
        mediatorBut.setTitleColor(.systemBlue, for: .normal)
        
        mediatorBut.addTarget(self, action: #selector(buttonTappedMediator(_:)), for: .touchUpInside)
        mediatorBut.snp.makeConstraints { make in
            make.top.equalTo(onlineBut).inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(primenitBut)
        if let name = defaults.string(forKey: "filterCount")
        {
            primenitBut.setTitle(name, for: .normal)
        }
        else{
            primenitBut.setTitle("Применить", for: .normal)
        }
        primenitBut.backgroundColor = .white
        primenitBut.setTitleColor(.systemBlue, for: .normal)
        
        primenitBut.addTarget(self, action: #selector(buttonTappedPrimenit(_:)), for: .touchUpInside)
        primenitBut.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
            noconnection.text = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сброс", style: .plain, target: self, action: #selector(buttonTappedSbros))
    }
        else{
            workBut.removeFromSuperview()
             collegionBut.removeFromSuperview()
             otraskiBut.removeFromSuperview()
             onlineBut.removeFromSuperview()
             mediatorBut.removeFromSuperview()
            
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
            print("yte")
        }
    }
    
    if let tabBarController = self.navigationController?.tabBarController  {
        flagPerehod = 1
        tabBarController.selectedIndex = 0
        
        
    }
    
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
    primenitBut.setTitle("Применить", for: .normal)
    defaults.removeObject(forKey: "filterCollegia")
    defaults.removeObject(forKey: "filterotrasli")
    defaults.removeObject(forKey: "filterMesto")
    defaults.removeObject(forKey: "filterOnline")
    defaults.removeObject(forKey: "filterMediator")
    defaults.removeObject(forKey: "filterCount")
}
}

