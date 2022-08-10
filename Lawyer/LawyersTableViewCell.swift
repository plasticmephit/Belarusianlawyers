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
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    
    let mainNumber: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    let kollegion: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray
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
        [name, avatar, status, mainNumber].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
        }
        status.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(5)
        }
        
        avatar.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
                make.width.height.equalTo(60)
        }
   
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 17
    }
    
    func configure(lawyers: [String])
    {
      
        name.text = lawyers[1].components(separatedBy: " ").dropLast().joined(separator: " ")
        status.text = lawyers[29]
        let url = URL(string: lawyers[19] )
        avatar.kf.setImage(with: url)
      
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
