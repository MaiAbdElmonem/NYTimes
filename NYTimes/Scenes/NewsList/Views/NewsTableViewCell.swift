//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell, CellReusable {

    private let rightArrowImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "right_arrow")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 5),
            imageView.heightAnchor.constraint(equalToConstant: 10)
        ])
        return imageView
    }()

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 5
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        return imageView
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(dateLabel)
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 9)
        label.textColor = .quaternaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        UIView.animate(withDuration: 0.18) {
            self.contentView.backgroundColor = highlighted ? .tertiarySystemBackground : .clear
            self.selectionStyle = .none
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.kf.cancelDownloadTask()
        thumbnailImageView.image = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }

        set {
            super.isHighlighted = newValue

            if newValue {
                UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1.2, initialSpringVelocity: 1.75, options: .curveEaseOut, animations: {
                    self.transform = self.transform.scaledBy(x: 0.9, y: 0.9)
                })
            } else {
                UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                })
            }
        }
    }

    private func setupViews() {

        [thumbnailImageView, labelsStackView, rightArrowImageView].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            thumbnailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: labelsStackView.leadingAnchor, constant: -14),

            labelsStackView.trailingAnchor.constraint(equalTo: rightArrowImageView.leadingAnchor, constant: -11),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7),
            labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),

            rightArrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])

    }

    func configureView(_ uiModel: UIModel) {
        titleLabel.text = uiModel.title
        subtitleLabel.text = uiModel.subtitle
        dateLabel.text = uiModel.date
        if let imageUrl = uiModel.imageUrl, let url = URL(string: imageUrl) {
            thumbnailImageView.setImage(url,placeholder: UIImage(named: "Logo"))
        }
    }
}

extension NewsTableViewCell {
    struct UIModel {
        var title: String
        var subtitle: String
        var date: String
        var imageUrl: String?
    }
}
