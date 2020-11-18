//
//  PhotosParameterModel.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import Foundation

struct PhotosParameterModel: Encodable {

    var page: Int?
    var perPage: Int?
    var orderBy: PhotosOrderByModel?
}
