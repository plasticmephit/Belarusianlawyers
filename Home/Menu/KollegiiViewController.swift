//
//  KollegiiViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 31.08.22.
//

//
//  FilterCollegiaViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 19.08.22.
//

import UIKit

class KollegiiViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    var noconnection = UILabel()
    var filteredPreset:[[String]] = []
    var filteredforlawyers:[[String]] = []
    let tableView: UITableView = .init()
    let menuView = UIView()
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
    weak var delegate: LawyerViewControllerFilterCollegiaDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPreset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellKollegii", for: indexPath as IndexPath)
        cell.textLabel?.text = filteredPreset[indexPath.row][0]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MenuTableViewController()
        
        //        }
        detailVC.rejim = 2
        detailVC.filter = filteredPreset[indexPath.row][0]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKeyCollegion),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellKollegii")
        if filteredPreset.count == 0
        {
            filteredPreset = collegionssGlobal
            filteredPreset.remove(at: 0)
        }
        flagprehodmap = 0
//        print(filteredPreset.count)
        tableView.dataSource = self
        tableView.delegate = self
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
        titleLabel.text = "Коллегии"
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
            menuView.addSubview(tableView)
            self.tableView.rowHeight = 60
            self.tableView.backgroundColor = .clear
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
    func catchNotification(notification:Notification) -> Void {
        //        guard let name = notification.userInfo!["name"] else { return }
        //        filteredPreset = name as! [[String]]
        filteredPreset = collegionssGlobal
        filteredPreset.remove(at: 0)
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
    
}
