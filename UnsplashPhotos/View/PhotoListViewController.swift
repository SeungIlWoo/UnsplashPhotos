//
//  PhotoListViewController.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher

final class PhotoListViewController: UITableViewController {

    typealias ViewModel = PhotosViewModel
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()

}
