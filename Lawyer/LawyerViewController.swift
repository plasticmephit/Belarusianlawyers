//
//  LawyerViewController.swift
//  
//
//  Created by Maksimilian on 9.08.22.
//
import SnapKit
import UIKit

class LawyerViewController: UIViewController, UITableViewDataSource {
    
    var viewModel: LawyerModelView
    
    init(viewModel: LawyerModelView) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(LawyersTableViewCell.self, forCellReuseIdentifier: "LawyersTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
        DispatchQueue.main.async {
            self.viewModel.fetch()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lawyers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LawyersTableViewCell", for: indexPath) as?  LawyersTableViewCell
        else{
            fatalError()
        }
        cell.configure(lawyers: viewModel.lawyers[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = LawyerDetailsViewController()
//        let navVC = UINavigationController(rootViewController: LawyerViewController.init(viewModel: LawyerModelView.init()))
        detailVC.lawyersDetails = viewModel.lawyers[indexPath.row]
        detailVC.modalPresentationStyle = .popover
        present(detailVC, animated: true, completion: nil)
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
