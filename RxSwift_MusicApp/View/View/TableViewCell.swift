//
//  TableViewCell.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var viewModel: ViewModel?
    
    let bannerImage = UIImageView()
    let albumImage = UIImageView()
    let albumDescribe = UILabel()
    let collectionButton = UIButton()

    private func configure(viewModel: ViewModel) {
        self.viewModel = viewModel
        
    }

    private func layoutCell() {
        
    }
    
}
