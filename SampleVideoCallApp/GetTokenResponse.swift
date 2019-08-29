//
//  GetTokenResponse.swift
//  BidRide
//
//  Created by Manish Kumar on 14/06/17.
//  Copyright © 2017 Innofied Solution Pvt. Ltd. All rights reserved.
//

import ObjectMapper

class GetTokenResponse: Mappable {
    
    var token: String?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
}
