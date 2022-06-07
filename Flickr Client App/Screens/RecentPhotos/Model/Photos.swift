//
//  Photos.swift
//  Flickr Client App
//
//  Created by Mehmet Ergün on 7.06.2022.
//

import Foundation

struct Photos: Codable {
let page: Int?
let pages: Int?
let perpage: Int?
let total: Int?
let photo: [Photo]?
}
