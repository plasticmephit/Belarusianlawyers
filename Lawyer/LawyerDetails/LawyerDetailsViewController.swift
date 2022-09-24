//
//  LawyerDetailsViewController.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 11.08.22.
//

import UIKit

class LawyerDetailsViewController: UIViewController  {
  
    var lawyersDetails:[String] = []
    let menuView = UIView()
    
    let viewforbeuty1 = UIView()
    let viewforbeuty2 = UIView()
   lazy var scroll = UIScrollView()
    var avatar = UIImageView()
    var buttonRazver = UIButton()
    var buttonMarscrut = UIButton()
    var buttonChat = UIButton()
    var buttonZvonok = UIButton()
    let name : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let status : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let mainNumber : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let otveti : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let blagodarnost : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let statii : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let about : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 7
        return label
    }()
    let kollegion : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let mestoRaboti : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    let obadvokate : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text  = "Об адвокате"
        return label
    }()
    let otvetitext : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text  = "Ответов"
        return label
    }()
    let blagodarnostitext : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text  = "Благодарностей"
        return label
    }()
    let statiitext : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text  = "Статьи"
        return label
    }()
    
    let address : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    let specializations : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Специализации"
        return label
    }()
    let specializationsdetails : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 6
        return label
    }()
    var view1 = UILabel()
    var view2 = UILabel()
    var view3 = UILabel()
    var view4 = UILabel()
    var view5 = UILabel()
    override func viewDidLoad() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
            titleLabel.text = lawyersDetails[1]
            navigationItem.titleView = titleLabel
        
        setupLawyerDetailsViewController(height: 1200, heightScrroll: 100, textpoints: "...", textreadmore: "читать далее")
    }
}
extension UILabel {
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}
