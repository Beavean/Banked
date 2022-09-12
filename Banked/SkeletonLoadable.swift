//
//  SkeletonLoadable.swift
//  Banked
//
//  Created by Beavean on 10.09.2022.
//

import UIKit

protocol SkeletonLoadable {}

extension SkeletonLoadable {
    
    func makeAnimationGroup(previousGroup: CAAnimationGroup? = nil) -> CAAnimationGroup {
        let animationDuration: CFTimeInterval = 1.5
        let firstAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        firstAnimation.fromValue = UIColor.gradientLightGrey.cgColor
        firstAnimation.toValue = UIColor.gradientDarkGrey.cgColor
        firstAnimation.duration = animationDuration
        firstAnimation.beginTime = 0.0

        let secondAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        secondAnimation.fromValue = UIColor.gradientDarkGrey.cgColor
        secondAnimation.toValue = UIColor.gradientLightGrey.cgColor
        secondAnimation.duration = animationDuration
        secondAnimation.beginTime = firstAnimation.beginTime + firstAnimation.duration

        let group = CAAnimationGroup()
        group.animations = [firstAnimation, secondAnimation]
        group.repeatCount = .greatestFiniteMagnitude // infinite
        group.duration = secondAnimation.beginTime + secondAnimation.duration
        group.isRemovedOnCompletion = false

        if let previousGroup = previousGroup {
            group.beginTime = previousGroup.beginTime + 0.33
        }

        return group
    }
}

extension UIColor {
    static var gradientDarkGrey: UIColor {
        return UIColor(red: 239 / 255.0, green: 241 / 255.0, blue: 241 / 255.0, alpha: 1)
    }

    static var gradientLightGrey: UIColor {
        return UIColor(red: 201 / 255.0, green: 201 / 255.0, blue: 201 / 255.0, alpha: 1)
    }
}
