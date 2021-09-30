//
//  ListHeaderView.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/28.
//

import UIKit
import RxSwift

class ListHeaderView: UIView {
    
    private let bannerImage = UIImageView()
    
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        translatesAutoresizingMaskIntoConstraints = false
//        configureHeaderView()
//
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeaderView() {

        let imageName = "banner"
        let image = UIImage(named: imageName)
        let bannerView = UIImageView(image: image)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        bannerImage = bannerView
        self.addSubview(bannerView)
        
        [bannerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         bannerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
         bannerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
         bannerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
         bannerView.widthAnchor.constraint(equalToConstant: self.frame.width),
         bannerView.heightAnchor.constraint(equalToConstant: self.frame.width)
        ].forEach{ $0.isActive = true }
    }
}
