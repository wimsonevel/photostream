//
//  PostComposerPresenter.swift
//  Photostream
//
//  Created by Mounir Ybanez on 09/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

class PostComposerPresenter: PostComposerPresenterInterface {
    
    weak var moduleDelegate: PostComposerModuleDelegate?
    weak var view: PostComposerViewInterface!
    var wireframe: PostComposerWireframeInterface!
    var source: PhotoSource = .unknown {
        didSet {
            guard source != oldValue else {
                return
            }
            
            switch source {
            case .library:
                view.showLibrary()
            case .camera:
                view.showCamera()
            case .unknown:
                break
            }
        }
    }
}

extension PostComposerPresenter: PostComposerModuleInterface {
    
    func cancelWriting() {
        moduleDelegate?.postComposerDidCancelWriting()
    }
    
    func doneWriting(with image: UIImage, content: String) {
        moduleDelegate?.postComposerDidFinishWriting(with: image, content: content)
    }
    
    func willShowCamera() {
        source = .camera
    }
    
    func willShowLibrary() {
        source = .library
    }
    
    func dismiss(animated: Bool) {
        wireframe.dismiss(with: view.controller, animated: animated, completion: nil)
    }
}
