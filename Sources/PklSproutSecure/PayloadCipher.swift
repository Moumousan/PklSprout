
//
//  PayloadCipher.swift
//  PklSprout
//
//  Created by SNI on 2025/12/31.
//


import Foundation

/// 暗号アルゴリズムを差し替え可能にするためのプロトコル
public protocol PayloadCipher: Sendable {
    func seal(
        plaintext: Data,
        context: SecureContext?
    ) throws -> SecureEnvelope

    func open(
        envelope: SecureEnvelope,
        context: SecureContext?
    ) throws -> Data
}

/// 追加のメタ情報（バージョン、キーID、端末ID など）
/// 必要に応じて中身を増やして OK
public struct SecureContext: Sendable {
    public var keyID: String?

    public init(keyID: String? = nil) {
        self.keyID = keyID
    }
}
