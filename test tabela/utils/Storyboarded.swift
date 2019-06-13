//
//  Storyboarded.swift
//  test tabela
//
//  Created by Sergio Gelves on 6/7/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

protocol Storyboarded {
    
    static func instantiate() -> Self
    
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        // this pulls out "MyViewController"
        let className = String(describing: self)
        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
