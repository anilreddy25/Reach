//
//  AnimationLoginViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import CoreData

class AnimationLoginViewController: UIViewController,UIScrollViewDelegate
{
    @IBOutlet var scrollview: UIScrollView!
    var colors = [UIView]()
    @IBOutlet var pagecontroller: UIPageControl!
    @IBOutlet var viewone: UIView!
    @IBOutlet var viewtwo: UIView!
    @IBOutlet var viewthree: UIView!
    @IBOutlet var viewfour: UIView!
    @IBOutlet weak var imageone: UIImageView!
    @IBOutlet weak var imagetwo: UIImageView!
    @IBOutlet weak var iamgethree: UIImageView!
    @IBOutlet weak var iamgefour: UIImageView!
    @IBOutlet weak var mygetstartedbutton: UIButton!
    @IBOutlet weak var mygetstartedtwo: UIButton!
    @IBOutlet weak var getstartedfour: UIButton!
    @IBOutlet weak var mygetstartedthree: UIButton!
    @IBOutlet weak var yourmobilenumber: UILabel!
    var timer = Timer()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        colors = [viewone,viewtwo,viewthree,viewfour]

        mygetstartedbutton.layer.cornerRadius = 24
        mygetstartedbutton.clipsToBounds = true
        mygetstartedtwo.layer.cornerRadius = 24
        mygetstartedtwo.clipsToBounds = true
        mygetstartedthree.layer.cornerRadius = 24
        mygetstartedthree.clipsToBounds = true
        getstartedfour.layer.cornerRadius = 24
        getstartedfour.clipsToBounds = true
        scrollview.delegate = self

        timer = Timer.scheduledTimer(timeInterval:4, target: self, selector: #selector(moveToNextPageone), userInfo: nil, repeats: true)

        DispatchQueue.main.async {
            self.loadScrollView()
            
        }
        
//        Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(moveToNextImage), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextPageone ()
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
        self.pagecontroller.currentPage = Int(currentPage);
       
        if Int(currentPage) == 0
        {
            imageone.image = UIImage (named: "flash_1.png")
        }
        else if Int(currentPage) == 1
        {
            imagetwo.image = UIImage (named: "flash_2.png")
        }
        else if Int(currentPage) == 2
        {
            iamgethree.image = UIImage (named: "flash_3.png")
        }
        else if Int(currentPage) == 3
        {
            iamgefour.image = UIImage (named: "flash_4.png")
        }
       
        else
        {
            imageone.image = UIImage (named: "flash_1.png")
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                
            })
        }
    }
    
     func loadScrollView()
    {
            let pageCount : CGFloat = CGFloat(colors.count)
            scrollview.backgroundColor = UIColor.clear
            scrollview.delegate = self as UIScrollViewDelegate
            scrollview.isPagingEnabled = true
            scrollview.contentSize = CGSize(width:scrollview.frame.size.width * pageCount, height:scrollview.frame.size.height)
            scrollview.showsHorizontalScrollIndicator = false
            pagecontroller.numberOfPages = Int(pageCount)
            pagecontroller.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
            for i in 0..<Int(pageCount) {
                let image = UIView(frame: CGRect(x:self.scrollview.frame.size.width * CGFloat(i), y:0, width:self.scrollview.frame.size.width, height:self.scrollview.frame.size.height))
                
                image.addSubview(colors[i])
                image.contentMode = UIViewContentMode.scaleAspectFit
                self.scrollview.addSubview(image)
            }
       
    }
 
    @objc func pageChanged()
    {
        let pageNumber = pagecontroller.currentPage
        var frame = scrollview.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrollview.scrollRectToVisible(frame, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let viewWidth: CGFloat = scrollView.frame.size.width
        let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
        pagecontroller.currentPage = Int(pageNumber)
    }
    
    @IBAction func Mygetstarted(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
//                self.view.removeFromSuperview()
//                Timer.self = nil
                self.timer.invalidate()
//                self.scrollview.isHidden = true
                self.view.backgroundColor = UIColor.clear
            let secodnd = self.storyboard?.instantiateViewController(withIdentifier:"MobileViewController")as!MobileViewController
        self.present(secodnd, animated:true, completion:nil)
        }
    }
    
     @objc func moveToNextImage ()
     {
        let imgsCount:CGFloat = CGFloat(colors.count)
        let pageWidth:CGFloat = self.scrollview.frame.width
        let maxWidth:CGFloat = pageWidth * imgsCount
        let contentOffset:CGFloat = self.scrollview.contentOffset.x
        var slideToX = contentOffset + pageWidth
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        let currentPage:CGFloat = slideToX / pageWidth
        self.pagecontroller.currentPage = Int(currentPage)
        self.scrollview.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollview.frame.height), animated: true)
    }
}
