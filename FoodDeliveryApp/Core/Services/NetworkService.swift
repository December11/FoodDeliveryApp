// NetworkService.swift
// Copyright © Alla Shkolnik. All rights reserved.

import Foundation

protocol RequestProtocol {
    func fetch(completion: @escaping (Result<[MenuDTO], Error>) -> Void)
}

final class NetworkService: RequestProtocol {
    private let session = URLSession.shared

    func fetch(completion: @escaping (Result<[MenuDTO], Error>) -> Void) {
        guard let url = URL(string: Constants.datasourceURL) else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard error == nil, let data else {
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
                return
            }
            do {
                let listDTO = try JSONDecoder().decode([MenuDTO].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(listDTO))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
