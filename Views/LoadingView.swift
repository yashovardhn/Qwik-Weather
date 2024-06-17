//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Yashovardhn on 15/03/22.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - Body
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
