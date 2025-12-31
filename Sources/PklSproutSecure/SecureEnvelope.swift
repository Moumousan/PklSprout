
//
//  SecureEnvelope.swift
//  PklSprout
//
//  Created by SNI on 2025/12/31.
//


import Foundation

/// 暗号化されたペイロードを包む汎用フォーマット
public struct SecureEnvelope: Codable, Sendable {
    public var version: Int          // スキーマバージョン
    public var algorithm: String     // "aes256-gcm" など
    public var nonce: Data           // IV / Nonce
    public var ciphertext: Data      // 暗号化された本体
    public var associatedData: Data? // 署名対象の追加情報など

    public init(
        version: Int = 1,
        algorithm: String,
        nonce: Data,
        ciphertext: Data,
        associatedData: Data? = nil
    ) {
        self.version = version
        self.algorithm = algorithm
        self.nonce = nonce
        self.ciphertext = ciphertext
        self.associatedData = associatedData
    }
}
