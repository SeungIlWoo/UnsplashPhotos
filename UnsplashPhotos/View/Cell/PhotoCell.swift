//
//  PhotoCell.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import UIKit

final class PhotoCell: UITableViewCell {

    @IBOutlet private weak var userPhotoImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!

    @IBOutlet private weak var mainImageView: UIImageView!
    @IBOutlet private weak var mainImageViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var downloadButton: UIButton!

    func configure(model: Photo) {

        userNameLabel.text = model.user?.name

        if let url = URL(string: model.user?.profileImage.small ?? "") {
            userPhotoImageView.setImageURL(url, cornerRadius: 17)
        }

        if let url = URL(string: model.urls.small) {

            mainImageView.setImageURL(url)
            let imageHeight = UIScreen.main.bounds.width * (CGFloat(model.height) / CGFloat(model.width))

            mainImageViewHeightConstraint.constant = ceil(imageHeight)
        }
    }
}
