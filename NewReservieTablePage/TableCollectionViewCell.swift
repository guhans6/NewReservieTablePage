//
//  TableCollectionViewCell.swift
//  NewHomePage
//
//  Created by guhan-pt6208 on 11/04/23.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {

    let imageView = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let tableNameLabel = UILabel()
    let iconView = UIImageView()
    let countLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        backgroundColor = UIColor(named: "Background")
        layer.cornerRadius = 10
        clipsToBounds = true

        // Add shadow
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2)
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 4
        
        self.contentView.layer.cornerRadius = 10.0
//        self.contentView.layer.borderWidth = 1.0

        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius - 5).cgPath
        
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        contentView.addSubview(imageView)

        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)

        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailLabel.textColor = .secondaryLabel
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(emailLabel)
//
//        tableNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        tableNameLabel.text = ""
//        tableNameLabel.textColor = .secondaryLabel
//        tableNameLabel.numberOfLines = 0
//        tableNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(tableNameLabel)
//
//        iconView.image = UIImage(systemName: "person.fill")
//        iconView.contentMode = .scaleAspectFit
//        iconView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(iconView)
//        contentView.bringSubviewToFront(iconView)

        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
//            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            nameLabel.bottomAnchor.constraint(equalTo: emailLabel.topAnchor, constant: -2),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            
//            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
//            emailLabel.bottomAnchor.constraint(equalTo: tableNameLabel.topAnchor, constant: -4),
//            emailLabel.topAnchor.constraint(equalTo: nam)
            
//            tableNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            tableNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            tableNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            tableNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
//            iconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
////            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            iconView.centerYAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
//            iconView.heightAnchor.constraint(equalToConstant: 24),
//            iconView.widthAnchor.constraint(equalToConstant: 24)

        ])
    }
    
    func configureCellWith(_ image: UIImage?, _ nameLabelText: String, _ subLabelText: String) {
        
        if let image = image {
            imageView.image = image
        }
        nameLabel.text = nameLabelText
        tableNameLabel.text = subLabelText
    }
}
