//
//  ViewController.swift
//  DeviceCheckAPI
//
//  Created by Vineet Choudhary on 17/11/17.
//  Copyright © 2017 Developer Insider. All rights reserved.
//

import UIKit
import DeviceCheck

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateToken()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateToken(){
        let currentDevice = DCDevice.current
        if currentDevice.isSupported {
            currentDevice.generateToken(completionHandler: { (data, error) in
                DispatchQueue.main.async {
                    if let tokenData = data {
                        self.statusLabel.text = tokenData.base64EncodedString()
                    } else {
                        self.statusLabel.text = error?.localizedDescription ?? "Something Wrong!!!"
                    }
                }
            })
        } else {
            self.statusLabel.text = "Device not supported."
        }
    }

}

