 
/**
  Meme model
*/
public struct Meme {
    
    let id: String;
    let photoUrl: String;
    
    init(_ id: String, photoUrl: String) {
        self.id = id;
        self.photoUrl = photoUrl;
    }
}
