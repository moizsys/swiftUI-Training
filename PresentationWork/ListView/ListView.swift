    //
    //  ContentView.swift
    //  PresentationWork
    //
    //  Created by Aaban Tariq Murtaza on 16/11/2023.
    //

import SwiftUI


struct ListView: View {
    
    @State var students = [Student(name: "Aaban", programme: "BS-SE", grade: "A"),
                           Student(name: "Hamza", programme: "BS-CS", grade: "A")]
    @State var isActive: Bool = false
    @Binding var showMenu: Bool
    @State var selectedStudent: Student? // Add a state variable to track the selected student
    @State private var isEditing: Bool = false
    @State private var editedName: String = ""
    @State private var editedProgramme: String = ""
    @State private var editedGrade: String = ""
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students) { student in
                    StudentRowView(student: student)
                        .swipeActions(edge: .leading) {
                            Button("Delete") {
                                if let index = students.firstIndex(where: { $0.name == student.name }) {
                                    students.remove(at: index)
                                }
                            }
                            .frame(width: 100)
                        }
                        .onTapGesture {
                            selectedStudent = student
                            editedName = student.name
                            editedProgramme = student.programme
                            editedGrade = student.grade
                            isEditing = false // Reset editing state
                            isActive = true
                        }
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Menu") {
                        showMenu = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddStudentView(students: $students)) {
                        Text("Add Student")
                    }
                }
            })
            .navigationDestination(isPresented: $isActive) {
                VStack {
                    Spacer()
                    
                    if isEditing {
                        TextField("Name", text: $editedName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        
                        TextField("Grade", text: $editedGrade)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        
                        TextField("Program", text: $editedProgramme)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    } else {
                        Text("Name: \(selectedStudent?.name ?? "")")
                            .font(.headline)
                            .padding()
                        
                        Text("Grade: \(selectedStudent?.grade ?? "")")
                            .font(.headline)
                            .padding()
                        
                        Text("Program: \(selectedStudent?.programme ?? "")")
                            .font(.headline)
                            .padding()
                    }
                    
                    Spacer()
                    
                    if isEditing {
                        HStack {
                            Button(action: {
                                updateStudent()
                            }) {
                                Text("Done")
                                    .frame(minWidth: 0, maxWidth: .infinity/2) // Full width
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                                    .cornerRadius(40)
                                    .padding()
                            }
                            Button(action: {
                                resetEditingState()
                            }) {
                                Text("Discard")
                                    .frame(minWidth: 0, maxWidth: .infinity/2) // Full width
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(40)
                                    .padding()
                            }
                        }
                        .padding()
                    } else {
                        Button(action: {
                            isEditing = true
                                // Initialize edited values with the current student's data
                            editedName = selectedStudent?.name ?? ""
                            editedProgramme = selectedStudent?.programme ?? ""
                            editedGrade = selectedStudent?.grade ?? ""
                            
                        }) {
                            Text("Edit")
                                .frame(minWidth: 0, maxWidth: .infinity) // Full width
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(red: 93/255, green: 176/255, blue: 117/255))
                                .cornerRadius(40)
                                .padding()
                        }
                    }
                    
                }
                .padding()
            }
            Spacer()
        }
    }
    private func updateStudent() {
            // Update the data with edited values
        if let index = students.firstIndex(where: { $0.id == selectedStudent?.id }) {
            students[index].name = editedName
            students[index].programme = editedProgramme
            students[index].grade = editedGrade
        }
            // Disable editing mode
        isEditing = false
        isActive = false
    }
    private func resetEditingState() {
            // Reset to initial values
        editedName = editedName
        editedProgramme = editedProgramme
        editedGrade = editedGrade
            // Disable editing mode
        isEditing = false
    }
    
}

struct StudentRowView: View {
    let student: Student
    let padding: CGFloat = 20
    let deleteButtonWidth: CGFloat = 100
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack (alignment: .leading) {
                    Text(student.name)
                    Text(student.programme)
                }
                Spacer()
                Text(student.grade)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Student: Identifiable {
    var id = UUID()
    var name: String
    var programme: String
    var grade: String
}

struct FilledButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(10)
    }
}


    //#Preview {
    //    ListView()
    //}
