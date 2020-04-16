//
//  PeopleCustomCellCollectionViewCell.swift
//  CollectionView-NO-Storyboard
//
//  Created by MahmoudRamadan on 4/16/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class PeopleCustomCellCollectionViewCell: UICollectionViewCell {
    var profileImageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        profileImageView = UIImageView(frame: .zero)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFit
        contentView.addSubview(profileImageView)
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(person : Person){
        profileImageView.image = person.profileImage
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
