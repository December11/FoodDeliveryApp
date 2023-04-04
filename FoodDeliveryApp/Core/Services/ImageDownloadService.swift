// ImageDownloadService.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol Downloadable {
    func download(url: URL, completion: @escaping (UIImage) -> ())
}

private enum Parameters {
    static let memoryCapacity = 16384
    static let diskCapacity = 268_435_456
}

final class ImageDownloadService: Downloadable {
    func download(url: URL, completion: @escaping (UIImage) -> ()) {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(
            memoryCapacity: Parameters.memoryCapacity,
            diskCapacity: Parameters.diskCapacity,
            diskPath: "myImageCache"
        )
        let session = URLSession(configuration: configuration)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, _ in
            let cachedResponse = URLCache.shared.cachedResponse(for: request)
            if let data = cachedResponse?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else if let data, let image = UIImage(data: data) {
                if let response {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                }
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
        task.resume()
    }
}
