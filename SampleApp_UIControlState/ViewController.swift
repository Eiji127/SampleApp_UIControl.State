//
//  ViewController.swift
//  SampleApp_UIControlState
//
//  Created by 白数叡司 on 2021/12/17.
//

import UIKit

// cornerRadiusをstoryboard上で指定するためのカスタムクラス
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var normalButton: CustomButton!
    @IBOutlet weak var highlightedButton: CustomButton!
    @IBOutlet weak var disabledButton: CustomButton!
    @IBOutlet weak var selectedButton: CustomButton!
    @IBOutlet weak var focusedButton: CustomButton!
    @IBOutlet weak var applicationButton: CustomButton!
    @IBOutlet weak var reservedButton: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setTitle(to button: CustomButton, state: UIControl.State, title: String) {
        let title: String = title
        button.setTitle(title, for: state)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if (context.nextFocusedView == self) {
            // handle focus appearance changes
            setTitle(to: focusedButton, state: .focused, title: "Focused")
        }
        else {
            // handle unfocused appearance changes
            setTitle(to: focusedButton, state: .focused, title: "NotFocused")
        }
    }
}

