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

    private var errorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Images.error
        imageView.isHidden = true
        return imageView
    }()

    private var errorLabel: AppLabel = {
        let label = AppLabel(
            title: Texts.generalError,
            alignment: .center,
            style: FontStyle.title13,
            fontColor: Colors.textMinor,
            numberLines: 0
        )
        label.isHidden = true
        return label
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

    func showErrorBackground() {
        activityIndicator.stopAnimating()
        errorImageView.isHidden = false
        errorLabel.isHidden = false
        view.backgroundColor = Colors.backgroundMain

        let stackView = UIStackView(arrangedSubviews: [errorImageView, errorLabel])
        stackView.axis = .vertical
        stackView.spacing = Constants.inset8
        stackView.alignment = .center
        view.addSubview(stackView)
        stackView.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
