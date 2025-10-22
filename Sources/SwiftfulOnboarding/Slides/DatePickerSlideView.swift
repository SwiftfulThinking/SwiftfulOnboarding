//
//  DatePickerSlideView.swift
//  SwiftfulOnboarding
//
//  Created on 10/19/25.
//

import SwiftUI

enum OnbDatePickerPosition {
    case auto
    case bottom
}

enum OnbDatePickerStyle {
    case graphical
    case wheel
    case compact
}

enum OnbDatePickerComponents {
    case date
    case dateTime
    case time

    var displayedComponents: DatePickerComponents {
        switch self {
        case .date:
            return .date
        case .dateTime:
            return [.date, .hourAndMinute]
        case .time:
            return .hourAndMinute
        }
    }
}

struct DatePickerSlideView: View {

    var title: String? = nil
    var titleFont: Font = .largeTitle
    var subtitle: String? = nil
    var subtitleFont: Font = .body
    var titleSubtitleSpacing: CGFloat = 8
    var titleAlignment: OnbTextAlignment = .center
    var contentAlignment: OnbContentAlignment = .center
    var paddingTop: CGFloat = 40
    var paddingBottom: CGFloat = 0
    var horizontalPaddingTitle: CGFloat = 40
    var contentSpacing: CGFloat = 24
    var datePickerPosition: OnbDatePickerPosition = .auto
    var datePickerStyle: OnbDatePickerStyle = .graphical
    var datePickerComponents: OnbDatePickerComponents = .date
    var datePickerStartDate: Date? = nil
    var datePickerMinimumDate: Date? = nil
    var datePickerMaximumDate: Date? = nil
    var datePickerHorizontalPadding: CGFloat = 24
    var footerData: OnbFooterData = .default
    var ctaText: String = "Continue"
    var ctaButtonStyle: OnbButtonStyleType = .solid(backgroundColor: .blue, textColor: .white)
    var ctaButtonFormatData: OnbButtonFormatData = .default
    var onButtonClick: (([OnbChoiceOption]) -> Void)? = nil
    var selectedOptions: [OnbChoiceOption] = []

    @State private var selectedDate: Date = Date()

    private var initialDate: Date {
        if let savedDate = selectedOptions.first?.content.text,
           let timestamp = TimeInterval(savedDate),
           timestamp > 0 {
            return Date(timeIntervalSince1970: timestamp)
        }
        return datePickerStartDate ?? Date()
    }

    private func dateToOption(_ date: Date) -> OnbChoiceOption {
        let timestamp = date.timeIntervalSince1970
        return OnbChoiceOption(
            id: "date_picker",
            content: OnbButtonContentData(text: "\(timestamp)")
        )
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: contentSpacing) {
                // Title and subtitle
                OnbTitleContent(
                    title: title,
                    titleFont: titleFont,
                    subtitle: subtitle,
                    subtitleFont: subtitleFont,
                    spacing: titleSubtitleSpacing,
                    alignment: titleAlignment
                )
                .padding(.horizontal, horizontalPaddingTitle)

                // Date picker
                Group {
                    if let minimumDate = datePickerMinimumDate, let maximumDate = datePickerMaximumDate {
                        switch datePickerStyle {
                        case .graphical:
                            DatePicker("", selection: $selectedDate, in: minimumDate...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                        case .wheel:
                            DatePicker("", selection: $selectedDate, in: minimumDate...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                        case .compact:
                            DatePicker("", selection: $selectedDate, in: minimumDate...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.compact)
                                .labelsHidden()
                        }
                    } else if let minimumDate = datePickerMinimumDate {
                        switch datePickerStyle {
                        case .graphical:
                            DatePicker("", selection: $selectedDate, in: minimumDate..., displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                        case .wheel:
                            DatePicker("", selection: $selectedDate, in: minimumDate..., displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                        case .compact:
                            DatePicker("", selection: $selectedDate, in: minimumDate..., displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.compact)
                                .labelsHidden()
                        }
                    } else if let maximumDate = datePickerMaximumDate {
                        switch datePickerStyle {
                        case .graphical:
                            DatePicker("", selection: $selectedDate, in: ...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                        case .wheel:
                            DatePicker("", selection: $selectedDate, in: ...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                        case .compact:
                            DatePicker("", selection: $selectedDate, in: ...maximumDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.compact)
                                .labelsHidden()
                        }
                    } else {
                        switch datePickerStyle {
                        case .graphical:
                            DatePicker("", selection: $selectedDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.graphical)
                                .labelsHidden()
                        case .wheel:
                            DatePicker("", selection: $selectedDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                        case .compact:
                            DatePicker("", selection: $selectedDate, displayedComponents: datePickerComponents.displayedComponents)
                                .datePickerStyle(.compact)
                                .labelsHidden()
                        }
                    }
                }
                .onAppear {
                    selectedDate = initialDate
                }
                .padding(.horizontal, datePickerHorizontalPadding)
                .frame(maxWidth: .infinity, maxHeight: datePickerPosition == .bottom ? .infinity : nil, alignment: datePickerPosition == .bottom ? .bottom : .center)
            }
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: contentAlignment.alignment)

            // Continue button at bottom
            Text(ctaText)
                .onbButtonStyle(
                    style: ctaButtonStyle,
                    format: ctaButtonFormatData
                ) {
                    let option = dateToOption(selectedDate)
                    onButtonClick?([option])
                }
                .padding(.top, footerData.top)
                .padding(.leading, footerData.leading)
                .padding(.trailing, footerData.trailing)
                .padding(.bottom, footerData.bottom)
        }
    }
}

#Preview {
    let calendar = Calendar.current
    let today = Date()
    let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: today)!
    let oneMonthFromNow = calendar.date(byAdding: .month, value: 1, to: today)!
    let eighteenYearsAgo = calendar.date(byAdding: .year, value: -18, to: today)!

    return SwiftfulOnboardingView(
        configuration: OnbConfiguration(
            headerStyle: .progressBar,
            headerAlignment: .center,
            showBackButton: .afterFirstSlide,
            slides: [
                .datePicker(
                    id: "slide1",
                    title: "When's your birthday?",
                    subtitle: "Date only - must be 18+",
                    datePickerStyle: .graphical,
                    datePickerComponents: .date,
                    datePickerMaximumDate: eighteenYearsAgo
                ),
                .datePicker(
                    id: "slide2",
                    title: "Schedule appointment",
                    subtitle: "Date and time - next 30 days",
                    datePickerStyle: .wheel,
                    datePickerComponents: .dateTime,
                    datePickerMinimumDate: today,
                    datePickerMaximumDate: oneMonthFromNow
                ),
                .datePicker(
                    id: "slide3",
                    title: "Choose a time",
                    subtitle: "Time only - compact style",
                    datePickerStyle: .compact,
                    datePickerComponents: .time
                )
            ]
        )
    )
}
