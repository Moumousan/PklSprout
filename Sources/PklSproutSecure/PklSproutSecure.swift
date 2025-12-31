//
//  PklSproutSecure.swift
//  PklSprout
//
//  Created by SNI on 2025/12/31.
//


// Sources/PklSproutSecure/PklSproutSecure.swift

import Foundation
import PklSprout
// import SecureDeliveryCore   // 実装できたらここを有効にする

/// 🔐 PklSprout + セキュア配送用の高レベル API
public struct PklSproutSecure {

    // MARK: - まずは「平文」版（暗号なし）

    /// Codable を .pkl 文字列に変換する（将来は暗号化前のステップ）
    public static func encodePlain<T: Encodable>(_ value: T) throws -> String {
        try PklSproutEncoder.encode(value)
    }

    /// .pkl 文字列から Codable に戻す（将来は復号後のステップ）
    public static func decodePlain<T: Decodable>(_ type: T.Type,
                                                 from pkl: String) throws -> T {
        try PklSproutDecoder.decode(type, from: pkl)
    }

    // MARK: - 将来の暗号化 API の足場だけ用意しておく

    /// 将来、暗号化して送るための API（現時点ではダミー実装）
    public static func encodeSecure<T: Encodable>(_ value: T) throws -> Data {
        let pkl = try encodePlain(value)
        // TODO: SecureDeliveryCore で暗号化する
        // 例: return try SecureEnvelope.encrypt(pkl)
        return Data(pkl.utf8)
    }

    /// 将来、暗号化されたデータから復号して読み込む API（現時点ではダミー）
    public static func decodeSecure<T: Decodable>(_ type: T.Type,
                                                  from data: Data) throws -> T {
        // TODO: SecureDeliveryCore で復号する
        // 例: let pkl = try SecureEnvelope.decrypt(data)
        let pkl = String(decoding: data, as: UTF8.self)
        return try decodePlain(type, from: pkl)
    }
}