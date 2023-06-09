//
//  ContentView.swift
//  KOC2023
//
//  Created by Michael Lazar on 6/8/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Ticket]
	@State var chosenTicket: Int?
    
	var body: some View {
		NavigationView {
			VStack {
				HStack {
					Spacer()
					TextField ("Chosen Ticket", value: $chosenTicket, format: .number.grouping(.never))
						.padding()
					.font(.title)
					Spacer()
				}
				HStack {
					Text("Week ")
					Text("Cards Left:")
					Text("$$$")
				}
				List {
					ForEach(items) { item in
						NavigationLink {
							Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
						} label: {
							Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
						}
					}
					.onDelete(perform: deleteItems)
				}
				.toolbar {
#if os(iOS)
					ToolbarItem(placement: .navigationBarTrailing) {
						EditButton()
					}
#endif
					ToolbarItem {
						Button(action: addItem) {
							Label("Add Item", systemImage: "plus")
						}
					}
				}
				Text("Select an item")
			}
		}
	}
		
		private func addItem() {
			withAnimation {
				let newItem = Ticket(timestamp: Date())
				modelContext.insert(newItem)
			}
		}
		
		private func deleteItems(offsets: IndexSet) {
			withAnimation {
				for index in offsets {
					modelContext.delete(items[index])
				}
			}
		}
	}

#Preview {
    ContentView()
        .modelContainer(for: Ticket.self, inMemory: true)
}
