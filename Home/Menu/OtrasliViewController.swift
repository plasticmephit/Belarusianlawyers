//
//  OtrasliViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 31.08.22.
//

//
//  OtraslViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 19.08.22.
//

import UIKit

class OtraslViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
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
          
            tableView.reloadData()
           
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
        filteredlawyers = filteredPreset.filter {$0.contains(searchText)}
        DispatchQueue.main.async { [self] in
          
            UIView.transition(with: tableView,
                              duration: 0.1,
                              options: .transitionCrossDissolve,
                              animations: { self.tableView.reloadData() })
           
        }
    }
    let searchBar = UISearchBar()
    var filteredlawyers: [String]=[]
    var filteredPreset:[String] = ["Авто и ГАИ", "Авторское право","Административное право","Амнистия","Банковское право","Брачный контракт","Образование и распределение","Гражданское право","Жилищное право","Защита прав потребителей","Земельное право","Интеллектуальная собственность","Информационное право","Исполнительное производство","Конституционное право", "Корпоративное право","Медиация","Международное право","Миграционное право (беженцы)","Налоговое право","Наследственное право","Пенсионное обеспечение","Приватизация жилья","Призыв и прохождение воинской службы","Семейное право","Страховое право","Таможенное право","Трудовое право","Уголовное право","Финансовое право","Хозяйственное право","Экономическое право","Оформление наследственных прав граждан РБ по наследствам, открывшимся за границей" ,"Экономические споры","Недвижимое имущество","Защита прав несовершеннолетних","Банкротство","Спортивное право","Транспортное право","Медицинское право","Защита чести, достоинства, деловой репутации","Арбитражные споры","Интеграционное право","Образование и распределение"]
    var filteredforlawyers:[String] = []
    var noconnection = UILabel()
    let tableView: UITableView = .init()
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    var searchIsActive:Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [self] in
        tableView.reloadData()
        
        if filteredPreset.count > 0
            {
            tableView.scrollToRow(at: NSIndexPath(row: 0, section: 0) as IndexPath, at: UITableView.ScrollPosition.top, animated: false)
        }
        }
    }
    weak var delegate: LawyerViewControllerFilterOtraslDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchIsActive
        {
            //            print(filteredlawyers.count)
            return filteredlawyers.count
        } else {
            return filteredPreset.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellOtrasli", for: indexPath as IndexPath)
        
            if  searchIsActive
            {
                cell.textLabel?.text = filteredlawyers[indexPath.row]
            }
            else
            {
                cell.textLabel?.text = filteredPreset[indexPath.row]
                
            }
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MenuTableViewController()
        
        detailVC.filter = filteredPreset[indexPath.row]
        detailVC.rejim = 1
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellOtrasli")
//        print(filteredPreset.count)
        tableView.dataSource = self
        tableView.delegate = self
        flagprehodmap = 0
        setup()
        // Do any additional setup after loading the view.
    }
    func setup()
    {
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "Отрасли"
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
        
        if lawyersGlobal.count > 10{
            noconnection.text = ""
            searchBar.delegate = self
            searchBar.placeholder = "Type something here to search"
            
            //            searchController.hidesNavigationBarDuringPresentation = false
            
            
            
            searchBar.isTranslucent = true
            searchBar.sizeToFit()
            searchBar.barTintColor = UIColor.clear
            searchBar.backgroundColor = UIColor.clear
            searchBar.isTranslucent = true
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            
            
            
            //            searchController.edgesForExtendedLayout = .bottom
            tableView.tableHeaderView = searchBar
            
            
            menuView.addSubview(tableView)
       tableView.rowHeight = 60
        tableView.backgroundColor = .clear
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(20)
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
}
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
