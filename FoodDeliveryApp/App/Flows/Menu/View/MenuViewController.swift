// MenuViewController.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuViewController: UIViewController, MenuViewInputProtocol {
    let presenter: MenuPresenter?

    private var contentView: MenuView?
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = .large
        return view
    }()

    init(presenter: MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }

    private func configure() {
        presenter?.fetch(completion: { [weak self] menu in
            guard let self else { return }
            self.contentView = MenuView(menu: menu)
//            self.contentView.contentInset = UIEdgeInsets(top: UIApplication.shared.statusBarFrame.height, left: 0,
//            bottom: 0, right: 0)
            if let contentView = self.contentView {
                self.view.addSubview(contentView)
                self.activityIndicator.stopAnimating()
                contentView.snp.makeConstraints { make in
                    make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
                }
            }
        })
    }

    private func configureUI() {
        view.backgroundColor = Colors.backgroundMinor
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }

        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isTranslucent = false
    }
}
