//
//  MJMaterialSwitch.swift
//  MJMaterialSwitch
//
//  Created by Jaleel on 3/21/17.
//  Copyright © 2017 Glynk. All rights reserved.
//

import UIKit
public enum MJMaterialSwitchStyle {
    case light, dark, medium
}
public enum MJMaterialSwitchState {
    case on, off
}

public enum MJMaterialSwitchSize {
    case big, normal, small
}

class MJMaterialSwitch: UIControl {
    var isOn: Bool = false
    var isBounceEnabled: Bool = false {
        didSet {
            if self.isBounceEnabled {
                self.bounceOffset = 3.0
            } else {
                self.bounceOffset = 0.0
            }
        }
    }

    var isRippleEnabled: Bool = false

    var thumbOnTintColor: UIColor!

    var thumbOffTintColor: UIColor!

    var trackOnTintColor: UIColor!

    var trackOffTintColor: UIColor!

    var thumbDisabledTintColor: UIColor!

    var trackDisabledTintColor: UIColor!

    var rippleFillColor: UIColor = .gray

    var switchThumb: UIButton!
    var track: UIView!

    var trackThickness: CGFloat!

    var thumbSize: CGFloat!


    fileprivate var thumbOnPosition: CGFloat!
    fileprivate var thumbOffPosition: CGFloat!
    fileprivate var bounceOffset: CGFloat!
    fileprivate var thumbStyle: MJMaterialSwitchStyle!
    fileprivate var rippleLayer: CAShapeLayer!



    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(withSize size: MJMaterialSwitchSize, state: MJMaterialSwitchState) {

        var frame: CGRect!
        var trackFrame = CGRect.zero
        var thumbFrame = CGRect.zero


        switch (size) {
        case .big:
            frame = CGRect(x: 0, y: 0, width: 50, height: 40)
            self.init(frame: frame)
            self.trackThickness = 23.0
            self.thumbSize = 31.0
            break

        case .normal:
            frame = CGRect(x: 0, y: 0, width: 40, height: 30)
            self.init(frame: frame)
            self.trackThickness = 17.0
            self.thumbSize = 24.0
            break

        case .small:
            frame = CGRect(x: 0, y: 0, width: 30, height: 25)
            self.init(frame: frame)
            self.trackThickness = 13.0
            self.thumbSize = 18.0
            break
        }

        // initialize parameters

        self.thumbOnTintColor  = UIColor(red:52.0 / 255.0, green:109.0 / 255.0, blue:241.0 / 255.0, alpha:1.0)
        self.thumbOffTintColor = UIColor(red:249.0 / 255.0, green:249.0 / 255.0, blue:249.0 / 255.0, alpha:1.0)

        self.trackOnTintColor = UIColor(red:143.0 / 255.0, green:179.0 / 255.0, blue:247.0 / 255.0, alpha:1.0)
        self.trackOffTintColor = UIColor(red:193.0 / 255.0, green:193.0 / 255.0, blue:193.0 / 255.0, alpha:1.0)

        self.thumbDisabledTintColor = UIColor(red:174.0 / 255.0, green:174.0 / 255.0, blue:174.0 / 255.0, alpha:1.0)
        self.trackDisabledTintColor = UIColor(red:203.0 / 255.0, green:203.0 / 255.0, blue:203.0 / 255.0, alpha:1.0)

        self.isEnabled = true

//        self.isRippleEnabled = true
//        self.isBounceEnabled = true

        self.bounceOffset = 3.0

        trackFrame.size.height = self.trackThickness
        trackFrame.size.width = frame.size.width
        trackFrame.origin.x = 0.0
        trackFrame.origin.y = (frame.size.height - trackFrame.size.height) / 2
        thumbFrame.size.height = self.thumbSize
        thumbFrame.size.width = thumbFrame.size.height
        thumbFrame.origin.x = 0.0
        thumbFrame.origin.y = (frame.size.height - thumbFrame.size.height) / 2

        self.track = UIView(frame: trackFrame)
        self.track.backgroundColor = .gray
        self.track.layer.cornerRadius = min(self.track.frame.size.height, self.track.frame.size.width) / 2
        self.addSubview(self.track)

        self.switchThumb = UIButton(frame: thumbFrame)
        self.switchThumb.backgroundColor = .white
        self.switchThumb.layer.cornerRadius = self.switchThumb.frame.size.height/2
        self.switchThumb.layer.shadowOpacity = 0.5
        self.switchThumb.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)

        self.switchThumb.layer.shadowColor = UIColor.black.cgColor
        self.switchThumb.layer.shadowRadius = 2.0

