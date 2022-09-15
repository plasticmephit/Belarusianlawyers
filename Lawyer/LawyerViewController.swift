//
//  LawyerViewController.swift
//
//
//  Created by Maksimilian on 9.08.22.
//
import SnapKit
import UIKit

protocol LawyerViewControllerForFilterDelegate: AnyObject {
    func update(text: [[String]])
}

class LawyerViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating, LawyerViewControllerForFilterDelegate  {
    func sbros() {
        lawyers.removeAll()
        lawyers = lawyersGlobal
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func update(text: [[String]]) {
        //        lawyers = text
        //        DispatchQueue.main.async {
        //            self.tableView.reloadData()
        //        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filteredlawyers = lawyers.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchText) }
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    var noconnection = UILabel()
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    let searchController = UISearchController(searchResultsController: nil)
    let tableView: UITableView = .init()
    var lawyers: [[String]]=[]
    var filteredlawyers: [[String]]=[]
    var lawyersFilterSave:[[String]] = []
    //    let tab = TabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
//        print(lawyers.count)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: NSNotification.Name.connectivityStatus.rawValue),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotificationNetwork)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        lawyers = lawyersGlobal
        if lawyers.count > 0{
            lawyers.remove(at: 0)
            lawyers.sort { ($0[29]) < ($1[29]) }
            if let name = defaults.string(forKey: "filterMesto")
            {
                lawyers = lawyers.filter { $0[5].contains(name) }
                
            }
            if let name = defaults.string(forKey: "filterCollegia")
            {
                lawyers = lawyers.filter { $0[4].contains(name) }
            }
            if let name = defaults.string(forKey: "filterOnline")
            {
                lawyers = lawyers.filter { $0[29].contains(name) }
            }
            if let name = defaults.string(forKey: "filterMediator")
            {
                lawyers = lawyers.filter { $0[24].contains(name) }
            }
            if let name = defaults.string(forKey: "filterotrasli")
            {
                lawyers = lawyers.filter { $0[18].contains(name) }
            }
            if lawyers.count == 0 {
                lawyers = lawyersGlobal
            }
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    func catchNotification(notification:Notification) -> Void {
        
        guard let name = notification.userInfo!["name"] else { return }
        lawyers = name as! [[String]]
        lawyers = lawyersGlobal
        lawyers.remove(at: 0)
        lawyers.sort { ($0[29]) < ($1[29]) }
        if let name = defaults.string(forKey: "filterMesto")
        {
            lawyers = lawyers.filter { $0[5].contains(name) }
        }
        if let name = defaults.string(forKey: "filterCollegia")
        {
            lawyers = lawyers.filter { $0[4].contains(name) }
        }
        if let name = defaults.string(forKey: "filterOnline")
        {
            lawyers = lawyers.filter { $0[29].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            lawyers = lawyers.filter { $0[24].contains(name) }
        }
        if let name = defaults.string(forKey: "filterotrasli")
        {
            lawyers = lawyers.filter { $0[18].contains(name) }
        }
        if lawyers.count == 0 {
            lawyers = lawyersGlobal
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func catchNotificationNetwork(notification:Notification) -> Void {
        
    }
}

extension LawyerViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
//            print(filteredlawyers.count)
            return filteredlawyers.count
        } else {
//            print(lawyers.count)
            return lawyers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{
            fatalError()
        }
        if lawyersGlobal.count > 10{
            if searchController.isActive
            {
                cell.configure(lawyers: filteredlawyers[indexPath.row])
            }
            else
            {
                
                cell.configure(lawyers: lawyers[indexPath.row])
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = LawyerDetailsViewController()
        if searchController.isActive{
            detailVC.lawyersDetails = filteredlawyers[indexPath.row]
        }
        else{
            detailVC.lawyersDetails = lawyers[indexPath.row]
        }
        
        //        detailVC.modalPresentationStyle = .popover
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension LawyerViewController{
    func setupTableView(){
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")!
        
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")!
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        let titleLabel = UILabel()
        titleLabel.textColor = .systemBlue
        titleLabel.text = "Адвокаты"
        navigationItem.titleView = titleLabel
        

        if lawyersGlobal.count > 10{
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Type something here to search"
            navigationItem.searchController = searchController
            view.addSubview(tableView)
            
            //        searchController
            //        view.addSubview(viewforbeuty1)
            //        view.addSubview(viewforbeuty2)
            self.tableView.rowHeight = 142
            self.tableView.separatorColor = .clear
            self.tableView.backgroundColor = .clear
            tableView.snp.makeConstraints {
                make in
                make.right.equalToSuperview().inset(10)
                make.left.equalToSuperview().inset(10)
                make.top.equalToSuperview().inset(55)
                make.bottom.equalToSuperview().inset(0)
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Фильтр", style: .plain, target: self, action: #selector(buttonTappedRzzvernut))
            }
        }
        else{
           
                    view.addSubview(noconnection)
                    noconnection.snp.makeConstraints { make in
                        make.centerY.equalToSuperview()
                        make.centerX.equalToSuperview()
                        make.height.equalTo(20)
                    }
            noconnection.text = "нет данных"
        }
    }
    //        viewforbeuty1.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 0.7)
    //        viewforbeuty1.snp.makeConstraints { make in
    //            make.width.equalTo(UIScreen.main.bounds.width-20)
    //            make.centerX.equalToSuperview()
    //            make.height.equalTo(7)
    //            make.top.equalToSuperview().inset(90-7)
    //        }
    //        viewforbeuty2.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 0.5)
    //        viewforbeuty2.snp.makeConstraints { make in
    //            make.width.equalTo(UIScreen.main.bounds.width-40)
    //            make.centerX.equalToSuperview()
    //            make.height.equalTo(14)
    //            make.top.equalToSuperview().inset(90-14)
    //        }
    
    @objc func buttonTappedRzzvernut(_ sender: Any) {
        let detailVC = LawyerViewControllerFilter()
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
        detailVC.lawyers = lawyersGlobal
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
