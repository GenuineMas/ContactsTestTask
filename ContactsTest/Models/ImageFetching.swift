//
//  FetchData.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//class ImageLoader: ObservableObject {
//
//
//    var didChange = PassthroughSubject<Data, Never>()
//  //  var contact:Contact
//    var data = Data() {
//        didSet {
//            didChange.send(data)
//        }
//    }
//
//   init(imageUrl: String) {
//        // fetch image data and then call didChange
//        guard let url = URL(string: imageUrl) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            guard let data = data else { return }
//
//            DispatchQueue.main.async {
//                self.data = data
//            }
//
//        }.resume()
//    }
//}
//
//struct ImageViewWidget: View {
//
//    @ObservedObject var imageLoader: ImageLoader
//
//    init(imageUrl: String) {
//        self.imageLoader = ImageLoader(imageUrl: imageUrl)
//        print(imageLoader.data)
//    }
//
//    var body: some View {
//        Image(uiImage:  UIImage(data: imageLoader.data) ?? UIImage(named: "Icon")! )
//            .resizable()
//
//          //  .frame(width: 50, height: 50)
//    }
//}
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()

    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }

    func loadImage() {
        if loadImageFromCache() {
            print("Cache hit")
            return
        }

        print("Cache miss, loading from url")
        loadImageFromUrl()
    }

    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }

        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }

        image = cacheImage
        return true
    }

    func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }

        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }


    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }

        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }

            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()

    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }

    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {

        Image(uiImage:imageLoader.image ?? UIImage() )
                .resizable()
                .aspectRatio(contentMode: .fit)
    }
}
