//
//  MyReusableView.swift
//  ReusableView-Study
//
//  Created by 김지태 on 2022/10/20.
//

import UIKit

protocol MyReusableViewDelegate {
    func btnClick()
}

class MyReusableView: UIView {
    
    var delegate: MyReusableViewDelegate?

    @IBOutlet weak var testLabel: UILabel!
    let nibName = "MyReusableView"    // xib 이름
      
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      commonInit()
    }

    override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
    }

    func commonInit() {
      guard let view = loadViewFromNib() else { return }
      view.frame = self.bounds
      self.addSubview(view)
    }

    func loadViewFromNib() -> UIView? {
      let nib = UINib(nibName: nibName, bundle: nil)
      return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func testButtonAction(_ sender: Any) {
        if let del = delegate {
            del.btnClick()
        }
        
    }
    
    
    
}
