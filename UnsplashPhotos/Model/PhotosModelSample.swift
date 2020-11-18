//
//  PhotosModelSample.swift
//  UnsplashPhotos
//
//  Created by ilwoo sung on 2020/11/18.
//

import Foundation

struct PhotosModelSample {

    static private let JSON = """
    [
      {
        "id": "LBI7cgq3pbM",
        "created_at": "2016-05-03T11:00:28-04:00",
        "updated_at": "2016-07-10T11:00:01-05:00",
        "width": 5245,
        "height": 3497,
        "color": "#60544D",
        "blur_hash": "LoC%a7IoIVxZ_NM|M{s:%hRjWAo0",
        "likes": 12,
        "liked_by_user": false,
        "description": "A man drinking a coffee.",
        "user": {
          "id": "pXhwzz1JtQU",
          "username": "poorkane",
          "name": "Gilbert Kane",
          "portfolio_url": "https://theylooklikeeggsorsomething.com/",
          "bio": "XO",
          "location": "Way out there",
          "total_likes": 5,
          "total_photos": 74,
          "total_collections": 52,
          "instagram_username": "instantgrammer",
          "twitter_username": "crew",
          "profile_image": {
            "small": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=80&fm=jpg&crop=faces&fit=crop&h=32&w=32",
            "medium": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=80&fm=jpg&crop=faces&fit=crop&h=64&w=64",
            "large": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128"
          },
          "links": {
            "self": "https://api.unsplash.com/users/poorkane",
            "html": "https://unsplash.com/poorkane",
            "photos": "https://api.unsplash.com/users/poorkane/photos",
            "likes": "https://api.unsplash.com/users/poorkane/likes",
            "portfolio": "https://api.unsplash.com/users/poorkane/portfolio"
          }
        },
        "current_user_collections": [
          {
            "id": 206,
            "title": "Makers: Cat and Ben",
            "published_at": "2016-01-12T18:16:09-05:00",
            "last_collected_at": "2016-06-02T13:10:03-04:00",
            "updated_at": "2016-07-10T11:00:01-05:00",
            "cover_photo": null,
            "user": null
          }
        ],
        "urls": {
          "raw": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format",
          "full": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=75&fm=jpg",
          "regular": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=75&fm=jpg&w=1080&fit=max",
          "small": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&q=75&fm=jpg&w=400&fit=max",
          "thumb": "https://images.unsplash.com/photo-1604756505949-b9e2ca999333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&q=75&fm=jpg&w=200&fit=min"
        },
        "links": {
          "self": "https://api.unsplash.com/photos/LBI7cgq3pbM",
          "html": "https://unsplash.com/photos/LBI7cgq3pbM",
          "download": "https://unsplash.com/photos/LBI7cgq3pbM/download",
          "download_location": "https://api.unsplash.com/photos/LBI7cgq3pbM/download"
        }
      }
    ]
    """

    static func getPhotos() -> [Photo] {

        let jsonData = JSON.data(using: .utf8)!

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.dataDecodingStrategy = .deferredToData
        let dummyPhotos: [Photo] = try! decoder.decode(Array<Photo>.self, from: jsonData)

        return dummyPhotos
    }
}
