//: [Previous](@previous)

import Combine


/*
 
 Шаблон наблюдателя позволяет одному объекту наблюдать за изменениями другого объекта. Apple добавила поддержку этого шаблона на уровне языка в Swift 5.1 с добавлением Publisher в структуру Combine.
 
 Этот шаблон включает в себя три типа:
 1. Subscriber является объектом «наблюдатель» и получает обновления.
 2. Publisher является «наблюдаемым» объектом и отправляет обновления.
 3. value — это измененный базовый объект.
 
 Используйте шаблон наблюдателя всякий раз, когда вы хотите получить изменения, сделанные на другом объекте.
 Этот шаблон часто используется с MVC, где у контроллера представления есть подписчики, а у модели есть издатели. Это позволяет модели передавать изменения обратно в контроллер представления без необходимости знать что-либо о типе контроллера представления. Таким образом, разные контроллеры представления могут использовать и наблюдать за изменениями одного и того же типа модели.
 
 */
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