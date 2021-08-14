//
//  QRViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 02.07.21.
//

import UIKit

class QRViewController: UIViewController {
    
    @IBOutlet weak var myContandView: UIView!
    
    @IBOutlet weak var segmentStartPossition: NSLayoutConstraint!
    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myScrolViewWith: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staylView()
        configureScrollView()
    }
    
    func staylView() {
        myScrollView.delegate = self
        
    }
    
 
    func configureScrollView() {
        
        
        let storyBoard = UIStoryboard(name: "QrScan", bundle: .main)
        
        let qrScanVC = storyBoard.instantiateViewController(identifier: "QrScanViewController") as! QrScanViewController
        let qrVC = storyBoard.instantiateViewController(identifier: "QRImageViewController") as! QRImageViewController
        
        addChild(qrVC)
        addChild(qrScanVC)
        
        qrVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: myScrollView.frame.height)
        qrScanVC.view.frame = CGRect(x: self.view.frame.maxX, y: 0, width: self.view.frame.width, height: myScrollView.frame.height)
        
        myScrollView.addSubview(qrVC.view)
        myScrollView.addSubview(qrScanVC.view)
        
        qrVC.didMove(toParent: self)
        qrScanVC.didMove(toParent: self)
        
        myScrolViewWith.constant = view.frame.width
        myScrollView.contentSize = CGSize(width: myScrolViewWith.constant, height: myScrollView.contentSize.height)
    }
    
    @IBAction func myQrAction(_ sender: UIButton) {
        myScrollView.contentOffset.x = 0
    }
    
    @IBAction func scanQrAction(_ sender: UIButton) {
        
        myScrollView.contentOffset.x = self.view.frame.width
    }
    
    
}

extension QRViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        segmentStartPossition.constant = scrollView.contentOffset.x / 2
    }
}
