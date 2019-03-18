//
//  AnimatedLogintwoViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class AnimatedLogintwoViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var pagecon: UIPageControl!
    @IBOutlet var iamgeview: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
         scrollview.delegate = self
        iamgeview.image = UIImage (named: "one.png")
        self.view.sendSubview(toBack: scrollview)
        let scrollViewWidth:CGFloat = self.scrollview.frame.width
        let scrollViewHeight:CGFloat = self.scrollview.frame.height
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "one.png")
        
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "two.png")
        
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "Three.png")
        
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "four.png")
        self.scrollview.contentSize = CGSize(width:self.scrollview.frame.width * 4, height:self.scrollview.frame.height)
        //self.myscroller.delegate = self
        self.pagecon.currentPage = 0
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    @objc func moveToNextPage ()
    {
        let pageWidth:CGFloat = self.scrollview.frame.width
        let maxWidth:CGFloat = pageWidth * 4
        let contentOffset:CGFloat = self.scrollview.contentOffset.x
        var slideToX = contentOffset + pageWidth
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        self.scrollview.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollview.frame.height), animated: true)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView)
    {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        self.pagecon.currentPage = Int(currentPage);
        if Int(currentPage) == 0
        {
            iamgeview.image = UIImage (named: "one.png")
        }
        else if Int(currentPage) == 1
        {
            iamgeview.image = UIImage (named: "two.png")
        }
        else if Int(currentPage) == 2
        {
            iamgeview.image = UIImage (named: "Three.png")
        }
        else if Int(currentPage) == 3
        {
            iamgeview.image = UIImage (named: "four.png")
        }
        else if Int(currentPage) == 4
        {
            iamgeview.image = UIImage (named: "four.png")
        }
        else
        {
            iamgeview.image = UIImage (named: "one.png")
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                
            })
        }
    }

}
