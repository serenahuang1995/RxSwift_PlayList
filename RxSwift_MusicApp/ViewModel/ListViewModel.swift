//
//  ListViewModel.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import UIKit
import RxSwift
import RxCocoa
import KKBOXOpenAPISwift

class ListViewModel {
    
    
    var tracks =  PublishSubject<[Track]>()
    var trackArray: [Track] = []
    var collectionTracks: [String] = []
    let bag = DisposeBag()
    
    init() {
        
//        let ovservable = tracks.asObservable()
        
//        observableCreated(tracks: trackArray)
//        tracks.subscribe(onNext: { [unowned self] _ in
//            print("取得track成功：\(self.tracks)")
//        }, onError: { _ in
//            print("取得失敗！")
//        }, onCompleted: {
//            print("取得tracks 任務完成")
//        })
//        .disposed(by: bag)
    }
    
//    func observableCreated(tracks: [Track]) -> Observable<[Track]> {
//        
//        return Observable.create { observer in
//            self.fetchToken(tracks: tracks)
//            observer.onNext(tracks)
//            observer.onCompleted()
//            return Disposables.create()
//        }
//    }
    
    func fetchToken() {
        TokenProvider().getToken { [weak self] result in
            switch result {
            case .success(let token):
                print("\(token)")
                self?.fetchDataByToken(token: token)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchDataByToken(token: KKAccessToken) {
        DataProvider().getData(token: token) { [unowned self] result in
            switch result {
            case .success(let tracks):
                print("\(tracks)")
                self.trackArray = tracks
                self.tracks.onNext(trackArray)
                print("\(self.trackArray)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
