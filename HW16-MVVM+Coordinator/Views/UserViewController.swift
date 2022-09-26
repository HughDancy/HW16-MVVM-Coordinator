//
//  UserViewController.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    var coordinator: AppCoordinator?
    var viewModel: TableViewModel?
    
    var currentUser: User?
    
    //MARK: - Subview's
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupHierarchy()
        contentSettings()
        setupLayout()
        view.backgroundColor = .white
    }
    
    //MARK: - Bind ViewModel
    
    func bindViewModel() {
        viewModel?.users.bind { user in
            self.currentUser = user?[rightIndex]
        }
    }
    
    //MARK: - View's content settings
    
    func contentSettings() {
        userImage.image = UIImage(named: currentUser?.userImage ?? "")
        userNameLabel.text = currentUser?.name ?? ""
        dateOfBirthLabel.text = currentUser?.dateOfBirth ?? ""
        proffesionLabel.text = currentUser?.profession ?? ""
        popularProjectLabel.text = currentUser?.popularProject ?? ""
    }
    
    //MARK: - Seyup Hierarchy
    
    func setupHierarchy() {
        view.addSubview(userImage)
        view.addSubview(userNameLabel)
        view.addSubview(dateOfBirthTitle)
        view.addSubview(proffessionTitle)
        view.addSubview(popularProjectTitle)
        view.addSubview(dateOfBirthLabel)
        view.addSubview(proffesionLabel)
        view.addSubview(popularProjectLabel)
    }
    
    //MARK: - Setup Layout
    
    func setupLayout() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 400).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        dateOfBirthTitle.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthTitle.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 30).isActive = true
        dateOfBirthTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        proffessionTitle.translatesAutoresizingMaskIntoConstraints = false
        proffessionTitle.topAnchor.constraint(equalTo: dateOfBirthTitle.bottomAnchor, constant: 20).isActive = true
        proffessionTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        popularProjectTitle.translatesAutoresizingMaskIntoConstraints = false
        popularProjectTitle.topAnchor.constraint(equalTo: proffessionTitle.bottomAnchor, constant: 20).isActive = true
        popularProjectTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
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
