//
//  PklSproutAPI.swift
//  ClocCar@MBG
//
//  Created by SNI on 2025/11/05.
//

/*

final class PklSproutAPI {
    static let shared = PklSproutAPI()
    private init() {}

    func send(_ payload: [String: Any]) -> Bool {
        guard let data = try? JSONSerialization.data(withJSONObject: payload) else { return false }
        let encrypted = encrypt(data)
        // TODO: post to server endpoint
        print("🔒 Sprout data:", encrypted)
        return true
    }

    private func encrypt(_ data: Data) -> String {
        // デモではBase64。将来的にAES 暗号化＋公開鍵方式へ。
        return data.base64EncodedString()
    }
}
*/
