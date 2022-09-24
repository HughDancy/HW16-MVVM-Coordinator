//
//  UserView.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import UIKit

class UserView: UIView {
    
    //MARK: - View Model
    
    let viewModel = TableViewModel()
    private var users = [User]()
    
    //MARK: - SubView's
    
    private var userImage: UIImageView = {
        let userImage = UIImageView()
        let image = UIImage()
        userImage.image = image
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 200
        userImage.clipsToBounds = true
        userImage.layer.borderColor = UIColor(displayP3Red: 0.05, green: 0.09, blue: 0.83, alpha: 1).cgColor
        userImage.layer.borderWidth = 5
        
        return userImage
    }()
    
    private var userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
        
        return userNameLabel
    }()
    
    private var dateOfBirthTitle: UILabel = {
        let dateOfBirthTitle = UILabel()
        dateOfBirthTitle.font = UIFont(name: "HelveticaNeue", size: 19)
        dateOfBirthTitle.text = "Дата рождения:"
        
        return dateOfBirthTitle
    }()
    
    private var proffessionTitle: UILabel = {
        let proffessionTitle = UILabel()
        proffessionTitle.font = UIFont(name: "HelveticaNeue", size: 19)
        proffessionTitle.text = "Род деятельности:"
        
        return proffessionTitle
    }()
    
    private var popularProjectTitle: UILabel = {
        let popularProjectTitle = UILabel()
        popularProjectTitle.font = UIFont(name: "HelveticaNeue", size: 19)
        popularProjectTitle.text = "Знаковое произведение:"
        
        return popularProjectTitle
    }()
    
    private var dateOfBirthLabel: UILabel = {
        let dateOfBirthLabel = UILabel()
        dateOfBirthLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        
        return dateOfBirthLabel
    }()
    
    private var proffesionLabel: UILabel = {
        let proffesionLabel = UILabel()
        proffesionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        
        return proffesionLabel
    }()
    
    private var popularProjectLabel: UILabel = {
        let popularProjectLabel = UILabel()
        popularProjectLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        
        return popularProjectLabel
    }()
    
    //MARK: - Init
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        bindViewModel()
        setupHierarchy()
        setupLayout()
        backgroundColor = .white
        contentSettings()
    }
    
    //MARK: - ViewModel Setup
    
    func bindViewModel() {
        viewModel.users.bind { user in
            self.users = user ?? someUsers
        }
    }
    
    //MARK: - Setup Hierarchy
    
    func setupHierarchy() {
        addSubview(userImage)
        addSubview(userNameLabel)
        addSubview(dateOfBirthTitle)
        addSubview(proffessionTitle)
        addSubview(popularProjectTitle)
        addSubview(dateOfBirthLabel)
        addSubview(proffesionLabel)
        addSubview(popularProjectLabel)
    }
    
    //MARK: - View's content settings
    
    func contentSettings() {
        userImage.image = UIImage(named: users[rightIndex].userImage)
        userNameLabel.text = users[rightIndex].name
        dateOfBirthLabel.text = users[rightIndex].dateOfBirth
        proffesionLabel.text = users[rightIndex].profession
        popularProjectLabel.text = users[rightIndex].popularProject
    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        userImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        dateOfBirthTitle.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthTitle.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 30).isActive = true
        dateOfBirthTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        proffessionTitle.translatesAutoresizingMaskIntoConstraints = false
        proffessionTitle.topAnchor.constraint(equalTo: dateOfBirthTitle.bottomAnchor, constant: 20).isActive = true
        proffessionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        popularProjectTitle.translatesAutoresizingMaskIntoConstraints = false
        popularProjectTitle.topAnchor.constraint(equalTo: proffessionTitle.bottomAnchor, constant: 20).isActive = true
        popularProjectTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 29).isActive = true
        dateOfBirthLabel.leadingAnchor.constraint(equalTo: dateOfBirthTitle.trailingAnchor, constant: 10).isActive = true
        
        proffesionLabel.translatesAutoresizingMaskIntoConstraints = false
        proffesionLabel.topAnchor.constraint(equalTo: dateOfBirthTitle.bottomAnchor, constant: 19).isActive = true
        proffesionLabel.leadingAnchor.constraint(equalTo: proffessionTitle.trailingAnchor, constant: 10).isActive = true
        
        popularProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        popularProjectLabel.topAnchor.constraint(equalTo: proffesionLabel.bottomAnchor, constant: 19).isActive = true
        popularProjectLabel.leadingAnchor.constraint(equalTo: popularProjectTitle.trailingAnchor, constant: 10).isActive = true
        
    }
    
}
