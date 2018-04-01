//
//  ViewController.swift
//  UIScrollView
//
//  Created by Atsuhiro Kou on 2018/04/01.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// Set UIScrollView delegate
class ViewController: UIViewController, UIScrollViewDelegate {
    
    // OUtlet connection of Scroll View
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Outlet connection of Page Controll
    @IBOutlet weak var pageControll: UIPageControl!
    
    // Photos and texts in scroll view
    struct photo {
        var imageName:String
        var title:String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set delegation of scrollView to ViewController
        scrollView.delegate = self
        
        // Photos in each page
        let photoList = [
            photo(imageName: "C", title: "C is primitive and fast"),
            photo(imageName: "CPP", title: "C++ have OPP system"),
            photo(imageName: "R", title: "R is useful for data analysis"),
            photo(imageName: "Swift", title: "Swift is a new language for iOS")
        ]
        
        // Define func to create contentsView
        func createContentsView(contentList:Array<photo>) -> UIView {
            // Make content view
            let contentView = UIView()
            
            // Set width and height of one page
            let pageWidth = self.view.frame.width
            let pageHeight = scrollView.frame.height
            let pageViewRect = CGRect(x:0, y:0, width:pageWidth, height:pageHeight)
            
            // Set width and height of photo
            let photoSize = CGSize(width:250, height:250)
            
            // Set size of contents (photo * 4)
            contentView.frame = CGRect(x:0, y:0, width:pageWidth * 4, height:pageHeight)
            
            // Background color of page
            let colors:Array<UIColor> = [.orange, .yellow, .lightGray, .cyan]
            
            // Make photoView and add it to subView
            for i in 0..<contentList.count {
                // Extract imageName and title form contentList
                let contentItem = contentList[i]
                // Make pageView by createPage
                let pageView = createPage(viewRect: pageViewRect, imageSize: photoSize, item: contentItem)
                // Deside coordinate of page (shift by pageView.width)
                let left = pageViewRect.width * CGFloat(i)
                let xy = CGPoint(x: left, y: 0)
                pageView.frame = CGRect(origin: xy, size: pageViewRect.size)
                
                // Deside backgraound color
                pageView.backgroundColor = colors[i]
                
                // Add pageViews to contentview.
                contentView.addSubview(pageView)
            }
            
            return contentView
        }
        
        // Define func to create pageView
        func createPage(viewRect: CGRect, imageSize: CGSize, item: photo) -> UIView {
            // Make pageView
            let pageView = UIView(frame: viewRect)  // pageView of one page
            
            // Make photoView
            let photoView = UIImageView()           // photoView of image
            let left = (pageView.frame.width - imageSize.width) / 2
            photoView.frame = CGRect(x:left, y:10, width:imageSize.width, height:imageSize.height)
            photoView.contentMode = .scaleAspectFit
            photoView.image = UIImage(named: item.imageName)
            
            // Make label and set to title of photo
            let titleFrame = CGRect(x:left, y:photoView.frame.maxY+10, width:200, height:21)
            let titleLabel = UILabel(frame: titleFrame)
            titleLabel.text = item.title
            
            // Add photos and titles to pageView
            pageView.addSubview(photoView)
            pageView.addSubview(titleLabel)
            return pageView
        }
        
        // Make subView
        let subView = createContentsView(contentList: photoList)
        // Add subView in scrollView
        scrollView.addSubview(subView)
        
        // The setting of scrollView
        scrollView.isPagingEnabled = true            // Shift pages
        scrollView.contentSize = subView.frame.size  // Content size
        scrollView.contentOffset = CGPoint(x:0, y:0) // Start point of scroll
        
        // The setting of pageControll
        pageControll.numberOfPages = photoList.count  // Number of pages
        pageControll.currentPage = 0                  // Start point of page
        pageControll.pageIndicatorTintColor = UIColor.lightGray    // Color of dot
        pageControll.currentPageIndicatorTintColor = UIColor.black // Color of current page

        /* Delegate method of scrollView */
        // When scroll, renew page control
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            // Check current page
            let pageNo = Int(scrollView.contentOffset.x/scrollView.frame.width)
            // Set current page No. to page controll
            pageControll.currentPage = pageNo
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

