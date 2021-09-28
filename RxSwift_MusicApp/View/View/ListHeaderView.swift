//
//  ListHeaderView.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/28.
//

import UIKit
import RxSwift

class ListHeaderView: UITableViewHeaderFooterView {
    
    private let bannerImage = UIImageView()
    private let bag = DisposeBag()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        configureHeaderView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeaderView() {
        
        contentView.addSubview(bannerImage)
        bannerImage.image = UIImage(named: "banner")
        
        [bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
         bannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
         bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
         bannerImage.widthAnchor.constraint(equalToConstant: contentView.frame.width),
         bannerImage.heightAnchor.constraint(equalToConstant: contentView.frame.width)
        ].forEach{ $0.isActive = true }
    }
}
