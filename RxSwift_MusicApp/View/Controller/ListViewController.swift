//
//  ListViewContro.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import UIKit
import RxCocoa
import RxSwift


class ListViewController: UIViewController, UIScrollViewDelegate {
    
    private let bannerView = UIImageView()
    private let tableView = UITableView()
    private let viewModel = ListViewModel()
    private let bag = DisposeBag()
}

//MARK: -View Lifecycle
extension ListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureTableViewCell(viewMoedl: viewModel)
        viewModel.fetchToken()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func configureTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -48).isActive = true
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.description())
        tableView.delegate = self
        
        let headerView = ListHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
        tableView.tableHeaderView = headerView
        
        tableView.allowsSelection = false
    }
}

extension ListViewController {
    
    func configureTableViewCell(viewMoedl: ListViewModel) {
        viewModel.tracks
            .bind(to: tableView
                    .rx
                    .items(cellIdentifier: ListTableViewCell.description(),
                           cellType: ListTableViewCell.self)) { [unowned self] row, track, cell in
                cell.layoutCell(track: track, viewModel: viewModel)
//                cell.collectionButtonTapped(track: track, viewModel: self.viewModel)
            }
            .disposed(by: bag)
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
