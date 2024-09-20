//
//  MusicView.swift
//  hw2-spotify
//
//  Created by Alec Lobanov on 9/20/24.
//

import SwiftUI

struct MusicView: View {
    
    @State var currentTime: Double = 0.0
    @State var isPaused: Bool = false
    @State var isShuffle: Bool = false
    @State var isLiked: Bool = false
    @State var isRepeat: Bool = false
    
    let backgroundGradient =                 LinearGradient(gradient: Gradient(colors: [Color.lane8Dark, Color.lane8Light,Color.black]), startPoint: .top, endPoint: .bottom)
    
    let songDuration: Double = 238.0
    var body: some View {
        ZStack{
            backgroundGradient
            VStack{
                HStack{
                    Image(systemName:"chevron.down")
                        .foregroundStyle(.white)
                    Spacer()
                    Text("Liked Songs")
                        .fontWeight(.bold)
                        .font(.system(size:14))
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName:"ellipsis")
                        .foregroundStyle(.white)
                }.padding(.vertical,10)
                Image(.lane8)
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical,20)
                HStack{
                    VStack(alignment:.leading){
                        Text("Road")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.title2)
                            .foregroundStyle(.white)
                        Text("Lane 8, Arctic Lake")
                            .font(.callout)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Button(action:{isLiked.toggle()},
                           label:{
                        Image(systemName: isLiked ? "heart.fill": "heart")
                            .foregroundStyle(isLiked ? .green:.white)
                                .font(.title2)})
                    
                }.padding(.vertical)
                Slider(value: $currentTime, in: 0...songDuration)
                    .accentColor(.white)
                HStack{
                    Text("\(Int(currentTime)/60,specifier: "%01d"):\(Int(currentTime)%60,specifier: "%02d")")
                        .foregroundStyle(.gray)
                        .font(.system(size:10))
                    Spacer()
                    Text("-\((Int(songDuration) - Int(currentTime))/60,specifier: "%01d"):\((Int(songDuration) - Int(currentTime))%60,specifier: "%02d")")
                        .foregroundStyle(.gray)
                        .font(.system(size:10))
                }
                HStack{
                    Button(action:{isShuffle.toggle()},
                           label:{
                            Image(systemName:"shuffle")
                            .foregroundStyle(isShuffle ? .green:.white)
                                .font(.title2)})
                    Spacer()
                    Button(action:{},label:{
                        Image(systemName:"backward.end.fill")
                            .foregroundStyle(.white)
                            .font(.title)})
                    Spacer()
                    Button(action:{isPaused.toggle()},
                           label: {
                            Image(systemName: isPaused ? "pause.circle.fill": "play.circle.fill")
                                .foregroundStyle(.white)
                            .font(.system(size:64))})
                    Spacer()
                    Button(action:{},label:{
                        Image(systemName:"forward.end.fill")
                            .foregroundStyle(.white)
                            .font(.title)})
                    Spacer()
                    Button(action:{isRepeat.toggle()},
                           label:{
                            Image(systemName:"repeat")
                            .foregroundStyle(isRepeat ? .green:.white)
                                .font(.title2)})
                }.padding(.vertical,9)
                HStack{
                    Image(systemName:"airpods.gen3  ")
                        .foregroundStyle(.green)
                    Text("Alec's Airpods Pro")
                        .foregroundStyle(.green)
                        .font(.system(size:14))
                    Spacer()
                    Image(systemName:"square.and.arrow.up")
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    Image(systemName:"line.3.horizontal")
                        .foregroundStyle(.white)
                }.padding(.vertical)
            }
            .padding(.horizontal,30)
            .padding(.vertical,10)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MusicView()
}
