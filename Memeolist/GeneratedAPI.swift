//  This file was automatically generated and should not be edited.

import Apollo

public enum _ModelMutationType: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case created
  case updated
  case deleted
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CREATED": self = .created
      case "UPDATED": self = .updated
      case "DELETED": self = .deleted
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .created: return "CREATED"
      case .updated: return "UPDATED"
      case .deleted: return "DELETED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: _ModelMutationType, rhs: _ModelMutationType) -> Bool {
    switch (lhs, rhs) {
      case (.created, .created): return true
      case (.updated, .updated): return true
      case (.deleted, .deleted): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

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
        GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photoUrl: String, votes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photoUrl": photoUrl, "votes": votes])
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

public final class NewMemeMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation newMeme($url: String!, $votes: Int) {\n  createMeme(photoUrl: $url, votes: $votes) {\n    __typename\n    id\n    photoUrl\n  }\n}"

  public var url: String
  public var votes: Int?

  public init(url: String, votes: Int? = nil) {
    self.url = url
    self.votes = votes
  }

  public var variables: GraphQLMap? {
    return ["url": url, "votes": votes]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMeme", arguments: ["photoUrl": GraphQLVariable("url"), "votes": GraphQLVariable("votes")], type: .object(CreateMeme.selections)),
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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photoUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photoUrl": photoUrl])
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

      public var photoUrl: String {
        get {
          return resultMap["photoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
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
        GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
        GraphQLField("votes", type: .scalar(Int.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, photoUrl: String, votes: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photoUrl": photoUrl, "votes": votes])
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

public final class CreateMemeSubscription: GraphQLSubscription {
  public let operationDefinition =
    "subscription createMeme {\n  Meme(filter: {mutation_in: [CREATED]}) {\n    __typename\n    mutation\n    node {\n      __typename\n      id\n      photoUrl\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Meme", arguments: ["filter": ["mutation_in": ["CREATED"]]], type: .object(Meme.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(meme: Meme? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "Meme": meme.flatMap { (value: Meme) -> ResultMap in value.resultMap }])
    }

    public var meme: Meme? {
      get {
        return (resultMap["Meme"] as? ResultMap).flatMap { Meme(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Meme")
      }
    }

    public struct Meme: GraphQLSelectionSet {
      public static let possibleTypes = ["MemeSubscriptionPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mutation", type: .nonNull(.scalar(_ModelMutationType.self))),
        GraphQLField("node", type: .object(Node.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(mutation: _ModelMutationType, node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "MemeSubscriptionPayload", "mutation": mutation, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var mutation: _ModelMutationType {
        get {
          return resultMap["mutation"]! as! _ModelMutationType
        }
        set {
          resultMap.updateValue(newValue, forKey: "mutation")
        }
      }

      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes = ["Meme"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, photoUrl: String) {
          self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photoUrl": photoUrl])
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

        public var photoUrl: String {
          get {
            return resultMap["photoUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "photoUrl")
          }
        }
      }
    }
  }
}

public struct MemeDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment MemeDetails on Meme {\n  __typename\n  id\n  photoUrl\n  votes\n}"

  public static let possibleTypes = ["Meme"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("photoUrl", type: .nonNull(.scalar(String.self))),
    GraphQLField("votes", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, photoUrl: String, votes: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Meme", "id": id, "photoUrl": photoUrl, "votes": votes])
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