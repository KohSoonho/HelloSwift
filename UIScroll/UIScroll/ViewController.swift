//
//  ViewController.swift
//  UIScroll
//
//  Created by Atsuhiro Kou on 2018/02/11.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    // outlet connection of scrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    // outlet connection of pageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Define struct Photo
    struct Photo {
        var imageName:String  // name of photo image
        var title:String      // title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // list of photo, make 4 page data.
        let photoList = [
            Photo(imageName:"Unknown", title:"C"),
            Photo(imageName:"images", title:"C++"),
            Photo(imageName:"Unknown-1", title:"R"),
            Photo(imageName:"swift-og", title:"Swift")
        ]
        
        // make subView
        let subView = createContentsView(contentList: photoList)
        // add subView to scrollView
        scrollView.addSubview(subView)
        
        // setting of scrollView
        scrollView.isPagingEnabled = true // send page
        scrollView.contentSize = subView.frame.size
        scrollView.contentOffset = CGPoint(x:0, y:0)
        // delegate UIController
        scrollView.delegate = self
        
        // setting of page control
        pageControl.numberOfPages = photoList.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
    
    func createContentsView(contentList:Array<Photo>) -> UIView {
        // make contentsview to add page
        let contentView = UIView()
        // width and height of one page
        let pageWidth = self.view.frame.width
        let pageHeight = scrollView.frame.height
        let pageViewRect = CGRect(x:0, y:0, width:pageWidth, height:pageHeight)
        // size of photo
        let photoSize = CGSize(width:250, height:250)
        // size of contentsview
        contentView.frame = CGRect(x:0, y:0, width:pageWidth*4, height:pageHeight)
        // background color of page
        let colors:Array<UIColor> = [.cyan, .yellow, .lightGray, .orange]
        // make photo contents and add to subView
        for i in 0..<contentList.count {
            let contentItem = contentList[i]
            let pageView = createPage(viewRect: pageViewRect, imageSize: photoSize, item: contentItem)
            let left = pageViewRect.width * CGFloat(i)
            let xy = CGPoint(x: left, y: 0)
            pageView.frame = CGRect(origin: xy, size: pageViewRect.size)
            pageView.backgroundColor = colors[i]
            contentView.addSubview(pageView)
        }
        return contentView
    }
    
    // func of create one view having photo and title
    func createPage(viewRect: CGRect, imageSize:CGSize, item:Photo) -> UIView {
        let pageView = UIView(frame: viewRect)
        let photoView = UIImageView()
        let left = (pageView.frame.width - imageSize.width) / 2
        photoView.frame = CGRect(x: left, y: 10, width: imageSize.width, height: imageSize.height)
        photoView.contentMode = .scaleAspectFill
        photoView.image = UIImage(named: item.imageName)
        // make label and set title of photo
        let titleFrame = CGRect(x:left, y:photoView.frame.maxY+10, width: 200, height: 21)
        let titleLabel = UILabel(frame: titleFrame)
        titleLabel.text = item.title
        // add photo and title to pageView
        pageView.addSubview(photoView)
        pageView.addSubview(titleLabel)
        return pageView
    }
    
    // delegate method of sceoll view
    // when scroll, renew pagecontroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNo = Int(scrollView.contentOffset.x/scrollView.frame.width)
        pageControl.currentPage = pageNo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

