
Group Project - README Template
===

# ScannerApp
## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our app will allow users to be able to scan a QR code on items that can be easily lost. For example wallets, keys and other things. Our app will read the QR code and give information about the person who owns the item, like the name, phone number, and other ways to contact them. Our app will also allow for users to change the information on the QR code. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
Utilities
- **Mobile:**
This app would only be developed for mobile devices.
- **Story:**
Provides information on how to contact the owner of the item. The owener can choose what information they want to put on QR code.
- **Market:**
People forget wallets, keys and other items all the time at restaurants, movie theaters and other public places. To have some type of information to return these items to the owners, save the owners a lot of money and time. 
- **Habit:**
This app can be used whenever they find a lost item, or whenever they want to change the information on the QR code.
- **Scope:**
This app will be only to return items that have a QR code. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] As a businessman I want to be able to have the opportunity to get my wallet back if i ever lose it with all my contact info that I need. 
- [x] As a mother I would like to have the possibility of being able to have someone return my wallet with all of the valuable info for my children
- [x] As a student I would like to be able to have my wallet returned so that I can retrieve 
my student ID and use it when needed
- [x] As a staff member I would like to have my wallet returned to access the doors that I need to access with the right ID.
- [x] As a Frequent library user I would like to have my wallet returned so that I can have access to library computers and check out books.
- [x] As a bank member I would like to have my wallet returned so that I can access my accounts
- [x] As a facility owner I would like to have my wallet returned so that I can have access to contact info i have on other business cards
- [x] As a citizen I would like to have my wallet back so that i can have my valuable info such as my social security back in my possession
- [x] As a hospital member I would like to have my wallet returned so that i can show identification and proof of insurance to staff members
- [x] As a driver i would like to have my wallet returned so that I can have a form of ID to show when I get pulled over 


### 2. Screen Archetypes

* [Login]
* [Register-User signs up or logs in]
   * Upon Download/Reopening of the application, the user is prompted to log in to manage thier own QR codes.
   * They can also choose scan now to scan an existing QR code.
* [Sign Up screen]
   * Lets people create new account
* [Scan now screen]
   * Lets people scan the QR code found on the item
* [Information Return Screen]
   * Provides information of how to contact the owner of the item.
   * Allows people to open the phone app and call them or the messages app to send them a text
* [Profile Screen]
   * Let people manage their keys and change their information
   * They can also mange all app settings through this screen.
   

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Profile]
* [Scan]

**Flow Navigation** (Screen to Screen)

* [Log In Screen]
   * [Log In]
   * [Create Account]
   * [Scan Now]
* [Sign Up Screen -> Lets user enter their information]
* [Information Return Screen -> Returns users information after QR scan]
* [Scan Now Screen -> Lets users scan qr code even if they dont have an account]
   

## Wireframes
### [BONUS] Digital Wireframes & Mockups
![Wireframe Final-1](https://user-images.githubusercontent.com/59372920/77725228-2a22b180-6fb2-11ea-9b4f-a7429a9ab5c6.png)

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
   | Property      | Type     | Description |
   | ------------- | -------- | ------------ |
   | author        | Pointer to User| image autor |
   | primaryphone         | Number     | Number to call or to message owner of device |
   | message       | String   | Information on how to contact owner |
   | backupPhone | Number   | number if the primary phone number does not work  |
   | QR Codes    | Number   | id  |
### Networking
#### List of network requests by screen
   - Profile Screen
      - (Read/GET) Query all information where userID matches cureent userID
         ```let userID = Auth.auth().currentUser!.uid
                let db = Firestore.firestore()
                let docRef = db.collection("user").document(userID)
                docRef.getDocument() { (document, error) in
                    if let document = document{
                                   
                        if document.exists {
                            self.performSegue(withIdentifier: "goHome", sender: self)
                        }
                        else {
                        //   self.performSegue(withIdentifier: "goHome", sender: self)

                        self.performSegue(withIdentifier: "goSetUp", sender: self)
                                       }
                                   }
                            }
         ```
      - (Create/POST) Create a new user
      ```swift
             let newDocument = db.collection("user").document(userID)
        newDocument.setData(["First Name": firstName, "Last Name": lastName, "Primary Name": primaryName,"Primary Phone":             primaryPhone, "Secondary Name": secondaryName,"Secondary Phone": secondaryPhone, "id":newDocument.documentID,"userID": userID  ])
        ```
      - (Update/PUT) Chec
         ```let docRef = db.collection("user").document(userID)
             docRef.setData(["First Name":firstName,"Last Name": lastName,"Email": email], merge: true)
         ```
      - (Delete) Delete an existing QR Code
         ``` let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("user").document(userID)
        docRef.updateData([
            "QRCode": FieldValue.arrayRemove([code])
         ```




## Milestone 1 GIF

![Wireframe Final-1](https://media.giphy.com/media/Lnnk1lgQrqbsJmgTkw/giphy.gif)

## Milestone 2 GIF

![Wireframe Final-1](https://media.giphy.com/media/Sqr2aAmxdFaYQUBYut/giphy.gif)


## Milestone 3 GIF

![Wireframe Final-1](https://media.giphy.com/media/MZct1CLJ77HqBWhzNZ/giphy.gif)

https://media.giphy.com/media/MZct1CLJ77HqBWhzNZ/giphy.gif


## Milestone 4 GIF

![Wireframe Final-1](https://media.giphy.com/media/W6Xh2ms7d8aalFy1pC/giphy.gif)

## Walktrough GIFS

### Scan Now/Sign In/ Add/Remove Keys
![Scan Now/Sign In/ Add/Remove Keys](https://media.giphy.com/media/W6Xh2ms7d8aalFy1pC/giphy.gif)

### Update Information Page https://media.giphy.com/media/LOEXdRGwvEVOn0M1nw/giphy.gif
![Scan Now/Sign In/ Add/Remove Keys](https://media.giphy.com/media/LOEXdRGwvEVOn0M1nw/200w_d.gif)

### Update Contact Information Page https://media.giphy.com/media/Td4CseYrHG12WMbrBl/giphy.gif
![Update Contact Information Page](https://media.giphy.com/media/Td4CseYrHG12WMbrBl/200w_d.gif)

