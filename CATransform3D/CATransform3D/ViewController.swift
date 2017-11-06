//
//  ViewController.swift
//  CATransform3D
//
//  Created by paprika on 2017/10/22.
//  Copyright © 2017年 paprika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    
    let diceView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3.手势在动,view也在动(坐标会乱),需要找一个不动的参照
//        let subView = UIView.init(frame: blueView.bounds)
//        subView.backgroundColor = UIColor.blue
//        blueView.addSubview(subView)
//        blueView.backgroundColor = UIColor.clear
       // viewTransform()
        addDice()
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(viewTransform(sender:)))
        diceView.addGestureRecognizer(panGesture)
        
    }

    @objc func viewTransform(sender:UIPanGestureRecognizer) {
         var angle = CGPoint.init(x: 0, y: 0)
        // 获取手势坐标
        let point = sender.translation(in: blueView)
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        //1.以Y轴旋转45度,输入一个矩阵改变内容
        var transform = CATransform3DIdentity
        //let angle = CGFloat(45)
       
        //2.比较远的边比近的边要短,透过设置M34为-1.0/d来让影像有远近的3D效果,d代表了想象中视角与屏幕的距离,不加这句没有立体感
        transform.m34 = -1/500
        //3.
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        //谁的transform变了谁动,这里不能使transform了,应该是sublayerTransform
        diceView.layer.sublayerTransform = transform
       // blueView.layer.transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }
    func addDice(){
        
        let viewFrame = UIScreen.main.bounds
        
        var diceTransform = CATransform3DIdentity
        
        diceView.frame = CGRect(x: 0, y: viewFrame.maxY/2 - 50, width: viewFrame.width, height: 100)
        //1
        let dice1 = UIImageView.init(image: #imageLiteral(resourceName: "dice1"))
        dice1.frame = CGRect(x:viewFrame.maxX/2 - 50 , y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice1.layer.transform  = diceTransform
        
        //6
        let dice6 = UIImageView.init(image: UIImage(named: "dice6"))
        dice6.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -50)
        dice6.layer.transform = diceTransform
        
        //2
        let dice2 = UIImageView.init(image: UIImage(named: "dice2"))
        dice2.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice2.layer.transform = diceTransform
        
        //5
        let dice5 = UIImageView.init(image: UIImage(named: "dice5"))
        dice5.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice5.layer.transform = diceTransform
        
        //3.每個面的 z 軸都增加(減少) 50 就能夠做一半的正方體(向外扩展)
        let dice3 = UIImageView.init(image: UIImage(named: "dice3"))
        dice3.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice3.layer.transform = diceTransform
        
        //4
        let dice4 = UIImageView.init(image: UIImage(named: "dice4"))
        dice4.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice4.layer.transform = diceTransform
        
        diceView.addSubview(dice1)
        diceView.addSubview(dice2)
        diceView.addSubview(dice3)
        diceView.addSubview(dice4)
        diceView.addSubview(dice5)
        diceView.addSubview(dice6)
        view.addSubview(diceView)
        
    }
    
    
    
    
    

}






















