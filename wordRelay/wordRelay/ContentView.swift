//
//  ContentView.swift
//  wordRelay
//
//  Created by junil on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var nextWord: String = ""
//    @State var words: [String] = ["물컵", "컵받침", "침착맨"]
    @State var words = ["Apple", "Elsa", "Aladin"]
    @State var showAlert: Bool = false
    
    var body: some View {
        TitleView()
        
        HStack {
            TextField("단어를 입력하세요", text: $nextWord)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2))
            
            Button(action: {
                // 동작
                print("입력한 단어:", nextWord)
                
                //사용자가 입력한 단어: nextWord
                //단어들의 목록: words
                if words.last?.last?.lowercased() == nextWord.first?.lowercased() {
                    // 끝말이 이어지는 상황
                    words.append(nextWord)
                    nextWord = ""
                } else {
                    // 끝말이 이어지지 않는 상황
                    showAlert = true
                    nextWord = ""
                }
                
            }, label: {
                Text("확인")
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(RoundedRectangle(cornerRadius: 10))
            })
            .alert("끝말이 이어지는 단어를 입력해주세요.", isPresented: $showAlert) {
                Button("확인", role: .cancel) {
                    showAlert = false
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
        
        List {
            ForEach(words.reversed(), id: \.self) { words in
                Text(words)
                    .font(.title2)
            }
        }
        .listStyle(.plain)
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
