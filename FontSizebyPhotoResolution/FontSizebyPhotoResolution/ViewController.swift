//
//  ViewController.swift
//  FontSizebyPhotoResolution
//
//  Created by 김지태 on 2022/10/20.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var testUiImageView: UIImageView!

    @IBOutlet weak var imageWitdhTextField: UITextField!
    @IBOutlet weak var imageHeightTextField: UITextField!
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.run()
    }
    
    func run() {
        self.imageSet()
    }
    
    func imageSet() {
        guard let inputWidth = self.imageWitdhTextField.text,
                let inputHeight = self.imageHeightTextField.text,
                let inputFont = self.fontSizeTextField.text else {
                    return
                }
        
        if inputWidth == "" || inputHeight == "" || inputFont == "" {
            return
        }
        
        guard let width = Double(inputWidth),
           let height = Double(inputHeight),
           let fontSize = Double(inputFont) else {
            return
        }
        
        let sampleImage = UIColor.orange.image(CGSize(width: width, height: height))
        
        if let testImage = self.textToImage(drawText: "Test", inImage: sampleImage, fontSize: fontSize, atPoint: .zero) {
            self.testUiImageView.image = testImage
        }
    }
    
    // 사진에 글씨 추가
    func textToImage(drawText text: String, inImage image: UIImage, fontSize: CGFloat, atPoint point: CGPoint) -> UIImage? {
        // 텍스트 생상
        let textColor = UIColor.white
        // 텍스트 폰트
        let textFont = UIFont(name: "Helvetica Bold", size: fontSize)!
        UIGraphicsBeginImageContextWithOptions(image.size, false, 1)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            ] as [NSAttributedString.Key : Any]
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }

    @IBAction func setImageSizeButtonAction(_ sender: Any) {
        self.imageSet()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
