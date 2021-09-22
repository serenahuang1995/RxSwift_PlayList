//
//  DataProvider.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import Foundation

class DataProvider {
    
    private func getData(token: String) {
        
        
        let url = URL(string: "https://api.kkbox.com/v1.1/new-hits-playlists/DZrC8m29ciOFY2JAm3/tracks")!
        let headers = [
            "Host": "api.kkbox.com",
            "Authorization": "Bearer \(token)"
        ]
        let params =[
            "territory": "TW",
            "offset": "0",
            "limit": "20"
        ]
        
 
            
            
            
        }
    }
}
