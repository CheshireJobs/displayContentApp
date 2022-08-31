import Foundation
import UIKit

class FileManagerService {
    
    static var shared = FileManagerService()
    var content = [UIImage]()
    var contentTitles = [String]()
    
    private let documentDirectoryURL: URL
    private let fileManager = FileManager.default
    
    func saveToDocumets(image: UIImage, name: String) {
        let data = image.jpegData(compressionQuality: 1.0)
        let imagePath = documentDirectoryURL.appendingPathComponent(name)
        do {
            try fileManager.createFile(atPath: imagePath.path, contents: data)
            updateContent()
        }
        catch let error {
            print(error)
        }
    }
    
    func removeFromDocumets(index: Int) {
        let imagePath = documentDirectoryURL.appendingPathComponent(contentTitles[index])
        do {
            try fileManager.removeItem(at: imagePath)
            updateContent()
        }
        catch let error {
            print(error)
        }
    }

    private func updateContent() {
        content.removeAll()
        contentTitles.removeAll()
        
        contentTitles = try! fileManager.contentsOfDirectory(at: documentDirectoryURL,
            includingPropertiesForKeys: nil).map {$0.lastPathComponent}
        contentTitles.forEach { contentPath in
            if let image = UIImage(contentsOfFile: documentDirectoryURL.appendingPathComponent(contentPath).path) {
                content.append(image)
            }
        }
    }
    
    /// Use shared property instead
    private init() {
        documentDirectoryURL = try! fileManager.url(for: .documentDirectory, in: [.userDomainMask], appropriateFor: nil, create: false)
        contentTitles = try! fileManager.contentsOfDirectory(at: documentDirectoryURL,
            includingPropertiesForKeys: nil).map {$0.lastPathComponent}
        updateContent()
    }
}
