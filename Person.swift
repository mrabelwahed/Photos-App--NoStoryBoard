//
//  Person.swift
//  CollectionView-NO-Storyboard
//
//  Created by MahmoudRamadan on 4/16/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import Foundation
import UIKit

class Person  {
    var profileImage : UIImage?
    init(_ imageName : String) {
        self.profileImage  = UIImage(named: imageName)
    }
}
