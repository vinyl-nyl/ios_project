import UIKit

for i in 1...3 {
    print(i * 10)
}

print("------------")

for i in 1...9 {
    print("2 * \(i) = \(2*i)")
}

print("------------")

let 게임들 = ["GTA5", "LOL", "Mincraft"]

for 게임 in 게임들 {
    print(게임)
}
print("------------")

게임들.forEach {
    print($0) // forEach에서만 사용가능
}
