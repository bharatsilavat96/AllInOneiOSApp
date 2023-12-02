//
//  TosterView.swift
//  DFAssesment
//
//  Created by Bharat Shilavat on 30/11/23.
//

import Foundation
import UIKit

class ToastView: UIView {
    
    private let successLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18) // Bold and larger font for success label
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(successMessage: String, message: String, icon: UIImage? = nil) {
        super.init(frame: .zero)
        setupView()
        successLabel.text = successMessage
        messageLabel.text = message
        iconImageView.image = icon
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 8
        
        addSubview(successLabel)
        addSubview(iconImageView)
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            successLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            successLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            
            messageLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
