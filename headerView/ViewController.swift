//
//  ViewController.swift
//  headerView
//
//  Created by yusuf demirkoparan on 30.01.2020.
//  Copyright © 2020 yusuf demirkoparan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var Headerview : UIView!
    var NewHeaderLayer : CAShapeLayer!
    
    @IBOutlet weak var imageViewTop: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeagg: NSLayoutConstraint!
    private let Headerheight : CGFloat = 420
    private let Headercut : CGFloat = 0
    
    var navbarHeight: CGFloat!
    var originalHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        originalHeight = imageViewHeagg.constant
        navbarHeight = self.navigationController?.navigationBar.frame.height
        
    }
   
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //self.Setupnewview()
        let base = -navbarHeight
        let offset = scrollView.contentOffset.y
        if offset < 0 {
            imageViewTop.constant = offset
            imageViewHeagg.constant = originalHeight + abs(base - offset)
        } else {
            let navbarOffset = offset + navbarHeight
            let imageBottom = base + originalHeight
            
            if navbarOffset >= imageBottom {
                imageViewTop.constant = base + abs(navbarOffset - imageBottom + 50)
            } else {
                 imageViewTop.constant = base
            }
           
            imageViewHeagg.constant = originalHeight
        }
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 272
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! tableCell
        
        return cell
    }
}

