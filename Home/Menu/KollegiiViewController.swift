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
    var filteredPreset:[[String]] = []
    var filteredforlawyers:[[String]] = []
    let tableView: UITableView = .init()
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
        let detailVC = LawyerViewController()
        detailVC.lawyers = lawyersGlobal.filter { $0[4].contains(filteredPreset[indexPath.row][0])
        }
        detailVC.lawyersFilterSave = lawyersGlobal.filter { $0[4].contains(filteredPreset[indexPath.row][0]) }
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellKollegii")
        if filteredPreset.count == 0
        {
            filteredPreset = collegionssGlobal
        }
        print(filteredPreset.count)
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
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(55)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    func catchNotification(notification:Notification) -> Void {
        guard let name = notification.userInfo!["name"] else { return }
//        filteredPreset = name as! [[String]]
        filteredPreset = collegionssGlobal
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
