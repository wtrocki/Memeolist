//  This file was automatically generated and should not be edited.

import Apollo

public final class CreateMemeMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateMeme($title: String!, $photoUrl: String!) {\n  createMeme(title: $title, photoUrl: $photoUrl) {\n    __typename\n    ...MemeDetails\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(MemeDetails.fragmentDefinition) }

  public var title: String
  public var photoUrl: String

  public init(title: String, photoUrl: String) {
    self.title = title
    self.photoUrl = photoUrl
  }

  public var variables: GraphQLMap? {
    return ["title": title, "photoUrl": photoUrl]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMeme", arguments: ["title": GraphQLVariable("title"), "photoUrl": GraphQLVariable("photoUrl")], type: .object(CreateMeme.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMeme: CreateMeme? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMeme": createMeme.flatMap { (value: CreateMeme) -> ResultMap in value.resultMap }])
    }

    public var createMeme: CreateMeme? {
      get {
        return (resultMap["createMeme"] as? ResultMap).flatMap { CreateMeme(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createMeme")
      }
    }

    public struct CreateMeme: GraphQLSelectionSet {
      public static let possibleTypes = ["Meme"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, photoUrl: String, votes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "title": title, "photoUrl": photoUrl, "votes": votes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Meme title
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var photoUrl: String {
        get {
          return resultMap["photoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
        }
      }

      public var votes: Int? {
        get {
          return resultMap["votes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "votes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var memeDetails: MemeDetails {
          get {
            return MemeDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AllMemesQuery: GraphQLQuery {
  public let operationDefinition =
    "query AllMemes {\n  memes: allMemes(orderBy: id_DESC) {\n    __typename\n    ...MemeDetails\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(MemeDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allMemes", alias: "memes", arguments: ["orderBy": "id_DESC"], type: .nonNull(.list(.nonNull(.object(Meme.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(memes: [Meme]) {
      self.init(unsafeResultMap: ["__typename": "Query", "memes": memes.map { (value: Meme) -> ResultMap in value.resultMap }])
    }

    public var memes: [Meme] {
      get {
        return (resultMap["memes"] as! [ResultMap]).map { (value: ResultMap) -> Meme in Meme(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Meme) -> ResultMap in value.resultMap }, forKey: "memes")
      }
    }

    public struct Meme: GraphQLSelectionSet {
      public static let possibleTypes = ["Meme"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, photoUrl: String, votes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "title": title, "photoUrl": photoUrl, "votes": votes])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Meme title
      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var photoUrl: String {
        get {
          return resultMap["photoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
        }
      }

      public var votes: Int? {
        get {
          return resultMap["votes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "votes")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var memeDetails: MemeDetails {
          get {
            return MemeDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct MemeDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment MemeDetails on Meme {\n  __typename\n  id\n  title\n  photoUrl\n  votes\n}"

  public static let possibleTypes = ["Meme"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
    GraphQLField("votes", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String? = nil, photoUrl: String, votes: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "title": title, "photoUrl": photoUrl, "votes": votes])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// Meme title
  public var title: String? {
    get {
      return resultMap["title"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var photoUrl: String {
    get {
      return resultMap["photoUrl"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "photoUrl")
    }
  }

  public var votes: Int? {
    get {
      return resultMap["votes"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "votes")
    }
  }
}