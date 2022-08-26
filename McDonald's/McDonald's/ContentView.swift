//
//  ContentView.swift
//  McDonald's
//
//  Created by Nono. on 14/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var result = ""
    @State var finalresult = ""
    @State var price = ""
    @State var quanity = ["", "", "", "", ""]
    @State var total = 0.0
    var body: some View {
        
        ZStack {
            Color.red
                .ignoresSafeArea()
                
            VStack{
                
                Image("mc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(color: .black, radius: 30)
                
                Text("McDonald's")
                    .font(.system(size: 30, weight: .bold, design: .serif))
                
                menuView(quanity: $quanity[0], order: "Chicken Burger", Price:  "1.300")
                menuView(quanity: $quanity[1], order: "McChicken", Price: "1.300")
                menuView(quanity: $quanity[2], order: "Chicken Mac", Price:  "1.750")
                menuView(quanity: $quanity[3], order: "Happy Meal", Price:  "1.000")
                menuView(quanity: $quanity[4], order: "Mc Arabica", Price:  "1.300")
                   
                HStack{
                    TextField("المبلغ", text: $price)
                        .frame(width: 50, height: 20)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    Text("ادخل المبلغ الذي لديك الان")
                        .font(.title2)
                        .foregroundColor(.white)
                } .padding()
                
                
                
                HStack{
                    Text("اضغط لمعرفة الفاتورة")
                        .frame(width: 200, height: 50)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            let meal1 = (Double(quanity[0]) ?? 0 ) * 1.300
                            let meal2 = (Double(quanity[1]) ?? 0 ) * 1.300
                            let meal3 = (Double(quanity[2]) ?? 0 ) * 1.750
                            let meal4 = (Double(quanity[3]) ?? 0 ) * 1.000
                            let meal5 = (Double(quanity[4]) ?? 0 ) * 1.300
                            total = meal1 + meal2 + meal3 + meal4 + meal5
                            if price == ""
                            {
                                finalresult = "يرجى ادخال المبلغ"
                            }
                            
                            else if (Double(price) ?? 0) >= total
                            {
                                finalresult = "العملية تمت"
                            }
                            else if  (Double(price) ?? 0) < total
                            {
                                finalresult = "المبلغ غير كافي"
                           }
                                        }
        }
                HStack{
                    Text("\(total)")
                        .font(.title2)
                    Text("المبلغ الاجمالي")
                        .font(.system(size: 26, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            
                            

                } .padding()
                    
                
           } //Vstack
            VStack{
                Spacer()
                Text(finalresult)
            } .font(.largeTitle)
} //Zstack
        
       
            
            
        }
        
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}



struct menuView: View {
    @Binding var quanity: String
    var order: String
    var Price: String
    var body: some View {
        
        HStack {
                Text(order)
                Text("\(Price) KD")
                Spacer()
              TextField("الكمية", text: $quanity)
                .padding()
                    .background(.gray.opacity(0.3))
                    .frame(width: 100, height: 40)
                    .cornerRadius(10)
        }
            
            .frame(width: 360, height: 30)
        .font(.title2)
        .padding()
        
        .background(.white)
        .cornerRadius(10)
            
    }
}
