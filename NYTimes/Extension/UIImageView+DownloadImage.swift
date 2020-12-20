//
//  UIImageView+DownloadImage.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImage(_ url: URL, placeholder: UIImage?) {
        kf.setImage(with: url, placeholder: placeholder)
    }
}
