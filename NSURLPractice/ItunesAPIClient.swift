//
//  ItunesAPIClient.swift
//  NSURLPractice
//
//  Created by Flatiron School on 8/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class ItunesAPIClient {
    
    class func getMusicStuff(completion: NSDictionary -> Void){
        
        let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=madonna"
        
        let url = NSURL(string: urlString)
        
        let session = NSURLSession.sharedSession()
        guard let unwrappedURL = url else{return}
        
        let request = NSMutableURLRequest.init(URL: unwrappedURL)
        
        request.HTTPMethod = "GET"
        
        let dataTask = session.dataTaskWithRequest(request) { (dataStuff, responseStuff, errorStuff) in
            
            guard let unwrappedDataStuff = dataStuff else{return}
            
            do{
                
                let madonnaDictionary = try NSJSONSerialization.JSONObjectWithData(unwrappedDataStuff, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary
                
                guard let unwrappedMadonna = madonnaDictionary else{return}
                
                completion(unwrappedMadonna)
                
                
            }catch{
                
                print(errorStuff?.localizedDescription)
                
            }
        }
        dataTask.resume()
    }
}
