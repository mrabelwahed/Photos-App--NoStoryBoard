//
//  HeaderViewCollectionReusableView.swift
//  CollectionView-NO-Storyboard
//
//  Created by MahmoudRamadan on 4/16/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class HeaderViewCollectionReusableView: UICollectionReusableView {
    
    var label : UILabel!
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "header"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addSubview(label)
        
        setupConstraints()
    }
    
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor)
        
        ])
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
