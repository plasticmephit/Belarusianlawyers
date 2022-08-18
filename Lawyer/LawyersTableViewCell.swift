//
//  LawyersTableViewCell.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 10.08.22.
//
import SnapKit
import UIKit
import Kingfisher

class LawyersTableViewCell: UITableViewCell {
    
    let avatar = UIImageView()
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let status: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.984, green: 0.682, blue: 0.008, alpha: 1)
        return label
    }()
    
    let mainNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.435, green: 0.545, blue: 0.643, alpha: 1)
        return label
    }()
    let kollegion: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.435, green: 0.545, blue: 0.643, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(){
        [name, avatar, status, mainNumber, kollegion].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(90)
        }
        status.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(38)
            make.left.equalToSuperview().inset(90)
        }
        mainNumber.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(22)
            make.left.equalToSuperview().inset(37)
        }
        kollegion.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(58)
            make.left.equalToSuperview().inset(109)
        }
        
        avatar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(14)
                make.width.height.equalTo(60)
        }
   
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
    }
    
    func configure(lawyers: [String])
    {
      
        name.text = lawyers[1].components(separatedBy: " ").dropLast().joined(separator: " ")
        status.text = lawyers[29].replacingOccurrences(of: "нет", with: "Офлайн").replacingOccurrences(of: "да", with: "Онлайн")
       if let url = URL(string: lawyers[19])
        {
        avatar.kf.setImage(with: url)
       }
        else
        {
            avatar.image = UIImage(systemName: "person.crop.square")
        }
        let newString = lawyers[4].replacingOccurrences(of: "городская", with: "гор").replacingOccurrences(of: "областная", with: "обл")

        kollegion.text = newString.components(separatedBy: " ").dropLast().joined(separator: " ")
        
        mainNumber.text = formatPhoneNumber(number: "+"+lawyers[6])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
    }
}
func formatPhoneNumber(number: String) -> String {
     let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
     let mask = "+XXX XX XXX-XX-XX"
     
     var result = ""
     var index = cleanPhoneNumber.startIndex
     for ch in mask where index < cleanPhoneNumber.endIndex {
         if ch == "X" {
             result.append(cleanPhoneNumber[index])
             index = cleanPhoneNumber.index(after: index)
         } else {
             result.append(ch)
         }
     }
     return result
 }
