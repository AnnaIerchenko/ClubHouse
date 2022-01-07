//
//  ContentView.swift
//  ClubHouse
//
//  Created by Ierchenko Anna  on 12/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).ignoresSafeArea()
            ScrollView {
                ForEach(0 ..< 5) { item in
                    CardView()
                        .onTapGesture {
                            show = true
                        }
                }
            }
            .padding(.top, 80)
            Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).frame(height: 100).ignoresSafeArea()
            if show {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.white)
                .padding(.top, 120)
                .ignoresSafeArea(.all, edges: .bottom)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                .animation(.spring(response: 0.5, dampingFraction: 0.8))
                .transition(.move(edge: .bottom))
                .onTapGesture {
                    show = false
                }
                .zIndex(1)
            }
            TopBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar: View {
    var body: some View {
    HStack(spacing: 16) {
        Image(systemName: "magnifyingglass")
      Spacer()
        Image(systemName: "calendar")
        Image(systemName: "envelope.open")
        Image(systemName: "bell")
        Image(uiImage: #imageLiteral(resourceName: "avatar2"))
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .frame(width: 36, height: 36)
  }
    .foregroundColor(.white)
    .font(.system(size: 20))
    .padding(20)
    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
    }
}

struct AvatarView: View {
    var image =  #imageLiteral(resourceName: "avatar1")
    var body: some View {
        Image(uiImage: image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .frame(width: 44, height: 44)
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Designer & Developers")
                .foregroundColor(Color.primary.opacity(0.7))
            Text("UI Design and Swift Ui")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            AvatarView(image: #imageLiteral(resourceName: "avatar2"))
                .overlay(AvatarView(image: #imageLiteral(resourceName: "avatar1")).offset(x: 20, y: 20))
                            
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal)
        .padding(.vertical,8)
        }
}
