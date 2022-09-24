//
//  BRKAViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 31.08.22.
//

import UIKit

class BRKAViewController: UIViewController {

    
      var lawyersDetails:[String] = []
      let menuView = UIView()
   
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
      var buttonMarscrut = UIButton()
      var buttonSite = UIButton()
      var buttonZvonok = UIButton()
      let name : UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/35)
          label.lineBreakMode = .byWordWrapping
          label.numberOfLines = 2
          return label
      }()
     
      let mainNumber : UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/59)
          return label
      }()
      
      
      let address : UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height/59)
          label.lineBreakMode = .byWordWrapping
          label.numberOfLines = 7
          return label
      }()
      
      var view1 = UILabel()
      
      override func viewDidLoad() {
          view.backgroundColor = UIColor(red: 0.741, green: 0.882, blue: 0.996, alpha: 1)
          setupBRkAViewController()
      }
  }

extension BRKAViewController{
    
    func setupBRkAViewController(){
        self.navigationController?.navigationBar.backIndicatorImage =  UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        view.backgroundColor = UIColor(red: 0.153, green: 0.6, blue: 0.984, alpha: 1)
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "БРКА"
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.addSubview(menuView)
        view.addSubview(viewforbeuty1)
        view.addSubview(viewforbeuty2)
        
        menuView.backgroundColor = .white
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
       
        
       
        [name, mainNumber,  view1,  buttonMarscrut, buttonSite, buttonZvonok, address].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            menuView.addSubview($0)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(48)
            make.left.right.equalToSuperview().inset(16)
        }
        
        name.attributedText = NSMutableAttributedString(string: "Белорусская республиканская коллегия адвокатов", attributes: [NSAttributedString.Key.kern: 0.75])
        
        mainNumber.snp.makeConstraints { make in
            
            make.top.equalTo(name).inset(UIScreen.main.bounds.height/35*2+25)
            make.left.equalToSuperview().offset(43)
        }
        
        mainNumber.attributedText = NSMutableAttributedString(string: "+375 29 867-00-48", attributes: [NSAttributedString.Key.kern: 1])
        
        address.snp.makeConstraints { make in
            
            make.top.equalTo(view1).inset(19)
            make.left.equalTo(mainNumber).inset(0)
            make.width.equalTo(UIScreen.main.bounds.width*0.75)
        }
        address.text = "ул. Коллекторная, 10\n 220004 г. Минск\n Беларусь"
        
        buttonMarscrut.setTitle("Маршрут", for: .normal)
        buttonMarscrut.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonMarscrut.addTarget(self, action: #selector(buttonTappedMarscrut(_:)), for: .touchUpInside)
        buttonMarscrut.titleLabel?.font = .systemFont(ofSize: 12)
        buttonMarscrut.layer.cornerRadius = 8
        buttonMarscrut.snp.makeConstraints { make in
            make.top.equalTo(view1).inset(UIScreen.main.bounds.height/7)
            make.width.equalTo(UIScreen.main.bounds.width/4)
            make.height.equalTo(40)
            make.left.equalTo(buttonZvonok).inset(UIScreen.main.bounds.width/3+9)
        }
        
        buttonSite.setTitle("Начать чат", for: .normal)
        buttonSite.titleLabel?.font = .systemFont(ofSize: 12)
        buttonSite.backgroundColor = UIColor(red: 0.067, green: 0.027, blue: 0.298, alpha: 1)
        buttonSite.addTarget(self, action: #selector(buttonTappedChat(_:)), for: .touchUpInside)
        buttonSite.layer.cornerRadius = 8
        buttonSite.snp.makeConstraints { make in
            make.top.equalTo(view1).inset(UIScreen.main.bounds.height/7)
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
            make.top.equalTo(view1).inset(UIScreen.main.bounds.height/7)
            make.width.equalTo(UIScreen.main.bounds.width/3)
            make.height.equalTo(40)
            make.left.equalTo(buttonSite).inset(UIScreen.main.bounds.width/4+9)
        }
        
        view1.layer.backgroundColor = UIColor(red: 0.943, green: 0.949, blue: 0.963, alpha: 1).cgColor
       
        view1.snp.makeConstraints { make in
            
            make.top.equalTo(mainNumber).inset(11+UIScreen.main.bounds.height/59)
            make.centerX.equalToSuperview()
            make.width.equalTo(347)
            make.height.equalTo(1)
        }
       
        
        
        configureLawyersDetails()
    }
    func configureLawyersDetails(){
//        name.text = lawyersDetails[1].components(separatedBy: " ").dropLast().joined(separator: " ")
//
//        mainNumber.text = formatPhoneNumber(number: "+"+lawyersDetails[6])
//
//        address.text = lawyersDetails[5]+"\n"+lawyersDetails[10]+" "+lawyersDetails[11]+" "+lawyersDetails[12]+" "+lawyersDetails[13]+" "+lawyersDetails[14]+" "+lawyersDetails[15]+" "+lawyersDetails[16]
//
        
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
