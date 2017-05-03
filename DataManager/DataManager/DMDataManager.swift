//
//  DMDataManager.swift
//  DataManager
//
//  Created by Howard Lee on 5/2/17.
//  Copyright © 2017 Howard Lee. All rights reserved.
//

import Foundation

class DMDataManager: NSObject {
    let dataCache: NSCache<NSString, DMDataObject>
    var dataClassByIdentifier: [String: AnyClass] = [:]
    var dataObjectByIdentifier: [String: DMDataObject] = [:]

    override init() {
        dataCache = NSCache()
    }

    func registerClass(dataClass: AnyClass, identifier: String) {
        assert(dataClass.isSubclass(of: DMDataObject.self), "Data class must be a subclass of DMDataObject")
        dataClassByIdentifier[identifier] = dataClass
    }
}
