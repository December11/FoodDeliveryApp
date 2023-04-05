// AddToCartButton.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class AddToCartButton: UIControl {
    let buttonWasTapped: (() -> ())? = nil

    private let titleLabel = AppLabel(alignment: .center, style: FontStyle.subtitle, fontColor: Colors.accent)

    init() {
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) { nil }

    func configure(title: String) {
        titleLabel.text = title
    }

    private func configureUI() {
        addSubview(titleLabel)
        roundCorners([.allCorners], radius: Constants.inset6)
        layer.borderWidth = Constants.inset1
        layer.borderColor = Colors.accent?.cgColor
        addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)

        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Constants.inset16)
            make.verticalEdges.equalToSuperview().inset(Constants.inset8)
        }
    }

    @objc private func buttonTapped() {
        buttonWasTapped?()
    }
}
