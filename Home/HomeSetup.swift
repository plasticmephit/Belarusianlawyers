//
//  HomeSetup.swift
//  
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit
extension HomeViewController{
    
    func setupHomeViewController(){
        [menuView, onlineLawyers, onlineLawyersText].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        menuView.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 1)
        menuView.snp.makeConstraints { make in
            
            make.height.equalTo(478)
            make.left.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
        }
        [lawyersBut, otrasli, kollegii, brka].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            menuView.addSubview($0)
        }
        
        lawyersBut.backgroundColor = .white
        lawyersBut.layer.cornerRadius = 10
        lawyersBut.snp.makeConstraints { make in
            make.height.equalTo(79)
            make.right.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        lawyersBut.translatesAutoresizingMaskIntoConstraints = false
        lawyersBut.addSubview(lawyersText)
        lawyersText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(90)
        }
        otrasli.backgroundColor = .white
        otrasli.layer.cornerRadius = 10
        otrasli.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(79)
            make.top.equalTo(lawyersBut).inset(90)
            make.centerX.equalToSuperview()
        }
        otrasli.translatesAutoresizingMaskIntoConstraints = false
        otrasli.addSubview(otrasliText)
        otrasliText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(90)
        }
        kollegii.backgroundColor = .white
        kollegii.layer.cornerRadius = 10
        kollegii.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(79)
            make.top.equalTo(otrasli).inset(90)
            make.centerX.equalToSuperview()
        }
        kollegii.translatesAutoresizingMaskIntoConstraints = false
        kollegii.addSubview(kollegiiText)
        kollegiiText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(90)
        }
        brka.backgroundColor = .white
        brka.layer.cornerRadius = 10
        brka.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(79)
            make.top.equalTo(kollegii).inset(90)
            make.centerX.equalToSuperview()
        }
        brka.translatesAutoresizingMaskIntoConstraints = false
        brka.addSubview(brkaText)
        brkaText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(90)
        }
        onlineLawyers.backgroundColor = .clear
        onlineLawyers.layer.cornerRadius = 10
        onlineLawyers.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(50)
            make.height.equalTo(120)
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        onlineLawyers.translatesAutoresizingMaskIntoConstraints = false
        onlineLawyers.addSubview(onlineLawyersText)
        onlineLawyersText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(0)
        }
        onlineLawyers.addSubview(onlineLawyersTextLawyer)
        onlineLawyersTextLawyer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        configureHomeViewConroller()
    }

    func configureHomeViewConroller(){
        lawyersText.text = "Адвокаты"
        otrasliText.text = "Отрасли права"
        kollegiiText.text = "Коллегии по регионам"
        brkaText.text = "БРКА"
    }
}
