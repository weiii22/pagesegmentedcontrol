//
//  ViewController.swift
//  pagesegmentedcontrol
//
//  Created by 王偉程 on 2022/2/20.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var showUIImage: UIImageView!
    @IBOutlet weak var pageSegmented: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var cantbuyLabel: UILabel!
    @IBOutlet weak var introduceTextview: UITextView!
    var imageArray = ["Harry Potter™ & Hermione Granger™","Hogwarts™ Icons - Collectors' Edition","Hogwarts™ Wizard’s Chess","Harry Potter™ Hogwarts™ Crests","Diagon Alley™"]
    var textViewArray = [
        "76393-\nHarry Potter 哈利波特系列-\nHarry Potter & Hermione Granger\n建議售價：USD129",
        "76391-\nHarry Potter 哈利波特系列-\nHogwarts Icons - Collectors’ Edition \n建議售價：USD288",
        "76392-\nHarry Potter 哈利波特系列-\nHogwarts Wizard’s Chess  \n建議售價：USD85",
        "31201-\nHarry Potter 哈利波特系列-\nHarry Potter Hogwarts Crests\n建議售價：USD119",
        "75978-\nHarry Potter 哈利波特系列-\nDiagon Alley\n建議售價：USD431"]
    var buyURLArray = ["https://24h.pchome.com.tw/prod/DEDJ0R-A900BKU1X",
        "https://24h.pchome.com.tw/prod/DEDJ0R-A900C2FDS",
        "https://www.momoshop.com.tw/goods/GoodsDetail.jsp?i_code=8888970&str_category_code=2118900069",
        "https://24h.pchome.com.tw/prod/DEDJ12-A900BKRBU?fq=/S/DEDJ0R",
        "已絕版"]
    var currentPage = 0
    
    
    @IBAction func selectedpageSegmented(_ sender: UISegmentedControl) {
        currentPage = pageSegmented.selectedSegmentIndex
        changeproduct()
        print(currentPage)
    }
    
    
    @IBAction func changepage(_ sender: UIPageControl) {
        currentPage = pageControl.currentPage
        changeproduct()
        print(currentPage)
    }
    
    @IBAction func nextpage(_ sender: Any) {
        if currentPage < 4 {
        currentPage += 1
        }else {
            currentPage -= 4
        }
        changeproduct()
        print(currentPage)
    }
    
    @IBAction func previouspgage(_ sender: Any) {
        if currentPage < 1 {
            currentPage += 4
        }else {
            currentPage -= 1
        }
        changeproduct()
        print(currentPage)
    }
    
    @IBAction func buyButton(_ sender: Any) {
        pageControl.currentPage = currentPage
        pageSegmented.selectedSegmentIndex = currentPage
        if let url = URL(string: buyURLArray[currentPage]) {
            let controler = SFSafariViewController(url: url)
        present(controler, animated: true, completion: nil)
        }
    }
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        if sender.direction ==  .left {
            if currentPage < 4 {
            currentPage += 1
            }else {
                currentPage -= 4
            }
        }else {
            if currentPage < 1 {
                currentPage += 4
            }else {
                currentPage -= 1
            }
        }
        changeproduct()
    }
    
    
    func changeproduct() {
        pageControl.currentPage = currentPage
        pageSegmented.selectedSegmentIndex = currentPage
        showUIImage.image = UIImage(named: imageArray[currentPage])
        introduceTextview.text = textViewArray[currentPage]
        if currentPage == 4 {
            cantbuyLabel.text = "已絕版🥲🥲🥲"
        }else{
            cantbuyLabel.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        introduceTextview.backgroundColor = .black
        introduceTextview.textColor = .white
        introduceTextview.text = textViewArray[0]
        // Do any additional setup after loading the view.
        
    }


}

