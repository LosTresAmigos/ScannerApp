
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
      - (Read/GET) Query all information where key matches its author
         ```swift
         let query = PFQuery(className:"User")
         query.whereKey("author", equalTo: currentUser)
         query.findObjectsInBackground { (users: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let key = key {
               print("Successfully retrieved \(users.count) users.")
           // TODO: Do something with users...
            }
         }
         ```
      - (Create/POST) Create a new key for a user
      ```swift
            guard let key = ref.child("userId").childByAutoId().key else { return }
                let post = ["qrCode": qrCode]
                let childUpdates = ["/userId/\(key)": post,
                                    "/user-userId/\(qrCode)/\(key)/": post]
                ref.updateChildValues(childUpdates)
        ```
      - (Delete) Delete an existing key
         ```swift
            if 'key' in myDict:
            del myDict['key']
         ```
      - (Update/PUT) Change information for a user
         ```swift
           var user = firebase.auth().currentUser;

            user.updateProfile({
              displayName: "Jane Q. User",
              photoURL: "https://example.com/jane-q-user/profile.jpg"
            }).then(function() {
              // Update successful.
            }).catch(function(error) {
              // An error happened.
            });
         ```
      - (Delete) Delete existing information
         ```swift
            class func delete(with groupIdentifier: String, 
            completion: ((Error?) -> Void)? = nil)
         ```




## Milestone 1 GIF

![Wireframe Final-1](https://media.giphy.com/media/Lnnk1lgQrqbsJmgTkw/giphy.gif)

## Milestone 2 GIF
![Wireframe Final-1](https://media.giphy.com/media/Sqr2aAmxdFaYQUBYut/giphy.gif)


## Milestone 3 GIF
<iframe src="https://giphy.com/embed/MZct1CLJ77HqBWhzNZ" width="238" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/MZct1CLJ77HqBWhzNZ">via GIPHY</a></p>
