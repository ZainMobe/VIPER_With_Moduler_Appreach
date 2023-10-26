//
//  UniversityListResponse.swift
//  TaskAssignmentMain
//
//  Created by Zain Haider on 25/10/2023.
//

import Foundation
import RealmSwift

//MARK: UniversityListResponse class.
/// Confirm to `Object` and `Codable`. Support encoding and decoding and realm object.
class UniversityListResponse: Object, Codable {
    @objc dynamic var stateprovince: String? = ""
    @objc dynamic var country: String? = ""
    @objc dynamic var alpha_two_code: String? = ""
    @objc dynamic var name: String? = ""
    var domains = List<String>()
    var web_pages = List<String>()
    
    
    enum CodingKeys: String, CodingKey {
        case stateprovince = "state-province"
        case country = "country"
        case domains = "domains"
        case web_pages = "web_pages"
        case alpha_two_code = "alpha_two_code"
        case name = "name"
    }
    ///Convert response object to `UniversityListCellModel` domain.
    func toListCellDomain() -> UniversityListCellModel {
        UniversityListCellModel(
            universityName: name ?? "",
            state: stateprovince ?? "")
    }
    
}
