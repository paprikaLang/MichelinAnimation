//
//  ViewController.swift
//  MichelinAnimation
//
//  Created by paprika on 2017/8/31.
//  Copyright © 2017年 paprika. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    let layer = PALayer(withNumberOfItems: 6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        view.layer.addSublayer(layer)
        layer.color = UIColor.darkGray
        spin(sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
    func spin(sender: AnyObject?) {
        layer.startAnimating()
    }
    
    func halt(sender: AnyObject) {
        layer.stopAnimating()
    }
}

