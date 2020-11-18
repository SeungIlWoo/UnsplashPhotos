//
//  PhotosViewModel.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import Foundation
import RxSwift
import RxCocoa

protocol PhotosViewModelType {

    // 포토 리스트
    var photos: BehaviorRelay<[Photo]> { get set }
    // 페이지
    var page: Int { get }
    // 가져오기
    func fetch()

}

class PhotosViewModel: PhotosViewModelType {

    var photos = BehaviorRelay<[Photo]>(value: [])
    var page: Int = 1
    func fetch() {

    }
}
