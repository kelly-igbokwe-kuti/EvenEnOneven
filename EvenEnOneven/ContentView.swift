//
//  ContentView.swift
//  EvenEnOneven
//
//  Een eenvoudige SwiftUI-oefening: controleer of een geheel getal even of oneven is.
//

import SwiftUI

struct ContentView: View {
    // @State bewaart de invoer. SwiftUI werkt de interface bij wanneer deze waarde wijzigt.
    @State private var invoer = ""

    // Int(...) probeert de tekst om te zetten naar een geheel getal.
    // Bij ongeldige invoer (bv. "abc" of "2,5") wordt de waarde nil.
    private var getal: Int? {
        Int(invoer.trimmingCharacters(in: .whitespacesAndNewlines))
    }

    private var resultaat: String {
        if invoer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return "Vul een geheel getal in."
        }

        guard let waarde = getal else {
            return "Ongeldige invoer: gebruik een geheel getal."
        }

        // De rest bij delen door 2 is 0 voor alle even getallen.
        // Ook negatieve even getallen, bijvoorbeeld -4, voldoen hieraan.
        return waarde % 2 == 0
            ? "\(waarde) is even."
            : "\(waarde) is oneven."
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "number.square.fill")
                .font(.system(size: 50))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("Even of oneven?")
                .font(.largeTitle.bold())

            Text("Voer een geheel getal in en ontdek het resultaat.")
                .multilineTextAlignment(.center)

            TextField("Bijvoorbeeld 42", text: $invoer)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Geheel getal")

            Text(resultaat)
                .font(.title3)
                .bold()
                .accessibilityIdentifier("resultaat")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
