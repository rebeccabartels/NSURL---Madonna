//
//  ViewController.swift
//  NSURLPractice
//
//  Created by Flatiron School on 8/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ItunesAPIClient.getMusicStuff { (madonnaDictionaryStuff) in
            
            print(madonnaDictionaryStuff)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

