//
//  LeftCellData.swift
//  PhoenixUIKit
//
//  Created by Bharat Kumar on 12/4/23.
//  Copyright © 2023 Dexcom, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum LeadingListData {
    case description(description: String)
    case icon(leadingIconName: String)
    case link(link: String)
    case title(title: String)
    case titleIcon(title: String, leadingIconName: String)
    case titleSmallIconSubtitle(title: String, subtitle: String, leadingIconName: String)
    
    case titleBigIconSubtitle(title: String, subtitle: String, leadingIconName: String)
    
    case titleSubtitle(title: String, subtitle: String)
    
    case radioTitleSubtitle(title: String, subtitle: String, isChecked: Binding<Bool>)
    
    public var customWidth: CGFloat {
        switch self {
        case .titleSmallIconSubtitle:
            return 64
        case .titleSubtitle:
            return 72
        case .radioTitleSubtitle:
            return 72
        default:
            return 48
        }
    }
    
    public var customHeight: CGFloat {
        switch self {
        case .titleSmallIconSubtitle:
            return 64  // Adjust the height as needed
        case .titleSubtitle:
            return 72
        case .radioTitleSubtitle:
            return 72
        default:
            return 48
        }
    }
    
    public var body: AnyView {
        switch self {
        case .description(let description):
            return AnyView(HStack {
                Text(description)
                    .textStyle(.body3.regular.textSecondary)
                    .padding(.leading, 16)
                Spacer()
            }
              
            )
           
        case .icon(let leadingIconName):
            return AnyView(HStack {
                Image(leadingIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.polarisColors.iconPrimary)
                    .padding(.leading, 16)
                Spacer()
            }
            
            )
        case .link(let link):
            return AnyView(HStack {
                Text(link)
                    .textStyle(.body2.regular.textDecorative1)
                    .padding(.leading, 16)
                Spacer()
            }
            )
        case .title(let title):
            return AnyView(HStack {
                Text(title)
                    .textStyle(.body2.regular.textPrimary)
                    .padding(.leading, 16)
                Spacer()
            }
         
            )
        case .titleIcon(let title, let leadingIconName):
            return AnyView(HStack {
                Image(leadingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.polarisColors.iconPrimary)
                    .padding(.leading, 16)
                    .padding(.trailing,8)
                   
                Text(title)
                    .textStyle(.body2.regular.textPrimary)
                Spacer()
            }
         
            )
        case .titleSmallIconSubtitle(let title, let subtitle, let leadingIconName):
            return AnyView(HStack(alignment: .top) {
                Image(leadingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.polarisColors.iconPrimary)
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                VStack(alignment: .leading) {
                    Text(title)
                        .textStyle(.body2.regular.textPrimary)
                    Text(subtitle)
                        .textStyle(.body3.regular.textSecondary)
                }
                .frame(maxHeight: 64)
                Spacer()
            })
            
        case .titleBigIconSubtitle(let title, let subtitle, let leadingIconName):
            return AnyView(HStack {
                Image(leadingIconName, bundle: PhoenixSwiftUIKitResources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.polarisColors.iconPrimary)
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                VStack(alignment: .leading) {
                    Text(title)
                        .textStyle(.body2.regular.textPrimary)
                    Text(subtitle)
                        .textStyle(.body3.regular.textSecondary)
                }
                .frame(maxHeight: 64)
                Spacer()
            })
            
        case .titleSubtitle(let title, let subtitle):
            return AnyView(HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .textStyle(.body2.regular.textPrimary)
                    Text(subtitle)
                        .textStyle(.body3.regular.textSecondary)
                }
                .padding(.leading, 16)
                .frame(maxHeight: 72)
                Spacer()
            })
            
        case .radioTitleSubtitle(let title, let subtitle, let isChecked):
            return AnyView(
                HStack(alignment: .top,spacing: 8) {
                    VStack {
                        Image(isChecked.wrappedValue ? DexIcons.icons.controls.icoRadioActive : DexIcons.icons.controls.icoRadioInactive, bundle: PhoenixSwiftUIKitResources)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundColor(isChecked.wrappedValue ? .polarisColors.iconTertiary : .polarisColors.iconPrimary)
                            .padding(.bottom,15.7)
                            .padding(.leading,16)
                        
                      }
                    .frame(maxHeight: 72)
                    VStack(alignment: .leading) {
                        Text(title)
                            .textStyle(.body2.regular.textPrimary)
                        Text(subtitle)
                            .textStyle(.body3.regular.textSecondary)
                      
                    }
                    .frame(maxHeight: 72)
                    Spacer()
                }
                .frame(maxHeight: 72)
                
            )
        }
    }
}

struct LeadingListDataDemo: View {
    let leadingListData: LeadingListData
    
    var body: some View {
        leadingListData.body
    }
}

struct LeadingListDataDemo_Previews: PreviewProvider {
    static var previews: some View {
        LeadingListDataDemo(leadingListData: .radioTitleSubtitle(title: "Title", subtitle: "Subtitle", isChecked: .constant(true)))
    }
}
