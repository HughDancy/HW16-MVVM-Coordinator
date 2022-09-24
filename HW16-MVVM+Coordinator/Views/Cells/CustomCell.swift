//
//  CustomCell.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    // MARK: - Subviews
    
    var icon: UIImageView = {
        let icon = UIImageView()
        var image = UIImage()
        icon.image = image
        icon.layer.cornerRadius = 50 / 2
        icon.clipsToBounds = true
        icon.contentMode = .scaleAspectFill
        icon.layer.borderWidth = 3
        icon.layer.borderColor = UIColor(displayP3Red: 0.23, green: 0.21, blue: 0.51, alpha: 0.9).cgColor
        
        return icon
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    var chevron: UIImageView = {
        var chevron = UIImageView()
        let image = UIImage(systemName: "chevron.right")
        chevron.image = image
        
        return chevron
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        tintColor = .systemGray2
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Hierarchy
    
    func setupHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(chevron)
    }
    
    func setupLayout() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant:20).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        icon.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        label.leadingAnchor.constraint(equalTo: icon.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        chevron.translatesAutoresizingMaskIntoConstraints = false
        chevron.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        chevron.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        chevron.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
    
}

