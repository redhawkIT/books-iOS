//
//  BookModel.swift
//  books
//
//  Created by Furry Canva on 7/21/22.
//

import Foundation
import ObjectMapper

class BookResponse: NSObject, Mappable {
    
    var items: [BookModel]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override init()
    {
        super.init()
    }
    
    func mapping(map: Map) {
        
        items <- map["items"]
    }
    
}

class BookModel: NSObject, Mappable {
    
    var id: String?
    var etag: String?
    var volumeInfo: VolumeInfoModel?
        
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override init()
    {
        super.init()
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        etag <- map["etag"]
        volumeInfo <- map["volumeInfo"]
    }
    
}

class VolumeInfoModel: NSObject, Mappable {
    
    var title: String?
    var desc: String?
    var imageLinks: ImageLinkModel?
        
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override init()
    {
        super.init()
    }
    
    func mapping(map: Map) {
        
        title <- map["title"]
        desc <- map["description"]
        imageLinks <- map["imageLinks"]
    }
}

class ImageLinkModel: NSObject, Mappable {
    
    var smallThumbnail: String?
    var thumbnail: String?
        
    convenience required init?(map: Map) {
        self.init()
    }
    
    override init()
    {
        super.init()
    }
    
    func mapping(map: Map) {
        
        smallThumbnail <- map["smallThumbnail"]
        thumbnail <- map["thumbnail"]
    }
}
