//
//  UniversityDetailDomain.swift
//  UniversityDetail
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation

//MARK: UniversityDetailDomain structure.
public struct UniversityDetailDomain {
    /// University name
    public let universityName: String
    /// Optional University Webpage URL
    public let webPage: URL?
    /// Domain of university
    public let domain: String
    
    ///Public initialiser.
    public init(universityName: String, webPage: URL?, domain: String) {
        self.universityName = universityName
        self.webPage = webPage
        self.domain = domain
    }
}
