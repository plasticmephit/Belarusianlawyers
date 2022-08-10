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
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
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
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lawyers.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
       }
       
       // Make the background color show through
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{
            fatalError()
        }
        
         
        cell.configure(lawyers: lawyers[indexPath.section])
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath section: Int) -> CGFloat {
        return 0
    }
}

extension LawyerViewController{
    func setupTableView(){
        view.addSubview(tableView)
        self.tableView.rowHeight = 80.0
        self.tableView.separatorColor = .clear

        self.tableView.backgroundColor = .clear
        tableView.snp.makeConstraints {
            make in
            make.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    
}
