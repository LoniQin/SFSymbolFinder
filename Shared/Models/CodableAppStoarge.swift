//
//  CodableAppStoarge.swift
//  SFSymbolFinder
//
//  Created by Lonnie on 2021/4/8.
//

import Foundation

@propertyWrapper
public class CodableAppStorage<T: Codable> {
    
    var encoder: JSONEncoder
    
    var decoder: JSONDecoder
    
    var storage: UserDefaults
    
    var key: String
    
    public init(
        _ key: String,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder(),
        storage: UserDefaults = .standard
    ) {
        self.key = key
        self.encoder = encoder
        self.decoder = decoder
        self.storage = storage
    }
 
    public var wrappedValue: T? {
        get {
            if let data = storage.data(forKey: key) {
                return try? decoder.decode(T.self, from: data)
            }
            return nil
        }
        set {
            if let data = try? encoder.encode(newValue) {
                storage.set(data, forKey: key)
            }
        }
    }

}
