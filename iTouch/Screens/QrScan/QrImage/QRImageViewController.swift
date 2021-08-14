//
//  QRImageViewController.swift
//  iTouch
//
//  Created by Meruzhan Avetisyan on 03.07.21.
//

import UIKit

class QRImageViewController: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let QRimage = generateQRCode(from: "Hello, world!")

        self.qrImage.image = QRimage
        // Do any additional setup after loading the view.
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            return UIImage(ciImage: QRImage)
        }
        return nil
    }
    
    
    @IBAction func shareAction(_ sender: UIButton) {
        
        
    }
    
}
