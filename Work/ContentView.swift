//
//  ContentView.swift
//  Work
//
//  Created by MacBook AIR on 17/01/2024.
//

import Foundation
import SwiftUI
//import PhoenixUIKit
struct ContentViewDexList: View {
    @State var isOn = true
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedFontSize = 1
    @State private var isChecked = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView{
            ScrollView {
                Group {
                    DexList(
                        leadingListData: .link(link: "Title")) {
                        }
                    
                    DexList(
                        leadingListData: .title(title: "Title")) {
                            // code here
                        }
                    
                    DexList(
                        leadingListData: .description(description: "Description")) {
                            // code here
                        }
                    DexList(
                        leadingListData: .radioTitleSubtitle(title: "Title", subtitle: "Subtitle", isChecked: $isChecked)){
                        isChecked.toggle()
                    }
                }
                
                Group {
                    DexList(
                        leadingListData: .icon(leadingIconName: DexIcons.icons.misc.icoVibrate)) {
                            // code here
                        }
                    
                    DexList(
                        leadingListData: .titleIcon(title: "Title", leadingIconName: DexIcons.icons.misc.icoVibrate)) {
                            // code here
                        }
                    
                    DexList(
                        leadingListData: .titleSmallIconSubtitle(
                            title: "Title",
                            subtitle: "Subtitle",
                            leadingIconName: DexIcons.icons.misc.icoVibrate)) {
                                // code here
                            }
                    
                    
                    DexList(
                        leadingListData: .titleBigIconSubtitle(title: "Title", subtitle: "Subtitle", leadingIconName: DexIcons.icons.misc.icoVibrate)) {
                        }
                    
                    DexList(
                        leadingListData: .titleSubtitle(title: "Title", subtitle: "Subtitle")) {
                            // code here
                            
                        }
                    
                   
                }
                
                Group {
                    DexList(
                        leadingListData: .title(title: "Title"),
                        trailingListData: .detailWithChevron(content: "Detail")
                    ) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"), trailingListData: .detailBadge(content: "Detail", count: 5)) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"),
                            trailingListData: .detailSmallIcon(content: "Detail", trailingIconName: DexIcons.icons.controls.icoInfo)) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"),
                            trailingListData: .detailIcon(content: "Detail",
                                                          trailingIconName: DexIcons.icons.controls.icoInfo)) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"), trailingListData: .detailToggle(content: "Detail", isOn: $isOn)) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"),
                            trailingListData: .icon(
                                trailingIconName: DexIcons.icons.controls.icoInfo,
                                trailingIconTint: .polarisColors.iconSecondary)) {
                                }
                    
                    DexList(leadingListData: .title(title: "Title"), trailingListData: .numberUnit(number: 8.0)) {
                    }
                    
                    DexList(leadingListData: .title(title: "Title"),
                            trailingListData: .numberUnitIcon(
                                number: 8.0, trailingIconName: DexIcons.icons.controls.icoChevronFw,
                                trailingIconTint: .polarisColors.iconSecondary)) {
                                }
                }
              
                    ContentViewDexSectionList()
                
            }
            .background(Color.polarisColors.backgroundPrimary)
            .preferredColorScheme(isDarkMode ? .dark : .light)
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button(action: {
                                   isDarkMode.toggle()
                               }) {
                                   Image(systemName: isDarkMode ? "moon.fill" : "moon")
                               }
                           }
                       }
              }
        }
    }
struct ContentViewDexSectionList: View {
    @State var isOn = true
    let sharedItem = DexSectionItem(
        leadingListData: .title(title: "Title"),
        trailingListData: .detailBadge(content: "Detail", count: 5)
    ) {}
    var body: some View {
        DexList(
            items: [
                sharedItem,
                sharedItem ,
                sharedItem,
                sharedItem,
                sharedItem,
            ]
        )
    }
}
struct ContentViewDexList_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewDexList()
    }
}
