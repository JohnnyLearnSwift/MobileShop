//
//  MainView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @State var isShow = false
    let orangeColor = Colors.orange
    let blackColor = Colors.black
    let grayColor = Colors.grayForChevron
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        HStack {
                            Image("Pin")
                                .frame(width: 12, height: 15)
                            TextViewWithParams(text: "Zihuatanejo, Gro",
                                               font: Fonts.shared.getMediumFont(size: 15),
                                               color: blackColor)
                            Image(systemName: "chevron.down")
                                .frame(width: 10, height: 5)
                                .foregroundColor(grayColor)
                        }
                        HStack {
                            Spacer()
                            Button {
                                isShow.toggle()
                            } label: {
                                Image("Filter")
                                    .padding(.trailing, 33)
                                    .frame(width: 11, height: 13)
                                    .foregroundColor(blackColor)
                            }
                        }
                    }
                    TextViewTitleHStack(leftTitle: "Select category", rightTitle: "view all")
                    
                    CircleCategories()
                }
                VStack {
                    TextViewTitleHStack(leftTitle: "Hot sales", rightTitle: "see more")
                    HotSales(phones: viewModel)
                }
                VStack {
                    
                    if isShow {
                        FilterView(isShow: $isShow)
                    } else {
                        TextViewTitleHStack(leftTitle: "Best sellers", rightTitle: "see more")
                        BestSellerCollectionView(mainViewModel: viewModel)
                        BottomBarView(mainViewModel: viewModel)
                    }
                    
                }
            }
            .onAppear {
                viewModel.fetchPhones()
                viewModel.fetchPhoneProperties()
                viewModel.fetchCart()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
