//
//  BottomSheetViewController.swift
//  SLP
//
//  Created by 선상혁 on 2024/01/07.
//

import UIKit
import FloatingPanel

final class FloatingPanelLayout: FloatingPanelBottomLayout {
    
    override var initialState: FloatingPanelState { .tip }
    
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 290, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
    
    override func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        return 0.5
    }
}

final class BottomSheetViewController: FloatingPanelController {
    
    let contentVC = AuthViewController()
    
    init() {
        super.init(delegate: nil)
        setUpView()
    }
    
    private func setUpView() {
        set(contentViewController: contentVC)
        
        var appearance = SurfaceAppearance()
        appearance.cornerRadius = 16
        
        backdropView.dismissalTapGestureRecognizer.isEnabled = true
        backdropView.backgroundColor = Brand.black
        
        surfaceView.appearance = appearance
        self.layout = FloatingPanelLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetViewController: FloatingPanelControllerDelegate {
    
}
