//
//  UIImageViewExt.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImageURL(_ url: URL, cornerRadius: CGFloat = 0.0) {

        let processor = DownsamplingImageProcessor(size: bounds.size) |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        kf.indicatorType = .activity
        kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
