//
//  ViewController.swift
//  ReusableView-Study
//
//  Created by 김지태 on 2022/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    // 1. MyReusableView Class 생성
    // 2. MyReusableView xib 생성
    // 3. MyReusableView xib Files owner에 class 등록
    // 4. 원하는 UIViewController에 View 생성하고 Class 등록
    // 5. 버튼을 사용하기 위해 MyReusableViewDelegate 프로토콜 생성
    // 6. MyReusableViewDelegate 연결
    //
    
    @IBOutlet weak var reUseView: MyReusableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        reUseView.delegate = self
    }
}

extension ViewController: MyReusableViewDelegate {
    func btnClick() {
        print("버튼 클릭")
        reUseView.testLabel.text = "안녕하세요"
    }
}

