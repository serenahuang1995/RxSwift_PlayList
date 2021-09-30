//
//  TokenProvider.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import Foundation
import RxSwift
import KKBOXOpenAPISwift

class TokenProvider {
    
    let api = KKBOXOpenAPI(clientID: "356b9d68c0521129d2d072de36f12b29", secret: "c73e102809b0430fe41a6be0038e6087")
    
    func getToken(completion: @escaping (Result<KKAccessToken, Error>) -> Void) {

        do {
            _ = try api.fetchAccessTokenByClientCredential { result in
                switch result {
                case .success(let token):
                    print("token: \(token)")
                    completion(.success(token))
                case .error(let error):
                    print("you got \(error)")
                }
            }
        }catch {
            print("error: \(error)")
        }
        
    }
}
