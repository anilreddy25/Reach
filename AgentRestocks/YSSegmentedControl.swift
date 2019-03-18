//
//  YSSegmentedControl.swift
//  yemeksepeti
//
//  Created by Cem Olcay on 22/04/15.
//  Copyright (c) 2015 yemeksepeti. All rights reserved.
//

import UIKit



public struct YSSegmentedControlAppearance {
    public var backgroundColor: UIColor
    public var selectedBackgroundColor: UIColor
    public var textColor: UIColor
    public var font: UIFont
    public var selectedTextColor: UIColor
    public var selectedFont: UIFont
    public var bottomLineColor: UIColor
    public var selectorColor: UIColor
    public var bottomLineHeight: CGFloat
    public var selectorHeight: CGFloat
    public var labelTopPadding: CGFloat
    
}


typealias YSSegmentedControlItemAction = (_ item: YSSegmentedControlItem) -> Void

class YSSegmentedControlItem: UIControl {
    
  
    
    fileprivate var willPress: YSSegmentedControlItemAction?
    fileprivate var didPressed: YSSegmentedControlItemAction?
    var label: UILabel!

    
    init (
        frame: CGRect,
        text: String,
        appearance: YSSegmentedControlAppearance,
        willPress: YSSegmentedControlItemAction?,
        didPressed: YSSegmentedControlItemAction?) {
            super.init(frame: frame)
            self.willPress = willPress
            self.didPressed = didPressed
            label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            label.textColor = appearance.textColor
            label.font = appearance.font
            label.textAlignment = .center
            label.text = text
            addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        willPress?(self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressed?(self)
    }
}



@objc public protocol YSSegmentedControlDelegate {
    @objc optional func segmentedControlWillPressItemAtIndex (_ segmentedControl: YSSegmentedControl, index: Int)
    @objc optional func segmentedControlDidPressedItemAtIndex (_ segmentedControl: YSSegmentedControl, index: Int)
}

public typealias YSSegmentedControlAction = (_ segmentedControl: YSSegmentedControl, _ index: Int) -> Void

open class YSSegmentedControl: UIView {
    
  
    
    weak var delegate: YSSegmentedControlDelegate?
    var action: YSSegmentedControlAction?
    
    open var appearance: YSSegmentedControlAppearance! {
        didSet {
            self.draw()
        }
    }
    
    var titles: [String]!
    var items: [YSSegmentedControlItem]!
    var selector: UIView!

    public init (frame: CGRect, titles: [String], action: YSSegmentedControlAction? = nil) {
        super.init (frame: frame)
        self.action = action
        self.titles = titles
        defaultAppearance()
    }
    
    required public init? (coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
    }
    
    // MARK: Draw
    
    fileprivate func reset () {
        for sub in subviews {
            let v = sub
            v.removeFromSuperview()
        }
        items = []
    }
    
    fileprivate func draw () {
        reset()
        backgroundColor = appearance.backgroundColor
        let width = frame.size.width / CGFloat(titles.count)
        var currentX: CGFloat = 0
        for title in titles {
            let item = YSSegmentedControlItem(
                frame: CGRect(
                    x: currentX,
                    y: appearance.labelTopPadding,
                    width: width,
                    height: frame.size.height - appearance.labelTopPadding),
                text: title,
                appearance: appearance,
                willPress: { segmentedControlItem in
                    let index = self.items.index(of: segmentedControlItem)!
                    self.delegate?.segmentedControlWillPressItemAtIndex?(self, index: index)
                },
                didPressed: {
                    segmentedControlItem in
                    let index = self.items.index(of: segmentedControlItem)!
                    self.selectItemAtIndex(index, withAnimation: true)
                    self.action?(self, index)
                    self.delegate?.segmentedControlDidPressedItemAtIndex?(self, index: index)
            })
            addSubview(item)
            items.append(item)
            currentX += width
        }
        // bottom line
        let bottomLine = CALayer ()
        bottomLine.frame = CGRect(
            x: 0,
            y: frame.size.height - appearance.bottomLineHeight,
            width: frame.size.width,
            height: appearance.bottomLineHeight)
        bottomLine.backgroundColor = appearance.bottomLineColor.cgColor
        layer.addSublayer(bottomLine)
        // selector
        selector = UIView (frame: CGRect (
            x: 0,
            y: frame.size.height - appearance.selectorHeight,
            width: width,
            height: appearance.selectorHeight))
        selector.backgroundColor = appearance.selectorColor
        addSubview(selector)
        
        selectItemAtIndex(0, withAnimation: true)
    }
    
    fileprivate func defaultAppearance () {
        appearance = YSSegmentedControlAppearance(
            backgroundColor: UIColor.clear,
            selectedBackgroundColor: UIColor.clear,
            textColor: UIColor(red: 106/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0),
            font: UIFont(name: ".SFUITEXT-light", size: 15.0)!,
            selectedTextColor: UIColor.black,
            selectedFont: UIFont(name: ".SFUITEXT-Medium", size: 15.0)!,
            bottomLineColor: UIColor.textfiledbottomcolorside(),
            selectorColor: UIColor.black,
            bottomLineHeight: 0.5,
            selectorHeight: 0.8,
            labelTopPadding: 0)
    }
    

    
    open func selectItemAtIndex (_ index: Int, withAnimation: Bool) {
        moveSelectorAtIndex(index, withAnimation: withAnimation)
        for item in items {
            if item == items[index] {
                item.label.textColor = appearance.selectedTextColor
                item.label.font = appearance.selectedFont
                item.backgroundColor = appearance.selectedBackgroundColor
            } else {
                item.label.textColor = appearance.textColor
                item.label.font = appearance.font
                item.backgroundColor = appearance.backgroundColor
            }
        }
    }
    
    fileprivate func moveSelectorAtIndex (_ index: Int, withAnimation: Bool) {
        let width = frame.size.width / CGFloat(items.count)
        let target = width * CGFloat(index)
        UIView.animate(withDuration: withAnimation ? 0.3 : 0,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                [unowned self] in
                self.selector.frame.origin.x = target
            },
            completion: nil)
    }
}
