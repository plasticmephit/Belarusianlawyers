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
        view.backgroundColor = .blue
        [menuView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        menuView.backgroundColor = .white
        menuView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(60)
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
        name.text = lawyersDetails[1]
        status.text = lawyersDetails[1]
        mainNumber.text = lawyersDetails[1]
        otveti.text = lawyersDetails[1]
        blagodarnost.text = lawyersDetails[1]
        statii.text = lawyersDetails[1]
        about.text = lawyersDetails[1]
        kollegion.text = lawyersDetails[1]
        consult.text = lawyersDetails[1]
        specialization.text = lawyersDetails[1]
    }
}
