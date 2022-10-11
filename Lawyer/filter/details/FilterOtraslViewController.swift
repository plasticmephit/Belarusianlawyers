//
//  OtraslViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 19.08.22.
//

import UIKit

class FilterOtraslViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
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
    var searchIsActive:Bool = false
    let searchBar = UISearchBar()
    var filteredlawyers: [String]=[]
    var filteredPreset:[String] = ["Авто и ГАИ", "Авторское право","Административное право","Амнистия","Банковское право","Брачный контракт","Образование и распределение","Гражданское право","Жилищное право","Защита прав потребителей","Земельное право","Интеллектуальная собственность","Информационное право","Исполнительное производство","Конституционное право", "Корпоративное право","Медиация","Международное право","Миграционное право (беженцы)","Налоговое право","Наследственное право","Пенсионное обеспечение","Приватизация жилья","Призыв и прохождение воинской службы","Семейное право","Страховое право","Таможенное право","Трудовое право","Уголовное право","Финансовое право","Хозяйственное право","Экономическое право","Оформление наследственных прав граждан РБ по наследствам, открывшимся за границей" ,"Экономические споры","Недвижимое имущество","Защита прав несовершеннолетних","Банкротство","Спортивное право","Транспортное право","Медицинское право","Защита чести, достоинства, деловой репутации","Арбитражные споры","Интеграционное право","Образование и распределение"]
    var filteredforlawyers:[[String]] = []
    let tableView: UITableView = .init()
    weak var delegate: LawyerViewControllerFilterOtraslDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchIsActive
        {
            //            print(filteredlawyers.count)
            return filteredlawyers.count
        } else {
            //            print(lawyers.count)
            return filteredPreset.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFilters", for: indexPath as IndexPath)
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
        if  searchIsActive
        {
            delegate?.updateOtrasli(text: filteredlawyers[indexPath.row])
        }
        else{
            delegate?.updateOtrasli(text: filteredPreset[indexPath.row])
        }
        
       
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellFilters")
//        print(filteredPreset.count)
        tableView.dataSource = self
        tableView.delegate = self
        setup()
        // Do any additional setup after loading the view.
    }
    func setup()
    {
        view.addSubview(tableView)
        self.tableView.rowHeight = 60
        self.tableView.backgroundColor = .clear
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
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(55)
            make.bottom.equalToSuperview().inset(20)
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
    
