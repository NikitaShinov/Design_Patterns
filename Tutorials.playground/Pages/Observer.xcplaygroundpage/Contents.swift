//: [Previous](@previous)

import Combine

public class User {
    
    @Published var name: String
    
    public init(name: String) {
        self.name = name
    }
}

let name = User(name: "Nick")

let publisher = name.$name

var subscriber: AnyCancellable? = publisher.sink() {
    print ("User's name is: \($0)")
}

name.name = "Al"

subscriber = nil

name.name = "Nick has left the building"

//: [Next](@next)
