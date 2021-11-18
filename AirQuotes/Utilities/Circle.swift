//
//  Circle.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import Foundation
import SwiftUI

HStack{
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.red)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.green)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.yellow)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.pink)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.blue)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
        
}
.padding()
HStack{
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.orange)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.purple)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.white)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.black)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
    Circle()
        .frame(width: 50, height: 50, alignment: .center)
        .opacity(0.4)
        .foregroundColor(.gray)
        .padding(.horizontal, 10)
        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
        
}
