//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中澤ゆうと on 2018/11/20.
//  Copyright © 2018年 nakazawayuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    @IBOutlet var Next: UIButton!
    
    @IBOutlet var Back: UIButton!
    
    var selectedImage : UIImage!
    
    var image: UIImage!
    
    var timer: Timer!
    
    var dispImageNo = 0
    
    func displayImage(){
        
    let imageNameArray = ["b48c3eb3f45fbb295d384264161eb412_1080x1346_h.jpg" ,
         "original.jpg",
         "213466cf0f78d54f6b0fbfb6cdaaeb56.jpg" ,
         "red-velvet_main.jpg"
        ]
        
        for dispImageNo in 0...3 {
        print("dispImageNo: \(dispImageNo)")
        }
        
        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        else if dispImageNo > 3 {
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]
        
        let image = UIImage(named:name)
        
        imageView.image = image
        print(image)
        
    }
   
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        if self.timer != nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        return

    }
    
    @IBAction func go(_ sender: Any) {
       
   if self.timer == nil {
            dispImageNo += 1
            displayImage()
        }else{
            dispImageNo += 0
        }
        
    }
    @IBAction func Return(_ sender: Any) {
        if self.timer == nil {
        dispImageNo -= 1
        displayImage()
        }else{
            dispImageNo -= 0
        }
        
    }
    
    @IBOutlet weak var change: UIButton!
    
    @IBAction func Reg_Stop(_ sender: Any) {
       
        change.setTitle("停止", for: .normal)
        
        
        if self.timer != nil {
            self.timer.invalidate()
                Next.isEnabled = true
                Back.isEnabled = true
            change.setTitle("再生", for: .normal)
            self.timer = nil
        }else {
            if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                Next.isEnabled = false
                Back.isEnabled = false
            return
               
            }
        }
        if self.timer != nil {
            let topimage = UIImage(named: "b48c3eb3f45fbb295d384264161eb412_1080x1346_h.jpg")
            imageView.image = topimage
        }
        
    }


    @objc func updateTimer(_ timer: Timer) {
        
        dispImageNo += 1
        displayImage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            let topimage = UIImage(named: "b48c3eb3f45fbb295d384264161eb412_1080x1346_h.jpg")
            imageView.image = topimage
        


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "result", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.timer != nil {
            self.timer.invalidate()
        }
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = imageView.image
        print(image)
    }
}