        // Add events for user action
        self.switchThumb.addTarget(self, action: #selector(self.onTouchDown(btn:withEvent:)), for: UIControlEvents.touchDown)
        self.switchThumb.addTarget(self, action: #selector(onTouchUpOutsideOrCanceled(btn:withEvent:)), for: UIControlEvents.touchUpOutside)
        self.switchThumb.addTarget(self, action: #selector(self.switchThumbTapped), for: UIControlEvents.touchUpInside)
        self.switchThumb.addTarget(self, action: #selector(self.onTouchDragInside(btn:withEvent:)), for: UIControlEvents.touchDragInside)
        self.switchThumb.addTarget(self, action: #selector(self.onTouchUpOutsideOrCanceled(btn:withEvent:)), for: UIControlEvents.touchCancel)

        self.addSubview(self.switchThumb)

        thumbOnPosition = self.frame.size.width - self.switchThumb.frame.size.width
        thumbOffPosition = self.switchThumb.frame.origin.x

        // Set thumb's initial position from state property
        switch state {
        case .on:
            self.isOn = true
            self.switchThumb.backgroundColor = self.thumbOnTintColor
            var thumb_Frame = self.switchThumb.frame
            thumb_Frame.origin.x = self.thumbOnPosition
            self.switchThumb.frame = thumb_Frame
            break

        case .off:
            self.isOn = false
            self.switchThumb.backgroundColor = self.thumbOffTintColor

            var thumb_Frame = self.switchThumb.frame
            thumb_Frame.origin.x = self.thumbOffPosition
            self.switchThumb.frame = thumb_Frame
            break
        }

        let singleTap = UITapGestureRecognizer(target: self, action: #selector(self.switchAreaTapped(recognizer:)))
        self.addGestureRecognizer(singleTap)

        self.setOn(on: self.isOn, animated: self.isRippleEnabled)

    }

    /**
     *  Initializes a MJMaterialSwitch with a initial switch size, style and state.
     *
     *  @param size A MJMaterialSwitchSize enum as this view's size(big, normal, small)
     *  @param state A MJMaterialSwitchStyle enum as this view's initial style
     *  @param state A MJMaterialSwitchState enum as this view's initial switch pos(ON/OFF)
     *
     *  @return A JTFadingInfoView with size, style and initial position
     */

    // Designated initializer with size, style and state
    convenience init(withSize size: MJMaterialSwitchSize, style: MJMaterialSwitchStyle, state: MJMaterialSwitchState) {
        self.init(withSize: size, state: state)

        self.thumbStyle = style

        // Determine switch style from preset colour set
        // Light and Dark color styles come from Google's design guidelines
        // https://www.google.com/design/spec/components/selection-controls.html
        switch style {
        case .light:
            self.thumbOnTintColor  = UIColor(red:0.0/255.0, green:134.0/255.0, blue:117.0/255.0, alpha:1.0)
            self.thumbOffTintColor = UIColor(red:237.0/255.0, green:237.0/255.0, blue:237.0/255.0, alpha:1.0)
            self.trackOnTintColor = UIColor(red:90.0/255.0, green:178.0/255.0, blue:169.0/255.0, alpha:1.0)
            self.trackOffTintColor = UIColor(red:129.0/255.0, green:129.0/255.0, blue:129.0/255.0, alpha:1.0)
            self.thumbDisabledTintColor = UIColor(red:175.0/255.0, green:175.0/255.0, blue:175.0/255.0, alpha:1.0)
            self.trackDisabledTintColor = UIColor(red:203.0/255.0, green:203.0/255.0, blue:203.0/255.0, alpha:1.0)
            break

        case .medium:

            self.thumbOnTintColor  = UIColor(red:52.0/255.0, green:109.0/255.0, blue:241.0/255.0, alpha:1.0)
            self.thumbOffTintColor = UIColor(red:249.0/255.0, green:249.0/255.0, blue:249.0/255.0, alpha:1.0)
            self.trackOnTintColor = UIColor(red:143.0/255.0, green:179.0/255.0, blue:247.0/255.0, alpha:1.0)
            self.trackOffTintColor = UIColor(red:193.0/255.0, green:193.0/255.0, blue:193.0/255.0, alpha:1.0)
            self.thumbDisabledTintColor = UIColor(red:174.0/255.0, green:174.0/255.0, blue:174.0/255.0, alpha:1.0)
            self.trackDisabledTintColor = UIColor(red:203.0/255.0, green:203.0/255.0, blue:203.0/255.0, alpha:1.0)
            break

        case .dark:
            self.thumbOnTintColor  = UIColor(red:233.0/255.0, green:30.0/255.0, blue:99.0/255.0, alpha:1.0)
            self.thumbOffTintColor = UIColor(red:175.0/255.0, green:175.0/255.0, blue:175.0/255.0, alpha:1.0)

            self.trackOnTintColor = UIColor(red:240.0/255.0, green:98.0/255.0, blue:146.0/255.0, alpha:1.0)
            self.trackOffTintColor = UIColor(red:94.0/255.0, green:94.0/255.0, blue:94.0/255.0, alpha:1.0)

            self.thumbDisabledTintColor = UIColor(red:50.0/255.0, green:51.0/255.0, blue:50.0/255.0, alpha:1.0)
            self.trackDisabledTintColor = UIColor(red:56.0/255.0, green:56.0/255.0, blue:56.0/255.0, alpha:1.0)
            break

        }

        self.setOn(on: self.isOn, animated: self.isRippleEnabled)

    }


    func getSwitchState() -> Bool {
        return self.isOn
    }

    func setOn(on: Bool, animated: Bool)  {
        if on {
            if animated {
                self.changeThumbStateONwithAnimation()
            } else {
                self.changeThumbStateONwithoutAnimation()
            }
        } else {
            if animated {
                self.changeThumbStateOFFwithAnimation()
            } else {
                self.changeThumbStateOFFwithoutAnimation()
            }
        }
    }

    func setEnabled(enabled: Bool)  {
        super.isEnabled = enabled
        UIView.animate(withDuration: 0.1) {
            if enabled {
                if self.isOn {
                    self.switchThumb.backgroundColor = self.thumbOnTintColor
                    self.track.backgroundColor = self.trackOnTintColor
                } else {
                    self.switchThumb.backgroundColor = self.thumbOffTintColor
                    self.track.backgroundColor = self.trackOffTintColor
                }
                self.isEnabled = true

            } else
            {
                self.switchThumb.backgroundColor = self.thumbDisabledTintColor
                self.track.backgroundColor = self.trackDisabledTintColor
                self.isEnabled = false
            }
        }
    }

    @objc func switchAreaTapped(recognizer: UITapGestureRecognizer)
    {
        self.changeThumbState()
    }

    func changeThumbState() {

        if self.isOn {
            self.changeThumbStateOFFwithAnimation()
        } else {
            self.changeThumbStateONwithAnimation()
        }

        if self.isRippleEnabled {
            self.animateRippleEffect()
        }
    }

    func changeThumbStateONwithAnimation() {

        UIView.animate(withDuration: 0.15, delay: 0.05, options: UIViewAnimationOptions.curveEaseInOut, animations: {

            var thumbFrame = self.switchThumb.frame
            thumbFrame.origin.x = self.thumbOnPosition + self.bounceOffset
            self.switchThumb.frame = thumbFrame
            if self.isEnabled {
                self.switchThumb.backgroundColor = self.thumbOnTintColor
                self.track.backgroundColor = self.trackOnTintColor
            } else {
                self.switchThumb.backgroundColor = self.thumbDisabledTintColor
                self.track.backgroundColor = self.trackDisabledTintColor
            }
            self.isUserInteractionEnabled = false

        }) { (finished) in

            if !self.isOn {
                self.isOn = true
                self.sendActions(for: UIControlEvents.valueChanged)
            }
         
            UIView.animate(withDuration: 0.15, animations: {
                var thumbFrame = self.switchThumb.frame
                thumbFrame.origin.x = self.thumbOnPosition
                self.switchThumb.frame = thumbFrame

            }, completion: { (finished) in
                self.isUserInteractionEnabled = true
            })
        }
    }

    func changeThumbStateOFFwithAnimation() {

        UIView.animate(withDuration: 0.15, delay: 0.05, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            var thumbFrame = self.switchThumb.frame
            thumbFrame.origin.x = self.thumbOffPosition - self.bounceOffset
            self.switchThumb.frame = thumbFrame
            if self.isEnabled {
                self.switchThumb.backgroundColor = self.thumbOffTintColor
                self.track.backgroundColor = self.trackOffTintColor
            } else {
                self.switchThumb.backgroundColor = self.thumbDisabledTintColor
                self.track.backgroundColor = self.trackDisabledTintColor
            }
            self.isUserInteractionEnabled = false

        }) { (finished) in

            if self.isOn {
                self.isOn = false
                self.sendActions(for: UIControlEvents.valueChanged)
            }
  
            UIView.animate(withDuration: 0.15, animations: {
                var thumbFrame = self.switchThumb.frame
                thumbFrame.origin.x = self.thumbOffPosition
                self.switchThumb.frame = thumbFrame
            }, completion: { (finish) in
                self.isUserInteractionEnabled = true
            })
        }
    }

    func changeThumbStateONwithoutAnimation() {

        var thumbFrame = self.switchThumb.frame
        thumbFrame.origin.x = thumbOnPosition
        self.switchThumb.frame = thumbFrame
        if self.isEnabled {
            self.switchThumb.backgroundColor = self.thumbOnTintColor
            self.track.backgroundColor = self.trackOnTintColor
        } else {
            self.switchThumb.backgroundColor = self.thumbDisabledTintColor
            self.track.backgroundColor = self.trackDisabledTintColor
        }

        if !self.isOn {
            self.isOn = true
            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }

    func changeThumbStateOFFwithoutAnimation() {

        var thumbFrame = self.switchThumb.frame
        thumbFrame.origin.x = thumbOffPosition
        self.switchThumb.frame = thumbFrame

        if self.isEnabled {
            self.switchThumb.backgroundColor = self.thumbOffTintColor
            self.track.backgroundColor = self.trackOffTintColor
        } else {
            self.switchThumb.backgroundColor = self.thumbDisabledTintColor
            self.track.backgroundColor = self.trackDisabledTintColor
        }

        if self.isOn {
            self.isOn = false
            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }

    func initializeRipple()
    {
        let rippleScale : CGFloat = 2
        var rippleFrame = CGRect.zero
        rippleFrame.origin.x = -self.switchThumb.frame.size.width / (rippleScale * 2)
        rippleFrame.origin.y = -self.switchThumb.frame.size.height / (rippleScale * 2)
        rippleFrame.size.height = self.switchThumb.frame.size.height * rippleScale
        rippleFrame.size.width = rippleFrame.size.height

        let path = UIBezierPath.init(roundedRect: rippleFrame, cornerRadius: self.switchThumb.layer.cornerRadius*2)
        rippleLayer = CAShapeLayer()
        rippleLayer.path = path.cgPath
        rippleLayer.frame = rippleFrame
        rippleLayer.opacity = 0.2
        rippleLayer.strokeColor = UIColor.clear.cgColor
        rippleLayer.fillColor = self.rippleFillColor.cgColor
        rippleLayer.lineWidth = 0

        self.switchThumb.layer.insertSublayer(rippleLayer, below: self.switchThumb.layer)
    }

    func animateRippleEffect() {
        if rippleLayer == nil {
            self.initializeRipple()
        }
        rippleLayer?.opacity = 0.0

        CATransaction.begin()

        CATransaction.setCompletionBlock {
            self.rippleLayer?.removeFromSuperlayer()
            self.rippleLayer = nil
        }

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.5
        scaleAnimation.toValue = 1.25

        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 0.4
        alphaAnimation.toValue = 0

        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation, alphaAnimation]
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        rippleLayer?.add(animation, forKey: nil)

        CATransaction.commit()

    }

    @objc func onTouchDown(btn: UIButton, withEvent event: UIEvent) {

        if self.isRippleEnabled {
            self.initializeRipple()
            CATransaction.begin()

            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 0.0
            scaleAnimation.toValue = 1.0

            let alphaAnimation = CABasicAnimation(keyPath:"opacity")
            alphaAnimation.fromValue = 0
            alphaAnimation.toValue = 0.2
            let animation = CAAnimationGroup()
            animation.animations = [scaleAnimation, alphaAnimation]
            animation.duration = 0.4
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            rippleLayer?.add(animation, forKey: nil)
            CATransaction.commit()
        }
    }

    @objc func switchThumbTapped() {
        self.changeThumbState()
    }

    @objc func onTouchUpOutsideOrCanceled(btn: UIButton, withEvent event: UIEvent) {

        if let touch = event.touches(for: btn)?.first {

            let prevPos = touch.previousLocation(in: btn)
            let pos = touch.location(in: btn)

            let dX = pos.x - prevPos.x

            let newXOrigin = btn.frame.origin.x + dX

            if (newXOrigin > (self.frame.size.width - self.switchThumb.frame.size.width)/2) {
                self.changeThumbStateONwithAnimation()
            } else {
                self.changeThumbStateOFFwithAnimation()
            }

            if self.isRippleEnabled {
                self.animateRippleEffect()
            }
        }
    }

    @objc func onTouchDragInside(btn: UIButton, withEvent event:UIEvent) {
        
        if let touch = event.touches(for: btn)?.first {
            let prevPos = touch.previousLocation(in: btn)
            let pos = touch.location(in: btn)
            let dX = pos.x - prevPos.x
            var thumbFrame = btn.frame
            thumbFrame.origin.x += dX
            thumbFrame.origin.x = min(thumbFrame.origin.x, thumbOnPosition)
            thumbFrame.origin.x = max(thumbFrame.origin.x, thumbOffPosition)
            if thumbFrame.origin.x != btn.frame.origin.x {
                btn.frame = thumbFrame
            }
        }
    }
}
