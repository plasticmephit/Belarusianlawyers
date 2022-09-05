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
        lawyers = text
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        filteredlawyers = lawyers.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchText) }
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    
    
    let searchController = UISearchController(searchResultsController: nil)
    let tableView: UITableView = .init()
    var lawyers: [[String]]=[]
    var filteredlawyers: [[String]]=[]
    var lawyersFilterSave:[[String]] = []
    //    let tab = TabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        lawyers = lawyersGlobal
       
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
//        if lawyers.count == 0
//        {
//            lawyers = lawyersGlobal
//            lawyers.remove(at: 0)
//            lawyers.sort { ($0[29]) < ($1[29]) }
//        }
        print(lawyers.count)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
//        if let name = defaults.string(forKey: "filterMesto")
//        {
//            lawyers = lawyers.filter { $0[5].contains(name) }
//
//        }
//        if let name = defaults.string(forKey: "filterCollegia")
//        {
//            lawyers = lawyers.filter { $0[4].contains(name) }
//        }
//        if let name = defaults.string(forKey: "filterOnline")
//        {
//            lawyers = lawyers.filter { $0[29].contains(name) }
//        }
//        if let name = defaults.string(forKey: "filterMediator")
//        {
//            lawyers = lawyers.filter { $0[24].contains(name) }
//        }
//        if let name = defaults.string(forKey: "filterotrasli")
//        {
//            lawyers = lawyers.filter { $0[18].contains(name) }
//        }
//        defaults.removeObject(forKey: "filterCollegia")
//        defaults.removeObject(forKey: "filterotrasli")
//        defaults.removeObject(forKey: "filterMesto")
//        defaults.removeObject(forKey: "filterCount")
//        defaults.removeObject(forKey: "filterOnline")
//        defaults.removeObject(forKey: "filterMediator")
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
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
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
    }
    func catchNotification(notification:Notification) -> Void {
        guard let name = notification.userInfo!["name"] else { return }
        lawyers = name as! [[String]]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
}

extension LawyerViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            print(filteredlawyers.count)
            return filteredlawyers.count
        } else {
            print(lawyers.count)
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
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension LawyerViewController{
    func setupTableView(){
        
        view.addSubview(tableView)
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
