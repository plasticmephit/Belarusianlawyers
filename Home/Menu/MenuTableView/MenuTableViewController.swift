//
//  MenuTableViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 1.09.22.
//


import UIKit
class MenuTableViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, LawyerViewControllerForFilterDelegate  {
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

func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    // Stop doing the search stuff
    // and clear the text in the search bar
    searchBar.text = ""
    filteredlawyers.removeAll()
    // Hide the cancel button
    searchBar.setShowsCancelButton(false, animated: true)
    searchBar.endEditing(true)
    searchIsActive = false
    DispatchQueue.main.async { [self] in
      
        UIView.transition(with: tableView,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
       
    }
    // You could also change the position, frame etc of the searchBar
}
func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.setShowsCancelButton(true, animated: true)
    searchIsActive = true
    //write other necessary statements
}

//

//    func updateSearchResults(for searchController: UISearchController) {
//        guard let searchText = searchController.searchBar.text else { return }
//        filteredlawyers = lawyers.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchText) }
//        DispatchQueue.main.async {
//
//            self.tableView.reloadData()
//        }
//    }
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // Filter the data you have. For instance:
    filteredlawyers = lawyers.filter { $0[1].components(separatedBy: " ").dropLast().joined(separator: " ").contains(searchText) }
    DispatchQueue.main.async { [self] in
      
        UIView.transition(with: tableView,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
       
    }
}
    
    
    let tableView: UITableView = .init()
    var lawyers: [[String]]=[]
    var filteredlawyers: [[String]]=[]
    var lawyersFilterSave:[[String]] = []
    var filter = String()
    var rejim = Int()
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    let onlinelabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let searchBar = UISearchBar()
    //    let tab = TabBar()
    var searchIsActive:Bool = false
    //    let tab = TabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        lawyers = lawyersGlobal
        
        self.extendedLayoutIncludesOpaqueBars = true
        view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersMenuTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        //        print(lawyers.count)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        if lawyersGlobal.count > 10{
            if rejim == 1
            {
                lawyers = lawyersGlobal.filter { $0[18].contains(filter)}
                lawyersFilterSave = lawyersGlobal.filter { $0[18].contains(filter)}
            }
            if rejim == 2
            {
                lawyers = lawyersGlobal.filter { $0[4].contains(filter)}
                lawyersFilterSave = lawyersGlobal.filter { $0[4].contains(filter)}
                
                //        print(lawyers.count)
            }
        }
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
        }
        //        defaults.removeObject(forKey: "filterCollegia")
        //        defaults.removeObject(forKey: "filterotrasli")
        //        defaults.removeObject(forKey: "filterMesto")
        //        defaults.removeObject(forKey: "filterCount")
        //        defaults.removeObject(forKey: "filterOnline")
        //        defaults.removeObject(forKey: "filterMediator")
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if lawyers.count == 0 {
            lawyers = lawyersGlobal
        }
            if let name = defaults.string(forKey: "filterMesto")
            {
                lawyers = lawyers.filter { $0[5].contains(name) }
            }
            if let name = defaults.string(forKey: "filterOnline")
            {
                lawyers = lawyers.filter { $0[29].contains(name) }
            }
            if let name = defaults.string(forKey: "filterMediator")
            {
                lawyers = lawyers.filter { $0[24].contains(name) }
            }
            if rejim == 1
            {
                lawyers = lawyers.filter { $0[18].contains(filter)}
                lawyersFilterSave = lawyers.filter { $0[18].contains(filter)}
            }
            if rejim == 2
            {
                lawyers = lawyers.filter { $0[4].contains(filter)}
                lawyersFilterSave = lawyers.filter { $0[4].contains(filter)}
                
                //        print(lawyers.count)
            }
            if lawyers.count == 0 {
                lawyers = lawyersGlobal
                if rejim == 1
                {
                    lawyers = lawyers.filter { $0[18].contains(filter)}
                    lawyersFilterSave = lawyers.filter { $0[18].contains(filter)}
                }
                if rejim == 2
                {
                    lawyers = lawyers.filter { $0[4].contains(filter)}
                    lawyersFilterSave = lawyers.filter { $0[4].contains(filter)}
                }
                
            }
        lawyers.sort { ($0[29]) < ($1[29]) }
            DispatchQueue.main.async {
                self.onlinelabel.text = String( self.lawyers.filter { $0[29].contains("да") }.count) + " Адвокатов онлайн"
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
            }
        
    }
    func catchNotification(notification:Notification) -> Void {
        if let name = defaults.string(forKey: "filterMesto")
        {
            lawyers = lawyers.filter { $0[5].contains(name) }
        }
        if let name = defaults.string(forKey: "filterOnline")
        {
            lawyers = lawyers.filter { $0[29].contains(name) }
        }
        if let name = defaults.string(forKey: "filterMediator")
        {
            lawyers = lawyers.filter { $0[24].contains(name) }
        }
        
        if rejim == 1
        {
            lawyers = lawyers.filter { $0[18].contains(filter)}
            lawyersFilterSave = lawyers.filter { $0[18].contains(filter)}
        }
        if rejim == 2
        {
            lawyers = lawyers.filter { $0[4].contains(filter)}
            lawyersFilterSave = lawyers.filter { $0[4].contains(filter)}
            
            //        print(lawyers.count)
        }
       
//        if lawyers.count == 0 {
//            lawyers = lawyersGlobal
//            if rejim == 1
//            {
//                lawyers = lawyers.filter { $0[18].contains(filter)}
//                lawyersFilterSave = lawyers.filter { $0[18].contains(filter)}
//            }
//            if rejim == 2
//            {
//                lawyers = lawyers.filter { $0[4].contains(filter)}
//                lawyersFilterSave = lawyers.filter { $0[4].contains(filter)}
//            }
            
//        }
        lawyers.sort { ($0[29]) < ($1[29]) }
        DispatchQueue.main.async { [self] in
            onlinelabel.text = String( lawyers.filter { $0[29].contains("да") }.count) + " Адвокатов онлайн"
            
                tableView.reloadData()
        }
        
        
    }
}

