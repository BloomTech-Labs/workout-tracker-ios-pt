//
//  CodableStorage.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 4/16/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import Foundation

typealias Storage = ReadableStorage & WritableStorage

protocol ReadableStorage {
    func fetchValue(for key: String) throws -> Data
    func fetchValue(for key: String, handler: @escaping (Result<Data, Error>) -> Void)
}

protocol WritableStorage {
    func save(value: Data, for key: String) throws
    func save(value: Data, for key: String, handler: @escaping (Result<Data, Error>) -> Void)
}

enum StorageError: Error {
    case notFound
    case cantWrite(Error)
}

class DiskStorage {
    
    private let queue: DispatchQueue
    private let fileManager: FileManager
    private let basePath: URL

    init(path: URL,
         queue: DispatchQueue = .init(label: "DiskCache.Queue"),
         fileManager: FileManager = FileManager.default) {
        self.basePath = path
        self.queue = queue
        self.fileManager = fileManager
    }
}

extension DiskStorage {
    
    func delete(key: String) throws {
        // ../caches/key
        let fileURL = basePath.appendingPathComponent(key)
        
        try fileManager.removeItem(at: fileURL)
    }
    
    func delete(key: String, handler: @escaping (Result<Bool, Error>) -> Void) {
        queue.async {
            do {
                // ../caches/key
                let fileURL = self.basePath.appendingPathComponent(key)
                
                try self.fileManager.removeItem(at: fileURL)
                
                handler(.success(true))
            } catch {
                handler(.failure(error))
            }
        }
    }
}

extension DiskStorage: WritableStorage {
    
    func save(value: Data, for key: String) throws {
        
        // ../caches/key
        let fileURL = basePath.appendingPathComponent(key)
        
        do {
            try self.createFolders(in: fileURL)
            try value.write(to: fileURL, options: .atomic)
        } catch {
            throw StorageError.cantWrite(error)
        }
    }

    func save(value: Data, for key: String, handler: @escaping (Result<Data, Error>) -> Void) {
        queue.async {
            do {
                try self.save(value: value, for: key)
                handler(.success(value))
            } catch {
                handler(.failure(error))
            }
        }
    }
}

extension DiskStorage {
    
    private func createFolders(in url: URL) throws {
        
        // We want to create folders up until the last path component.
        // ../caches/timeline
        let folderUrl = url.deletingLastPathComponent()
        
        // Create folders up until this point, unless all folders exist.
        // ../caches/
        guard !fileManager.fileExists(atPath: folderUrl.path) else { return }
        
        try fileManager.createDirectory(at: folderUrl, withIntermediateDirectories: true)
    }
}

extension DiskStorage: ReadableStorage {
    
    func fetchValue(for key: String) throws -> Data {
        let url = basePath.appendingPathComponent(key)
        guard let data = fileManager.contents(atPath: url.path) else {
            throw StorageError.notFound
        }
        return data
    }

    func fetchValue(for key: String, handler: @escaping (Result<Data, Error>) -> Void) {
        queue.async {
            handler(Result { try self.fetchValue(for: key) })
        }
    }
}

class CodableStorage {
    private let storage: DiskStorage
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        storage: DiskStorage,
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init()
    ) {
        self.storage = storage
        self.decoder = decoder
        self.encoder = encoder
    }

    func fetch<T: Decodable>(for key: String) throws -> T {
        let data = try storage.fetchValue(for: key)
        return try decoder.decode(T.self, from: data)
    }

    func save<T: Encodable>(_ value: T, for key: String) throws {
        let data = try encoder.encode(value)
        try storage.save(value: data, for: key)
    }
}
