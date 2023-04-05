// AppImageView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class AppImageView: UIImageView {
    private let downloadService: Downloadable
    private let activityIndicator: UIActivityIndicatorView = {
        let indicatorStyle = UIActivityIndicatorView.Style.medium
        let activityIndicator = UIActivityIndicatorView(style: indicatorStyle)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    init(service: Downloadable = ImageDownloadService(), contentMode: ContentMode) {
        downloadService = service
        super.init(frame: .zero)
        self.contentMode = contentMode
        configureActivityIndicator()
    }

    required init?(coder: NSCoder) { nil }

    func downloadedImage(URLString: String) {
        guard let url = URL(string: URLString) else { return }
        downloadService.download(url: url) { [weak self] image in
            guard let self else { return }
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
            self.image = image
        }
    }

    private func configureActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
        }
    }
}
