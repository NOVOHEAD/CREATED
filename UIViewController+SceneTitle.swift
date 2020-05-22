//
//  UIViewController+SceneTitle.swift
//
//
//  Created by Mehmet Tarhan on 22.05.2020.
//  Copyright © 2020 NOVOHEAD. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     Sets navigation bar title to the specified view controller

     - Returns: Title of the specified view controller
     */
    var sceneTitle: String? {
        get { return title }
        set {
            guard let navigationBar = navigationController?.navigationBar else { return }
            let labelWidth = navigationBar.bounds.width - 110
            let label = UILabel(frame: CGRect(x: (navigationBar.bounds.width / 2) - (labelWidth / 2), y: 0, width: labelWidth, height: navigationBar.bounds.height * 2))
            label.backgroundColor = UIColor.clear
            label.numberOfLines = 0
            label.font = UIFont(name: "Futura", size: 32)
            label.textAlignment = .right
            label.textColor = UIColor(named: "navigation-bar-title")
            label.lineBreakMode = .byWordWrapping
            title = newValue?.replacingOccurrences(of: " ", with: "\n").uppercased()
            label.text = title
            navigationBar.topItem?.title = nil
            navigationItem.title = nil
            label.tag = -1
            navigationBar.subviews.forEach { view in
                if view.tag == -1 {
                    view.removeFromSuperview()
                }
            }
            navigationBar.addSubview(label)
        }
    }
}
