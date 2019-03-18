//
//  UIActivityViewController+Title.swift
//  TitledActivitiesDemo
//
//  Created by Jerry Yu on 2016-02-15.
//  Copyright © 2016 Jerry Yu. All rights reserved.
//

import UIKit


// Identify the fxView to fade out title when disappearing
private let myTag = 3141592

extension UIActivityViewController {

	func addTitle(title: String) {

		// Container for title label, used to get blur effect.
        let fxView = UIView()
		fxView.translatesAutoresizingMaskIntoConstraints = false
		fxView.tag = myTag
		fxView.layer.cornerRadius = 8
		fxView.clipsToBounds = true

		// Pretty hacky
        
        self.view.subviews.first?.addSubview(fxView)
		// Actual title label
		let titleLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.systemFont(ofSize: 19)
		titleLabel.text = title
        titleLabel.textColor = UIColor.darkText
		fxView.addSubview(titleLabel)


		// Autolayout the views
		let views = [
			"fx": fxView,
			"label": titleLabel,
		]

		let formatStrings = [
			// fx has full width, negative `y` origin
			"H:|[fx]|",
			"V:|-(-56)-[fx(50)]",

			// Title label has horizontal padding
			"H:|-13-[label]-13-|",
			"V:|[label]|"
		]

		formatStrings.forEach { format in
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: format, options:[] , metrics: nil, views: views)
            NSLayoutConstraint.activate(constraints)
		}
	}

    open override func viewWillDisappear(_ animated: Bool) {
		// Animate the alpha, otherwise the title label will peek out
        self.transitionCoordinator?.animate(alongsideTransition: { (context) -> Void in
			if let containerView = self.view.subviews.first!.subviews.first!.viewWithTag(myTag) { // Definitely hacky
				containerView.alpha = 0
			}
		}, completion: nil)

		super.viewWillDisappear(animated)
	}
}
