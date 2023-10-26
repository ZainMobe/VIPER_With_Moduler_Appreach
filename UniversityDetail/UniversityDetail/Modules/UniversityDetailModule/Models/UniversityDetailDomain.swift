//
//  UniversityDetailDomain.swift
//  UniversityDetail
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation


public struct UniversityDetailDomain {
    public let universityName: String
    public let webPage: URL?
    public let domain: String
    
    
    public init(universityName: String, webPage: URL?, domain: String) {
        self.universityName = universityName
        self.webPage = webPage
        self.domain = domain
    }
}
