//
//  ViewController.swift
//  DownloadFromInternet
//
//  Created by David E Bratton on 10/21/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let url = URL(string: "https://www.stackoverflow.com")!
        //webView.loadRequest(URLRequest(url: url))
        //webView.load(URLRequest(url: url))
        
        if let url = URL(string: "https://www.stackoverflow.com") {
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString!)
                        
                        DispatchQueue.main.sync(execute: {
                            //Now update user interface
                        })
                    }
                }
            }
            task.resume()
            
        }
        
    }


}

