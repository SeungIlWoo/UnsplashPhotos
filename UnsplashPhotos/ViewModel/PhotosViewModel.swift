//
//  PhotosViewModel.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import Foundation
import RxSwift
import RxCocoa
import os

protocol PhotosViewModelType {

    // 포토 리스트
    var photos: BehaviorRelay<[Photo]> { get set }
    // 페이지
    var page: Int { get }
    // 가져오기
    func fetch()

}

class PhotosViewModel: PhotosViewModelType {

    // 로딩 상태 값
    enum LoadingState {
        case loading
        case loaded
    }

    var photos = BehaviorRelay<[Photo]>(value: [])
    let service = UnsplashService()
    var page: Int = 1
    let disposeBag = DisposeBag()

    var loadingState: LoadingState = .loaded

    // 가져오기
    func fetch() {
        self.loadingState = .loading
        try? service.fetch(parameter: PhotosParameterModel(page: page))
            .subscribe(onNext: { [weak self] (response, result) in
                guard let `self` = self else { return }

                os_log("response: \(response)")
                os_log("result: \(result as! NSObject)")

                var photos: [Photo]
                if self.page == 1 {
                    photos = self.getPhotos(object: result)
                } else {
                    photos = self.photos.value + self.getPhotos(object: result)
                }
                self.photos.accept(photos)
                self.page = self.page + 1
                self.loadingState = .loaded
            }).disposed(by: disposeBag)
    }

    func getPhotos(object: Any) -> [Photo] {

        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else { return [] }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.dataDecodingStrategy = .deferredToData
        let photos: [Photo] = try! decoder.decode(Array<Photo>.self, from: data)

        return photos
    }

    func savePhoto(_ photo: Photo) {
        print("photo: \(photo.id)")

        if let url = URL(string: photo.urls.thumb) {
            print("url: \(url)")
            if let data = try? Data(contentsOf: url) {
                print("data")
                if let image = UIImage(data: data) {
                    print("image")
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            }
        }
    }

}
