//: [Previous](@previous)

import UIKit

/* Шаблон singleton ограничивает класс только одним экземпляром. Каждая ссылка на класс относится к одному и тому же базовому экземпляру. Этот шаблон чрезвычайно распространен в разработке приложений для iOS, поскольку Apple широко использует его.
 
 Также распространен шаблон «singleton plus», который предоставляет общий экземпляр singleton, который также позволяет создавать другие экземпляры.
 
 Используйте шаблон singleton, когда наличие более одного экземпляра класса вызовет проблемы или когда это просто нелогично.
 Используйте шаблон singleton plus, если общий экземпляр полезен большую часть времени, но вы также хотите разрешить создание пользовательских экземпляров. Примером этого является FileManager, который обрабатывает все, что связано с доступом к файловой системе. Существует экземпляр «по умолчанию», который является синглтоном, или вы можете создать свой собственный. Обычно вы создаете свой собственный, если используете его в фоновом потоке.
 
 Если вы столкнулись с ситуацией, когда у вас возникает соблазн использовать синглтон, сначала рассмотрите другие способы выполнения вашей задачи.
 Например, синглтоны не подходят, если вы просто пытаетесь передать информацию от одного контроллера представления к другому. Вместо этого рассмотрите возможность передачи моделей через инициализатор или свойство.
 Если вы решите, что вам действительно нужен синглтон, подумайте, имеет ли больше смысла синглтон плюс.
 Будет ли наличие более одного экземпляра вызывать проблемы? Будет ли когда-нибудь полезно иметь пользовательские экземпляры? Ваши ответы определят, лучше ли вам использовать настоящий синглтон или синглтон плюс.
 Самая распространенная причина, по которой синглтоны проблематичны, — это тестирование. Если у вас есть состояние, хранящееся в глобальном объекте, таком как синглтон, то порядок тестов может иметь значение, и издеваться над ними может быть болезненно. Обе эти причины делают тестирование болезненным.
 Наконец, остерегайтесь «запаха кода», указывающего на то, что ваш вариант использования вообще не подходит в качестве синглтона. Например, если вам часто требуется много пользовательских экземпляров, ваш вариант использования может быть лучше, чем обычный объект.
 
 */

let app = UIApplication.shared

class MySingletone {
    
    static let shared = MySingletone()
    private init() {}
    
}

let mySingletone = MySingletone.shared

let defaultmanager = FileManager.default
// Singletone plus
let customFileManager = FileManager()


class MySingletoneTwo {
    
    static let shared = MySingletoneTwo()
    public init() {}
    
}

let singletonePlus = MySingletoneTwo.shared
let singletonePlusTwo = MySingletoneTwo()
//: [Next](@next)
