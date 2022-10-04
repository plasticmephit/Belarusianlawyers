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
    
    func setupLawyerDetailsViewController(height: CGFloat, heightScrroll: CGFloat, textpoints: String, textreadmore: String){
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = lawyersDetails[1]
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.addSubview(menuView)
        view.addSubview(viewforbeuty1)
        view.addSubview(viewforbeuty2)
        
        menuView.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
        menuView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(104)
            make.bottom.right.left.equalToSuperview().inset(0)
        }
        
        viewforbeuty1.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 0.5)
        viewforbeuty1.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(7)
            make.bottom.equalTo(menuView.snp.top).offset(0)
        }
        viewforbeuty2.backgroundColor = UIColor(red: 0.918, green: 0.925, blue: 0.973, alpha: 0.5)
        viewforbeuty2.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width-40)
            make.centerX.equalToSuperview()
            make.height.equalTo(14)
            make.bottom.equalTo(menuView.snp.top).offset(0)
        }
        menuView.addSubview(scroll)
        scroll.contentSize = CGSize(width: view.frame.width, height: height+heightScrroll)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        scroll.backgroundColor = .white
        scroll.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(0)
            make.left.equalToSuperview().inset(0)
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
        [name, status, mainNumber, otveti, blagodarnost, statii, about, kollegion, mestoRaboti, specializations, specializationsdetails, view1, view3, view2, view4, avatar, buttonMarscrut, buttonChat, buttonZvonok, obadvokate, address, otvetitext, blagodarnostitext , statiitext].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            scroll.addSubview($0)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(48)
            make.left.equalToSuperview().inset(125)
        }
        status.textColor = UIColor(red: 0.984, green: 0.682, blue: 0.008, alpha: 1)
        status.snp.makeConstraints { make in
            
            make.top.equalTo(name.snp.bottom).offset(7)
            make.left.equalTo(name).inset(0)
        }
        
        
        
        otveti.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(227)
            make.left.equalToSuperview().inset(40)
        }
        
        blagodarnost.snp.makeConstraints { make in
            
            make.top.equalTo(otveti).inset(0)
            make.left.equalTo(view2).inset(15)
        }
        
        statii.snp.makeConstraints { make in
            
            make.top.equalTo(otveti).inset(0)
            make.left.equalTo(view3).inset(25)
        }
        
        kollegion.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(450)
            make.right.equalToSuperview().inset(0)
        }
        
        mestoRaboti.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(500)
            make.right.equalToSuperview().inset(0)
        }
        obadvokate.snp.makeConstraints { make in
            
            make.top.equalTo(view4).inset(30)
            make.left.equalToSuperview().inset(14)
        }
        
        otvetitext.snp.makeConstraints { make in
            
            make.top.equalTo(otveti).inset(20)
            make.left.equalTo(otveti).inset(0)
        }
        blagodarnostitext.snp.makeConstraints { make in
            
            make.top.equalTo(otvetitext).inset(0)
            make.left.equalTo(view2).inset(14)
        }
        statiitext.snp.makeConstraints { make in
            
            make.top.equalTo(otvetitext).inset(0)
            make.left.equalTo(view3).inset(14)
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
        
        mainNumber.snp.makeConstraints { make in
            
            make.top.equalTo(status.snp.bottom).offset(10)
            make.left.equalTo(avatar).offset(137)
        }
        
        about.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(345)
            make.width.equalTo(UIScreen.main.bounds.width*0.88)
            make.height.equalTo(heightScrroll)
            make.left.equalToSuperview().inset(14)
        }
        about.text = lawyersDetails[30].replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
        
        if (about.text?.count) ?? 0 > 70
        {
            let readmoreFont = UIFont(name: "Helvetica-Oblique", size: 11.0)
            let readmoreFontColor = UIColor.blue
            DispatchQueue.main.async {
                self.about.addTrailing(with: textpoints, moreText: textreadmore, moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
            }
            scroll.addSubview(buttonRazver)
            scroll.addSubview(view5)
            //        buttonRazver.setTitleColor(.black, for: .normal)
//            buttonRazver.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            buttonRazver.backgroundColor = .clear
            buttonRazver.addTarget(self, action: #selector(buttonTappedRzzvernut(_:)), for: .touchUpInside)
            buttonRazver.snp.makeConstraints { make in
              
                    
                    make.top.equalToSuperview().inset(345)
                    make.width.equalTo(UIScreen.main.bounds.width*0.88)
                    make.height.equalTo(heightScrroll)
                    make.left.equalToSuperview().inset(14)
                
            }
//            view5.backgroundColor = .black
            view5.snp.makeConstraints { make in
                make.top.equalTo(about).inset(heightScrroll)
                make.width.equalTo(300)
                make.height.equalTo(20)
                make.centerX.equalTo(about).inset(0)
            }
            
            address.snp.makeConstraints { make in
                
                make.top.equalTo(view5).inset(34)
                make.left.equalToSuperview().inset(61)
                make.width.equalTo(UIScreen.main.bounds.width*0.75)
            }
        }
        else{
            address.snp.makeConstraints { make in
                
                make.top.equalToSuperview().inset(345)
                make.left.equalToSuperview().inset(61)
                make.width.equalTo(320)
            }
        }
        address.text = lawyersDetails[5]+"\n"+lawyersDetails[10]+" "+lawyersDetails[11]+" "+lawyersDetails[12]+" "+lawyersDetails[13]+" "+lawyersDetails[14]+" "+lawyersDetails[15]+" "+lawyersDetails[16]
        specializations.snp.makeConstraints { make in
            
            make.top.equalTo(address.snp.bottom).offset(32)
            make.left.equalTo(obadvokate).inset(0)
            make.width.equalTo(320)
        }
//        print(address.maxNumberOfLines)
        
        specializationsdetails.snp.makeConstraints { make in
            
            make.top.equalTo(specializations).inset(35)
            make.left.equalTo(specializations).inset(0)
            make.width.equalTo(UIScreen.main.bounds.width*0.8)
        }
        buttonMarscrut.setTitle("Маршрут", for: .normal)
        buttonMarscrut.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonMarscrut.addTarget(self, action: #selector(buttonTappedMarscrut(_:)), for: .touchUpInside)
        buttonMarscrut.titleLabel?.font = .systemFont(ofSize: 12)
        buttonMarscrut.layer.cornerRadius = 8
        buttonMarscrut.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(UIScreen.main.bounds.width/4)
            make.height.equalTo(40)
            make.left.equalTo(buttonZvonok).inset(UIScreen.main.bounds.width/3+9)
        }
        
        buttonChat.setTitle("Начать чат", for: .normal)
        buttonChat.titleLabel?.font = .systemFont(ofSize: 12)
        buttonChat.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonChat.addTarget(self, action: #selector(buttonTappedChat(_:)), for: .touchUpInside)
        buttonChat.layer.cornerRadius = 8
        buttonChat.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(UIScreen.main.bounds.width/4)
            make.height.equalTo(40)
            make.left.equalToSuperview().inset(20)
        }
        
        buttonZvonok.setTitle("Заказать звонок", for: .normal)
        buttonZvonok.titleLabel?.font = .systemFont(ofSize: 12)
        buttonZvonok.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonZvonok.addTarget(self, action: #selector(buttonTappedZvonok(_:)), for: .touchUpInside)
        buttonZvonok.layer.cornerRadius = 8
        buttonZvonok.snp.makeConstraints { make in
            make.top.equalTo(avatar).inset(112)
            make.width.equalTo(UIScreen.main.bounds.width/3)
            make.height.equalTo(40)
            make.left.equalTo(buttonChat).inset(UIScreen.main.bounds.width/4+9)
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
            make.left.equalToSuperview().inset(UIScreen.main.bounds.width/3.2)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        view3.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(226)
            make.left.equalToSuperview().inset(UIScreen.main.bounds.width*5/7)
            //            print(UIScreen.main.bounds.height)
            make.width.equalTo(1)
            make.height.equalTo(35)
        }
        
        
        configureLawyersDetails()
    }
    func configureLawyersDetails(){
        name.text = lawyersDetails[1].components(separatedBy: " ").dropLast().joined(separator: " ")
        status.text = lawyersDetails[29].replacingOccurrences(of: "нет", with: "Офлайн").replacingOccurrences(of: "да", with: "Онлайн")
        mainNumber.text = formatPhoneNumber(number: "+"+lawyersDetails[6])
        otveti.text = lawyersDetails[27]
        if lawyersDetails[26] != ""
        {
            blagodarnost.text = lawyersDetails[26]
        }
        else{
            blagodarnost.text = "0"
        }
        statii.text = lawyersDetails[28]
        about.text = lawyersDetails[30].replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
        //        kollegion.text = lawyersDetails[1]
        //        mestoRaboti.text = lawyersDetails[1]
        //        specialization.text = lawyersDetails[1]
        
        specializationsdetails.text = lawyersDetails[23].replacingOccurrences(of: "#", with: ", ", options: .regularExpression, range: nil)
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
        
        if about.numberOfLines == 6 {
            
            about.numberOfLines = 0
            buttonRazver.snp.removeConstraints()
            view5.snp.removeConstraints()
            about.snp.removeConstraints()
            about.text = lawyersDetails[30].replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
            
            setupLawyerDetailsViewController(height: 1200, heightScrroll: CGFloat(Double(about.maxNumberOfLines)*14.4), textpoints: "", textreadmore: "")
            
            UIView.animate(withDuration: 0.4) {
                    self.view.layoutIfNeeded()
            }
//            buttonRazver.setImage(UIImage(systemName: "chevron.up"), for: .normal)
           
        } else {
            about.numberOfLines = 6
            buttonRazver.snp.removeConstraints()
            about.snp.removeConstraints()
            view5.snp.removeConstraints()
            setupLawyerDetailsViewController(height: 1200, heightScrroll: 100, textpoints: "...", textreadmore: "читать далее")
            UIView.animate(withDuration: 0.4) {
                    self.view.layoutIfNeeded()
            }
            
        }
    }
    @objc func buttonTappedChat(_ sender: Any) {
    }
    @objc func buttonTappedZvonok(_ sender: Any) {
    }
    @objc func buttonTappedMarscrut(_ sender: Any) {
        let detailVC = MapDetailsViewController()
        detailVC.lawyers = lawyersDetails
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension UILabel {

        func addTrailing(with trailingText: String, moreText: String, moreTextFont: UIFont, moreTextColor: UIColor) {
            let readMoreText: String = trailingText + moreText

            let lengthForVisibleString: Int = self.vissibleTextLength
            let mutableString: String = self.text!
            let trimmedString: String? = (mutableString as NSString).replacingCharacters(in: NSRange(location: lengthForVisibleString, length: ((self.text?.count)! - lengthForVisibleString)), with: "")
            let readMoreLength: Int = (readMoreText.count)
            let trimmedForReadMore: String = (trimmedString! as NSString).replacingCharacters(in: NSRange(location: ((trimmedString?.count ?? 0) - readMoreLength), length: readMoreLength), with: "") + trailingText
            let answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSAttributedString.Key.font: self.font])
            let readMoreAttributed = NSMutableAttributedString(string: moreText, attributes: [NSAttributedString.Key.font: moreTextFont, NSAttributedString.Key.foregroundColor: moreTextColor])
            answerAttributed.append(readMoreAttributed)
            self.attributedText = answerAttributed
        }

        var vissibleTextLength: Int {
            let font: UIFont = self.font
            let mode: NSLineBreakMode = self.lineBreakMode
            let labelWidth: CGFloat = self.frame.size.width
            let labelHeight: CGFloat = self.frame.size.height
            let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)

            let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: font]
            let attributedText = NSAttributedString(string: self.text!, attributes: attributes as? [NSAttributedString.Key : Any])
            let boundingRect: CGRect = attributedText.boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, context: nil)

            if boundingRect.size.height > labelHeight {
                var index: Int = 0
                var prev: Int = 0
                let characterSet = CharacterSet.whitespacesAndNewlines
                repeat {
                    prev = index
                    if mode == NSLineBreakMode.byCharWrapping {
                        index += 1
                    } else {
                        index = (self.text! as NSString).rangeOfCharacter(from: characterSet, options: [], range: NSRange(location: index + 1, length: self.text!.count - index - 1)).location
                    }
                } while index != NSNotFound && index < self.text!.count && (self.text! as NSString).substring(to: index).boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, attributes: attributes as? [NSAttributedString.Key : Any], context: nil).size.height <= labelHeight
                return prev
            }
            return self.text!.count
        }
    }
