//
//  ViewController.swift
//  CollectionView-NO-Storyboard
//
//  Created by MahmoudRamadan on 4/16/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView : UICollectionView!
    var refreshview : UIRefreshControl!
    var people :[Person]!
    let cellReusableIdentifier = "cell_identifier"
    let headerResusableIdentifier = "header_identifier"
    let headerHeight : CGFloat = 30
    let cellHeihgt: CGFloat = 16
    let cellWidth: CGFloat = 16
    let padding:CGFloat = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "photos"
        
        //setup collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
        //data
        
        let ramadan = Person("ramadan")
        let rx = Person("rx")
        
        people = [ramadan,rx,ramadan,rx,ramadan,rx,ramadan,rx,ramadan,rx,ramadan,rx
            ,ramadan,rx,ramadan,rx
        ]
        
        //refresh view
        refreshview = UIRefreshControl()
        refreshview.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        //init
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = refreshview
        collectionView.register(PeopleCustomCellCollectionViewCell.self, forCellWithReuseIdentifier: cellReusableIdentifier)
        
        collectionView.register(HeaderViewCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerResusableIdentifier)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
   @objc func pulledToRefresh(){
    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
        self.refreshview.endRefreshing()
    }
    }
    
    
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReusableIdentifier, for: indexPath) as! PeopleCustomCellCollectionViewCell
        cell.config(person : people[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerResusableIdentifier, for: indexPath) as! HeaderViewCollectionReusableView
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        people.remove(at: indexPath.item)
        collectionView.reloadData()
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 4*padding)/3   // 3 items for grid
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
}

