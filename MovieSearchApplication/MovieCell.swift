//
//  MovieCell.swift
//  MovieSearchApplication
//
//  Created by Ben Wong on 2016-09-29.
//  Copyright © 2016 Ben Wong. All rights reserved.
//

import Foundation


import UIKit

class MovieCell: UICollectionViewCell {
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
}
