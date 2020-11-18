//
//  UnsplashService.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/19.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class UnsplashService {

    var parameter: PhotosParameterModel?

    let baseURL: String = "https://api.unsplash.com/"
    lazy var photosURL: URL = URL(string: "\(baseURL)photos/")!

    let disposeBag = DisposeBag()

    func fetch(parameter: PhotosParameterModel) throws -> Observable<(HTTPURLResponse, Any)> {

        self.parameter = parameter

        do {
            let data = try JSONEncoder().encode(parameter)

            let parameters = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]

            let headers = ["Authorization": "Client-ID \(Unsplash.accessKey)"]
            return RxAlamofire.requestJSON(.get, photosURL, parameters: parameters, headers: HTTPHeaders(headers))

        } catch {
            print(error)
            throw error
        }
    }
}
