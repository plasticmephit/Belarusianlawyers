//
//  LawyerViewController.swift
//  
//
//  Created by Maksimilian on 9.08.22.
//
import SnapKit
import UIKit

class LawyerViewController: UIViewController, UITableViewDataSource {
    let tableView: UITableView = .init()
    var lawyers: [[String]]=[]
    let tab = HomeViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        print(lawyers.count)
//        let queueConc = DispatchQueue(label: "lawyers", attributes: .concurrent)
//        queueConc.async {
//            self.lawyers = parseLawyers()
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        lawyers = alawyers
        print(alawyers.count)
        self.tableView.reloadData()
    }
}

extension LawyerViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lawyers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{
            fatalError()
        }
        cell.configure(lawyers: lawyers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = LawyerDetailsViewController()
        detailVC.lawyersDetails = lawyers[indexPath.row]
        //        detailVC.modalPresentationStyle = .popover
        navigationController?.pushViewController(detailVC, animated: true)
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
            make.top.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    
}