extension MenuTableViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchIsActive {
//            print(filteredlawyers.count)
            return filteredlawyers.count
        } else {
//            print(lawyers.count)
            return lawyers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersMenuTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{
            fatalError()
        }
        if lawyersGlobal.count > 10{
            if searchIsActive
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
        if searchIsActive{
            detailVC.lawyersDetails = filteredlawyers[indexPath.row]
        }
        else{
            detailVC.lawyersDetails = lawyers[indexPath.row]
        }
        
        //        detailVC.modalPresentationStyle = .popover
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MenuTableViewController{
    func setupTableView(){
        
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "Адвокаты"
        navigationItem.titleView = titleLabel
        //        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        
        if lawyersGlobal.count > 10{
            
            //            searchController.searchResultsUpdater = self
            searchBar.delegate = self
            searchBar.placeholder = "Type something here to search"
            
            //            searchController.hidesNavigationBarDuringPresentation = false
            
            
            
            searchBar.isTranslucent = true
            searchBar.sizeToFit()
            searchBar.barTintColor = UIColor.clear
            searchBar.backgroundColor = UIColor.clear
            searchBar.isTranslucent = true
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            searchBar.sizeToFit()
            
            
            
            //            searchController.edgesForExtendedLayout = .bottom
            tableView.tableHeaderView = searchBar
            //            searchController.definesPresentationContext = true
            
            //            tableView.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
            //
            
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
            menuView.addSubview(onlinelabel)
            onlinelabel.text = String( lawyers.filter { $0[29].contains("да") }.count) + " Адвокатов онлайн"
            onlinelabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(21)
                make.left.equalToSuperview().inset(14)
            }
            menuView.addSubview(tableView)
            
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
                make.top.equalToSuperview().inset(50)
                make.bottom.equalToSuperview().inset(0)
                navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(buttonTappedRzzvernut))    }
        }
    }
    @objc func buttonTappedRzzvernut(_ sender: Any) {
        let detailVC = LawyerViewControllerFilter()
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
        detailVC.flag = 1
        detailVC.lawyers = lawyersFilterSave
        detailVC.delegate = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
