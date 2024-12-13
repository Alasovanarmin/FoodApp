//
//  RegisterViewModel.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 11.12.24.
//


class RegisterViewModel {
    private var fileManagerAdapter = FileManagerHelper()
    private var users = [User]()
    
    func getData() {
        self.users = fileManagerAdapter.readUserData()
    }
    
    func getLastUserId() -> Int {
        return users.last?.id ?? 0
    }
    
    func saveUserData(user: User) {
        users.append(user)
        fileManagerAdapter.writeUserData(users: users)
    }
    
}

