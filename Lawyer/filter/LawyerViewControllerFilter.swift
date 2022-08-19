//
//  LawyerViewControllerFilter.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 18.08.22.
//

import UIKit
protocol LawyerViewControllerFilterDelegate: AnyObject{
    func updateMesto(text: String)
}
class LawyerViewControllerFilter: UIViewController, LawyerViewControllerFilterDelegate  {
    func updateMesto(text: String) {
        workBut.setTitle(text, for: .normal)
        filteredlawyers = lawyers.filter { $0[5].contains(text) }
//        delegate?.update(text: filteredlawyers)
    }
    

    var lawyers:[[String]] = []
    var filteredlawyers:[[String]] = []
    let kategorii:[String] = ["Место работы","Коллегия"]
    var workBut = UIButton()
        var collegionBut  = UIButton()
    weak var delegate: LawyerViewControllerForFilterDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup()
        // Do any additional setup after loading the view.
    }
    func setup()
    {
        view.addSubview(workBut)
        workBut.setTitle("Место работы", for: .normal)
        workBut.backgroundColor = .white
        workBut.setTitleColor(.systemBlue, for: .normal)
       
        workBut.addTarget(self, action: #selector(buttonTappedRzzvernut(_:)), for: .touchUpInside)
        workBut.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        view.addSubview(collegionBut)
        collegionBut.setTitle("Коллегия", for: .normal)
        collegionBut.backgroundColor = .white
        collegionBut.setTitleColor(.systemBlue, for: .normal)
       
        collegionBut.addTarget(self, action: #selector(buttonTappedRzzvernut(_:)), for: .touchUpInside)
        collegionBut.snp.makeConstraints { make in
            make.top.equalTo(workBut).inset(50)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(20)
        }
        
    }
    @objc func buttonTappedRzzvernut(_ sender: Any) {
        let detailVC = FilterWorksViewController()
        detailVC.delegate = self
       
        showDetailViewController(detailVC, sender: self)
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
