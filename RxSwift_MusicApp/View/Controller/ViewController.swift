//
//  ViewController.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

//import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        TokenProvider().getToken { result in
            print(result)
        }
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }
    

}

extension ViewController: UITableViewDelegate {
    
}
