//
//  ViewController.swift
//  sem-constraints
//
//  Created by Leonardo Viana on 06/07/20.
//  Copyright © 2020 Leonardo Viana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var slides:[UIView] = [];

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    func createSlides() -> [UIView] {
        let slide1 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 100));
        
        let slide2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        
        let slide3 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        
        slide1.backgroundColor = .white
        slide2.backgroundColor = .cyan
        slide3.backgroundColor = .darkGray

        return [slide1, slide2, slide3]
    }
    
    func setupScrollView(slides: [UIView]){
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        slides = createSlides()
        setupScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }


}

