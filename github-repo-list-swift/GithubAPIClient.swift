//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        
        
//        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let session = NSURLSession.sharedSession()
        
        if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=\(githubClientID)&client_secret=\(githubClientSecret)") {
            
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: { (data, response, error) in
                var responseData = []
                
                do {
                    if let data = data {
                        // replace responseData with the varible "array"
                        responseData = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                        print(responseData)
                        completion(responseData)
                        //                    NSOperationQueue.mainQueue().addOperationWithBlock(completion(responseData))
                    }
                } catch {
                    print(error)
                }
            })
            
            githubTask.resume()
        }
        
        
    }
    
}

