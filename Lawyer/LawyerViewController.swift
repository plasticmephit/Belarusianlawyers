//
//  LawyerViewController.swift
//  
//
//  Created by Maksimilian on 9.08.22.
//
import SnapKit
import UIKit

class LawyerViewController: UIViewController, UITableViewDataSource {
    var lawyers:[[String]] = []
   
    
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        DispatchQueue.main.async {
            self.lawyers = parseLawyers()
            self.tableView.reloadData()
        }
         
        
        
        // Do any additional setup after loading the view.
    }
    
}

extension LawyerViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(lawyers.count)
        return lawyers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{fatalError()}
        cell.configure(lawyers: lawyers[indexPath.row])
        return cell
    }
}

extension LawyerViewController{
    func setupTableView()
    {
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
