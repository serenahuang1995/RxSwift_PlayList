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

    private let albumImage = UIImageView()
    private let albumDescribe = UILabel()
    private let collectionButton = UIButton()
    private let bag = DisposeBag()
//    private let viewModel = ListViewModel()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubViews()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubViews() {
        [albumImage, albumDescribe, collectionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        [albumImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
         albumImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
         albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
         albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor),
         
         albumDescribe.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         albumDescribe.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 16),
         albumDescribe.trailingAnchor.constraint(equalTo: collectionButton.leadingAnchor, constant: -16),
         
         collectionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
         collectionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
         collectionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
         collectionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
         collectionButton.heightAnchor.constraint(equalTo: collectionButton.widthAnchor)
        ].forEach{ $0.isActive = true }
        
        collectionButton.isSelected = false
        collectionButton.setImage(UIImage(named: "collection"), for: .selected)
        collectionButton.setImage(UIImage(named: "un-collection"), for: .normal)
    }

    func layoutCell(track: Track, viewModel: ListViewModel) {
        albumImage.kf.setImage(with: URL(string: track.album.images[0].url))
        albumDescribe.text = track.name
        collectionButton.isSelected = viewModel.collectionTracks.contains(track.id)
        collectionButtonTapped(track: track, viewModel: viewModel)
    }
    
    func collectionButtonTapped(track: Track, viewModel: ListViewModel) {
        collectionButton.rx.tap
            .subscribe { [weak self] _ in
                if viewModel.collectionTracks.contains(track.id) {
                    viewModel.collectionTracks.removeAll { $0 == track.id }
//                    self?.collectionButton.isSelected = false
                } else {
                        viewModel.collectionTracks.append(track.id)
                        print("你的收藏清單 \(viewModel.collectionTracks)")
             
//                    self?.collectionButton.isSelected = true
                }
                self?.collectionButton.isSelected.toggle()
            }
            .disposed(by: bag)
    }
}
