//
//  CountryModel.swift
//  AllInOneiOSProject
//
//  Created by Bharat Shilavat on 03/12/23.
//

import Foundation

struct Country: Codable {
    var name: String?
    var code: String?
    
    init(name: String? = nil, code: String? = nil) {
        self.name = name
        self.code = code
    }
    
    enum CodingKeys: CodingKey {
        case name
        case code
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.code, forKey: .code)
    }
    
}
