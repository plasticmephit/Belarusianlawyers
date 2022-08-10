//
//  LawyersTableViewCell.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 10.08.22.
//
import SnapKit
import UIKit

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCell(){
        [name, avatar, mainNumber].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
        }
    }
    func configure(lawyers: [String])
    {
        name.text = lawyers[1]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
