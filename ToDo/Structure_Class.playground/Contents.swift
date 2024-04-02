import UIKit

let pokemons: [String] = ["피카츄", "파이리", "꼬부기"]

class Pokemon {
    var name: String = ""
    var number: Int = 0
    var attribute: String = ""
}

var pokemon = Pokemon()
pokemon.name = "피카츄"
pokemon.number = 25
pokemon.attribute = "전기"

print("이름 : \(pokemon.name)")
print("번호 : \(pokemon.number)")
print("속성 : \(pokemon.attribute)")

print("====================")

class Student {
    var name: String
    var grade: Int
    
    init(name: String, grade: Int) {
        self.name = name
        self.grade = grade
    }
}

var student1 = Student(name: "donghwan", grade: 5)

print("학생의 이름 : \(student1.name)")
print("학생의 학년 : \(student1.grade)")
