
import Foundation

struct Member {
    let name: String
    let description: String
    let imageAssetName: String?
    
    init(name: String, description: String, imageAssetName: String?) {
        self.name = name
        self.description = description
        self.imageAssetName = imageAssetName
    }
    
    init(name: String, description: String) {
        self.init(name: name, description: description, imageAssetName: nil)
    }
}
