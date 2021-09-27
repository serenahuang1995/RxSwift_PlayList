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
    let bannerImage = UIImageView()
    let albumImage = UIImageView()
    let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    let albumDescribe = UILabel()
    let collectionButton = UIButton()
    var passIndexPath: ((Int) -> Void)?

//    func configure(viewModel: ViewModel) {
//        self.viewModel = viewModel
//
//    }
    
    func configureSubViews() {
        
//        [bannerImage, albumImage, al]
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
