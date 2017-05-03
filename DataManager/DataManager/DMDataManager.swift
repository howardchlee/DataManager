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
    var dataClassByIdentifier: [String: DMDataObject.Type] = [:]
    var dataFetcherByIdentifier: [String: DMDataFetcher] = [:]

    override init() {
        dataCache = NSCache()
    }

    func registerClass(dataClass: DMDataObject.Type, dataClassIdentifier: String) {
        dataClassByIdentifier[dataClassIdentifier] = dataClass
        let dataFetcherClass = dataClass.fetcherClass
        let dataFetcher = dataFetcherClass.init()
        dataFetcherByIdentifier[dataClassIdentifier] = dataFetcher
    }

    func dataObjectWithRequest(request: DMDataRequest, dataClassIdentifier: String) -> DMDataObject {
        let requestIdentifier = request.requestIdentifier
        if let dataObject: DMDataObject = dataCache.object(forKey: requestIdentifier as NSString) {
            return dataObject
        }

        if let dataClass: DMDataObject.Type = dataClassByIdentifier[dataClassIdentifier] {
            let dataObject = dataClass.init()

            if let dataFetcher = dataFetcherByIdentifier[dataClassIdentifier] {
                dataFetcher.fetch(request: request, dataObject: dataObject)
                dataCache.setObject(dataObject, forKey: requestIdentifier as NSString)
                return dataObject
            } else {
                assertionFailure("No fetcher is set for identifier: \(dataClassIdentifier)")
            }
        } else {
            assertionFailure("No class registered for identifier: \(dataClassIdentifier)")

        }
        return DMDataObject()
    }
}
