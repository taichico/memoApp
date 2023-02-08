import Foundation
import UIKit

extension FileManager {
     func writingFile(_ text: String) {
        // Documentsディレクトリまでのパスを生成
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("URL取得失敗")
        }
        // ファイル名を含めたフルパスを生成
        let fullURL = docURL.appendingPathComponent("sample.txt")
        
        do {
            // 書き込み処理
            try text.write(to: fullURL,atomically: true,encoding: .utf8)
        } catch{
            print("書き込み失敗")
        }
        print("書き込み成功")
    }
    
     func readingFile() -> String? {
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else{
            fatalError("URL取得失敗")
        }
        let fullURL = docURL.appendingPathComponent("sample.txt")
        do {
            let textData = try String(contentsOf: fullURL, encoding: .utf8)
            return textData
        } catch {
            return nil
        }
    }
}
