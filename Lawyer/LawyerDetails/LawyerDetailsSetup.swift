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
    
    func setupLawyerDetailsViewController(height: CGFloat, heightScrroll: CGFloat){
        view.addSubview(scroll)
        
        scroll.contentSize = CGSize(width: view.frame.width, height: height+heightScrroll)
        view.backgroundColor = .blue
        scroll.backgroundColor = .white
        scroll.snp.makeConstraints { make in
       
                   make.top.equalToSuperview().inset(0)
                   make.width.equalToSuperview().inset(0)
                   make.right.equalToSuperview().inset(0)
                   make.bottom.equalToSuperview().inset(0)
               }
//        [menuView].forEach{
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview($0)
//        }
//        menuView.backgroundColor = .white
//        menuView.snp.makeConstraints { make in
//
//            make.top.equalToSuperview().inset(60)
//            make.left.equalToSuperview().inset(0)
//            make.right.equalToSuperview().inset(0)
//            make.bottom.equalToSuperview().inset(0)
//        }
        [name, status, mainNumber, otveti, blagodarnost, statii, about, kollegion, mestoRaboti, specialization, view1, view3, view2, view4, avatar, buttonMarscrut, buttonChat, buttonZvonok ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            scroll.addSubview($0)
        }
      
        name.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(48)
            make.left.equalToSuperview().inset(125)
        }
        status.textColor = UIColor(red: 0.984, green: 0.682, blue: 0.008, alpha: 1)
        status.snp.makeConstraints { make in
            
            make.top.equalTo(name).inset(35)
            make.left.equalTo(name).inset(0)
        }
      
        mainNumber.snp.makeConstraints { make in
          
            make.top.equalToSuperview().inset(114)
            make.left.equalToSuperview().offset(154)
        }
      
                otveti.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(227)
            make.left.equalToSuperview().inset(40)
        }
       
        blagodarnost.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(300)
            make.right.equalToSuperview().inset(0)
        }
        
        statii.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(350)
            make.right.equalToSuperview().inset(0)
        }
      
        kollegion.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(450)
            make.right.equalToSuperview().inset(0)
        }
       
        mestoRaboti.snp.makeConstraints { make in
          
            make.top.equalToSuperview().inset(500)
            make.right.equalToSuperview().inset(0)
        }

       
        specialization.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(550)
            make.right.equalToSuperview().inset(0)
        }
       
        avatar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(33)
            make.left.equalToSuperview().inset(17)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 12
      
        about.snp.makeConstraints { make in
          
            make.top.equalToSuperview().inset(345)
            make.width.equalTo(330)
            make.height.equalTo(heightScrroll)
            make.left.equalToSuperview().inset(14)
        }
       
        scroll.addSubview(buttonRazver)
//        buttonRazver.setTitleColor(.black, for: .normal)
        buttonRazver.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        buttonRazver.backgroundColor = .clear
        buttonRazver.addTarget(self, action: #selector(buttonTappedRzzvernut(_:)), for: .touchUpInside)
        buttonRazver.snp.makeConstraints { make in
            make.top.equalTo(about).inset(heightScrroll)
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.centerX.equalTo(about).inset(0)
        }
        buttonMarscrut.setTitle("Маршрут", for: .normal)
        buttonMarscrut.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonMarscrut.addTarget(self, action: #selector(buttonTappedMarscrut(_:)), for: .touchUpInside)
        buttonMarscrut.titleLabel?.font = .systemFont(ofSize: 12)
        buttonMarscrut.layer.cornerRadius = 8
        buttonMarscrut.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(93)
            make.height.equalTo(40)
            make.left.equalToSuperview().inset(259)
        }
     
        
        buttonChat.setTitle("Начать чат", for: .normal)
        buttonChat.titleLabel?.font = .systemFont(ofSize: 12)
        buttonChat.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonChat.addTarget(self, action: #selector(buttonTappedChat(_:)), for: .touchUpInside)
        buttonChat.layer.cornerRadius = 8
        buttonChat.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(93)
            make.height.equalTo(40)
            make.left.equalToSuperview().inset(28)
        }
      
      
        buttonZvonok.setTitle("Заказать звонок", for: .normal)
        buttonZvonok.titleLabel?.font = .systemFont(ofSize: 12)
        buttonZvonok.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonZvonok.addTarget(self, action: #selector(buttonTappedZvonok(_:)), for: .touchUpInside)
        buttonZvonok.layer.cornerRadius = 8
        buttonZvonok.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.left.equalToSuperview().inset(130)
        }
        
        view1.layer.backgroundColor = UIColor(red: 0.943, green: 0.949, blue: 0.963, alpha: 1).cgColor
        view2.layer.backgroundColor = UIColor(red: 0.943, green: 0.949, blue: 0.963, alpha: 1).cgColor
        
        view3.layer.backgroundColor = UIColor(red: 0.943, green: 0.949, blue: 0.963, alpha: 1).cgColor
        
        view4.layer.backgroundColor = UIColor(red: 0.943, green: 0.949, blue: 0.963, alpha: 1).cgColor
        

        view4.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(281)
            make.centerX.equalToSuperview()
            make.width.equalTo(347)
            make.height.equalTo(1)
        }
        view1.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(205)
            make.centerX.equalToSuperview()
            make.width.equalTo(347)
            make.height.equalTo(1)
        }
        view2.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(226)
            make.left.equalToSuperview().inset(110)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        view3.snp.makeConstraints { make in
           
            make.top.equalToSuperview().inset(226)
            make.left.equalToSuperview().inset(248)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        
        
        configureLawyersDetails()
    }
    func configureLawyersDetails(){
        name.text = lawyersDetails[1]
        status.text = lawyersDetails[29].replacingOccurrences(of: "нет", with: "Офлайн").replacingOccurrences(of: "да", with: "Онлайн")
        mainNumber.text = formatPhoneNumber(number: "+"+lawyersDetails[6])
        otveti.text = lawyersDetails[27]
        blagodarnost.text = lawyersDetails[26]
        statii.text = lawyersDetails[28]
        about.text = lawyersDetails[30].replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
        kollegion.text = lawyersDetails[1]
        mestoRaboti.text = lawyersDetails[1]
        specialization.text = lawyersDetails[1]
       if let url = URL(string: lawyersDetails[19])
        {
        avatar.kf.setImage(with: url)
       }
        else
        {
            avatar.image = UIImage(systemName: "person")
        }
    
    }
    @objc func buttonTappedRzzvernut(_ sender: Any) {
       
            if about.numberOfLines == 7 {
                about.numberOfLines = 0
                buttonRazver.snp.removeConstraints()
                about.snp.removeConstraints()
                setupLawyerDetailsViewController(height: 1200, heightScrroll: CGFloat(Double(about.maxNumberOfLines)*14.4))
                buttonRazver.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            } else {
                about.numberOfLines = 7
                buttonRazver.snp.removeConstraints()
                about.snp.removeConstraints()
               
                setupLawyerDetailsViewController(height: 1200, heightScrroll: 100)
               
                
            }
        }
    @objc func buttonTappedChat(_ sender: Any) {
    }
    @objc func buttonTappedZvonok(_ sender: Any) {
    }
    @objc func buttonTappedMarscrut(_ sender: Any) {
    }
}
