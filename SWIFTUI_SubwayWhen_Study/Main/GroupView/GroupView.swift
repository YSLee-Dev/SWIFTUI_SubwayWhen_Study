//
//  GroupView.swift
//  SWIFTUI_SubwayWhen_Study
//
//  Created by 이윤수 on 2023/04/26.
//

import SwiftUI

struct GroupView: View {
    @Binding var groupSelete : String
    
    let groupList = ["출근", "퇴근"]
    
    var body: some View {
        GeometryReader{ geomotry in
            VStack(alignment: .leading){
                Text("실시간 현황")
                    .foregroundColor(Color.gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                
                HStack(alignment: .center, spacing: 5){
                    ForEach(groupList, id: \.self){ data in
                        
                        if data == groupSelete{
                            Button {
                                print(data)
                                if data != groupSelete {
                                    groupSelete = groupSelete == "출근" ? "퇴근" : "출근"
                                }
                            } label: {
                                groupViewButton(title: data, isSeleted: true)
                            }
                            .frame(width: geomotry.size.width - 80,
                                   height: 40,
                                   alignment: .center
                            )
                            .background(.white)
                            .cornerRadius(15)
                            .overlay{
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder()
                                    .padding(1.5)
                            }
                            
                            
                        }else{
                            Button {
                                print(data)
                                if data != groupSelete {
                                    groupSelete = groupSelete == "출근" ? "퇴근" : "출근"
                                }
                            } label: {
                                groupViewButton(title: data, isSeleted: false)
                            }
                            .frame(width: geomotry.size.width - (geomotry.size.width - 75),
                                   height: 40,
                                   alignment: .center
                            )
                            .cornerRadius(20)
                        }
                    }
                }
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
                
                Spacer()
            }
        }
        .frame(height: 65)
        
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(groupSelete: .constant("퇴근"))
    }
}
