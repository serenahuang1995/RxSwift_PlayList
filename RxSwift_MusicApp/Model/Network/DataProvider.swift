//
//  DataProvider.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class DataProvider {
    
    private let bag = DisposeBag()
    
    private func getData(token: String) {
        
        let url = URL(string: "https://api.kkbox.com/v1.1/new-hits-playlists/DZrC8m29ciOFY2JAm3/tracks")!
        let headers: HTTPHeaders = [
            "Host": "api.kkbox.com",
            "Authorization": "Bearer \(token)"
        ]
        let params = [
            "territory": "TW",
            "offset": "0",
            "limit": "20"
        ]
        
        AF.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Tracks.self) { response in
            switch response.result {
            case .success(let tracks):
                print("your data is \(tracks)")
            case .failure(let error):
                print("you didn't got any data \(error)")
            }
        }
    }
    
}
