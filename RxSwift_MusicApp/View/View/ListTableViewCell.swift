//
//  ListTableViewCell.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class ListTableViewCell: UITableViewCell {
    
//    var viewModel: ViewModel?
    let albumImage = UIImageView()
    let albumDescribe = UILabel()
    let collectionButton = UIButton()
    var passIndexPath: ((Int) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(viewModel: ViewModel) {
//        self.viewModel = viewModel
//
//    }
    
    func configureSubViews() {
        
        [albumImage, albumDescribe, collectionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        [albumImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         
         albumDescribe.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         albumDescribe.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 16),
         
         collectionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         collectionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ].forEach{ $0.isActive = true }
        
        collectionButton.setImage(UIImage(named: "collection"), for: .selected)
        collectionButton.setImage(UIImage(named: "un-collection"), for: .normal)
    }

    func layoutCell(track: Track) {
        albumImage.kf.setImage(with: URL(string: track.album.images[0].url))
        albumDescribe.text = track.name
    }
    
    func getIndexPath() -> IndexPath? {
        
        guard let tableView = superview as? UITableView else { return nil }
        let indexPath = tableView.indexPath(for: self)
        return indexPath
    }
}
