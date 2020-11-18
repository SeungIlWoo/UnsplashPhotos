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

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = nil
        tableView.dataSource = nil

        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        viewModel.photos
            .bind(to: tableView.rx.items(cellIdentifier: "PhotoCell",
                                         cellType: PhotoCell.self)) { (row, element, cell) in

                cell.configure(model: element)

                cell.downloadButton.rx.tap
                    .throttle(.seconds(1), scheduler: MainScheduler.instance)
                    .subscribe(onNext: { [unowned self] photo in
                        self.viewModel.savePhoto(element)
                    })
                .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)

        viewModel.fetch()

    }

    // MARK: - UIScrollViewDelegate
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)

        if viewModel.loadingState == .loaded && distance < 400 {
            viewModel.fetch()
        }
    }
}
