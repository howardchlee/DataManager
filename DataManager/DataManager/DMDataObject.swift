//
//  DMDataObject.swift
//  DataManager
//
//  Created by Howard Lee on 5/2/17.
//  Copyright © 2017 Howard Lee. All rights reserved.
//

import UIKit

// The load state of a DMDataObject.  The fetcher should update this state based on loading status
enum DMDataObjectLoadState {

    // The object is initialized but not loaded at all
    case initialized
    
    // Loading has begun for the object
    case loading

    // Object is completely loaded and usable
    case loaded

    // when a request failed and is not actively being loaded
    case invalid

    // when a request has failed before and is actively being loaded
    case retrying
}

class DMDataObject: NSObject {

    class var fetcherClass: DMDataFetcher.Type {
        return DMNilDataFetcher.self
    }

    var loadState: DMDataObjectLoadState

    required override init() {
        loadState = .initialized
    }
}
