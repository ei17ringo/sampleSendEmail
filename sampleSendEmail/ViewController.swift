//
//  ViewController.swift
//  sampleSendEmail
//
//  Created by Eriko Ichinohe on 2016/12/03.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import MessageUI
//import AVKit
//import Foundation
import AVFoundation

class ViewController: UIViewController,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapBtn(_ sender: UIButton) {
        
        // check if can send an email
        if MFMailComposeViewController.canSendMail() == false {
            print("Email Send Failed")
            return
        }

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["address@example.com","test@gmail.com"])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello from California!", isHTML: false)
        
        // パスからassetを生成.
        let path = Bundle.main.path(forResource: "sample", ofType: "MOV")
        let avAsset = NSData(contentsOfFile: path!)
        
        composeVC.addAttachmentData(avAsset as! Data, mimeType: "video/quicktime", fileName: "testmovie")
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

