import SwiftUI

struct UpcomingRemindersTitle: View {
    @ObservedObject var userPreferences = UserPreferences.instance
    
    @State var intervalButtonIsHovered = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(rmbLocalized(.upcomingRemindersTitle))
                .font(.headline)
                .foregroundColor(.red)
                .padding(.bottom, 5)
            
            Spacer()
            
            Menu {
                ForEach(ReminderInterval.allCases, id: \.rawValue) { interval in
                    Button(action: { userPreferences.upcomingRemindersInterval = interval }) {
                        let isSelected = interval == userPreferences.upcomingRemindersInterval
                        SelectableView(title: interval.title, isSelected: isSelected)
                    }
                }
            } label: {
                Label(userPreferences.upcomingRemindersInterval.title, systemImage: "calendar")
            }
            .menuStyle(BorderlessButtonMenuStyle())
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(intervalButtonIsHovered ? Color("buttonHover") : nil)
            .cornerRadius(6)
            .onHover { isHovered in
                intervalButtonIsHovered = isHovered
            }
            .padding(.trailing, 1)
            .fixedSize(horizontal: true, vertical: true)
            .help(rmbLocalized(.upcomingRemindersIntervalSelectionHelp))
        }
    }
}

struct UpcomingRemindersTitle_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingRemindersTitle()
    }
}
