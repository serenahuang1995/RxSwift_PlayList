//
//  ListViewContro.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import UIKit
import RxCocoa
import RxSwift


class ListViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let tableView = UITableView()
//    private let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))
    private let track = PublishSubject<[Track]>()
    private var tracks: [Track] = []
    private let bag = DisposeBag()
}

//MARK: -View Lifecycle
extension ListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTableViewCell()
        TokenProvider().getToken { token in
            print(token)
            DataProvider().getData(token: token) { tracks in
                self.tracks = tracks.data
            }
        }
    }
    
    private func configureTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.description())
        tableView.register(ListHeaderView.self, forHeaderFooterViewReuseIdentifier: ListHeaderView.description())
        
        tableView.tableHeaderView = ListHeaderView(reuseIdentifier: ListHeaderView.description())
    }
}

//MARK: - Rx setup
extension ListViewController {
    
    func configureTableViewCell() {
        
        track
            .bind(to: tableView
            .rx
            .items(cellIdentifier: ListTableViewCell.description(), cellType: ListTableViewCell.self)) { row, track, cell in
                cell.layoutCell(track: track)
            }
            .disposed(by: bag)
    }
}
