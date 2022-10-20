//
//  ViewController.swift
//  FontSizebyPhotoResolution
//
//  Created by 김지태 on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testUiImageView: UIImageView!
    
    @IBOutlet weak var imageWitdhTextField: UITextField!
    
    @IBOutlet weak var imageHeightTextField: UITextField!
    
    
    @IBOutlet weak var fontSizeTextField: UITextField!
    
    
    var sampleColorImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageSet()
        
    }
    
    func imageSet() {
        
        var inputWidth: Double = 0
        var inputHeight: Double = 0
        var inputSize: CGFloat = 0
        
        if let width = self.imageWitdhTextField.text {
            inputWidth = Double(width)!
        }
        
        if let height = self.imageHeightTextField.text {
            inputHeight = Double(height)!
        }
        
        
        // Set the clock font size according to the height.
            //  Design was done on iPhone XR with height of 896 points and font size of 98.
//        if (UIScreen.main.bounds.height != 896). // Only need code if not on original design size.
//        {
//            let scaleFactor: Float = Float(UIScreen.main.bounds.height) / 896.0
//            let fontSize = CGFloat(98.0 * scaleFactor)
//            self.clock.font = self.clock.font.withSize(fontSize)
//        }
        
        if let size = self.fontSizeTextField.text {
            inputSize = CGFloat(size)!
        }
        
        let smapleImage = UIColor.orange.image(CGSize(width: inputWidth, height: inputHeight))
        
        self.testUiImageView.image = smapleImage
    }
    
    // 사진에 글씨 추가
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        // 텍스트 생상
        let textColor = UIColor.white
        // 텍스트 폰트
        let textFont = UIFont(name: "Helvetica Bold", size: 500)!

        // 뷰 Scale 값
        let scale = UIScreen.main.scale
        
        // UIGraphicsBeginImageContextWithOptions
        // - size: bitmap context 사이즈 (= 생성될 이미지의 사이즈)
        // - opaque: 생성될 이미지의 투명도 여부 (투명도가 있으면 true, 단 불투명도일때가 퍼포먼스가 높은 특징 존재)
        // - scale: 0.0이면 디바이스의 화면에 맞게 이미지가 결정
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

        return newImage!
    }

    @IBAction func setImageSizeButtonAction(_ sender: Any) {
        self.imageSet()
    }
    
    @IBAction func setFontSizeButtonAction(_ sender: Any) {
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
