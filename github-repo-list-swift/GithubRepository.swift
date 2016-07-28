//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String
    var htmlURL: NSURL
    var repositoryID: String
    
    init(dictionary: NSDictionary) {
        guard let
            name = dictionary["full_name"] as? String,
            valueAsString = dictionary["html_url"] as? String,
            valueAsURL = NSURL(string: valueAsString),
            repoID = dictionary["id"]?.stringValue
            else {fatalError("Error creating instance of GithubRepository")}
        
        fullName = name
        htmlURL = valueAsURL
        repositoryID = repoID
    }
    
}
