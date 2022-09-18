//
//  FilterDetailsViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 18.08.22.
//

import UIKit

class FilterWorksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var filteredPreset:[[String]] = []
    var filteredforlawyers:[[String]] = []
    let tableView: UITableView = .init()
    weak var delegate: LawyerViewControllerFilterWorkDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPreset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFilterc", for: indexPath as IndexPath)
        cell.textLabel?.text = filteredPreset[indexPath.row][0]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.updateMesto(text: filteredPreset[indexPath.row][0])
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: myNotificationKey),
                                               object: nil,
                                               queue: nil,
                                               using:catchNotification)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellFilterc")
        if filteredPreset.count == 0
        {
            filteredPreset = consultsGlobal
        }
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
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(55)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    func catchNotification(notification:Notification) -> Void {
//        guard let name = notification.userInfo!["name"] else { return }
//        filteredPreset = name as! [[String]]
        filteredPreset = consultsGlobal
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
