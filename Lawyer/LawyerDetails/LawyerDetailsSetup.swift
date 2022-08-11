//
//  LawyerDetailsSetup.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import Foundation
import UIKit
import SnapKit
extension LawyerDetailsViewController{
    
    func setupLawyerDetailsViewController(){
        [menuView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        menuView.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 1)
        menuView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(40)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        [name, status, mainNumber, otveti, blagodarnost, statii, about, kollegion, consult, specialization].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            menuView.addSubview($0)
        }
      
        name.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
      
        status.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
      
        mainNumber.snp.makeConstraints { make in
          
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
       
        otveti.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
       
        blagodarnost.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
        
        statii.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
       
        about.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
      
        kollegion.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
       
        consult.snp.makeConstraints { make in
          
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
       
        specialization.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(0)
        }
        
        configureHomeViewConroller()
    }
    func configureHomeViewConroller(){
        name.text = "Адвокаты"
        status.text = "Отрасли права"
        mainNumber.text = "Коллегии по регионам"
        otveti.text = "БРКА"
        blagodarnost.text = "Адвокаты"
        statii.text = "Отрасли права"
        about.text = "Коллегии по регионам"
        kollegion.text = "БРКА"
        consult.text = "Адвокаты"
        specialization.text = "Отрасли права"
    }
}
