//
//  TestView.swift
//  MVVMExample
//
//  Created by Nurken Yerzhan on 14.11.2022.
//

import UIKit

class TestView: UIView {
    //обработчик ViewData
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            showActivityIndicator(shouldShow: false)
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            showActivityIndicator(shouldShow: true)
        case .success(let success):
            update(viewData: success, isHidden: false)
            showActivityIndicator(shouldShow: false)
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            showActivityIndicator(shouldShow: false)
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        
        imageView.isHidden = isHidden
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
    
    private func showActivityIndicator(shouldShow: Bool) {
        switch shouldShow {
        case true:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case false:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
}
