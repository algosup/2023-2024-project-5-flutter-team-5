# Adopte Un Candidat Technical Specification

<details>
<summary>

## Table of Contents

</summary>

- [Adopte Un Candidat Technical Specification](#adopte-un-candidat-technical-specification)
  - [Table of Contents](#table-of-contents)
- [Technical](#technical)
- [Audience](#audience)
- [Deliverable](#deliverable)
  - [Details](#details)
  - [Requirements](#requirements)
  - [Nice to have](#nice-to-have)
  - [Priorities](#priorities)
- [Conventions](#conventions)
  - [Files \& Folders](#files--folders)
    - [*Naming*](#naming)
    - [*Organization*](#organization)
  - [GitHub](#github)
    - [*Naming*](#naming-1)
    - [*Organization*](#organization-1)
  - [Coding](#coding)
    - [*Naming*](#naming-2)
    - [*Comments*](#comments)
    - [*Formatting*](#formatting)
- [Technical Architecture](#technical-architecture)
  - [Technology Used](#technology-used)
    - [Tested Platforms](#tested-platforms)
    - [Software](#software)
    - [Real Device Used](#real-device-used)
      - [For Android :](#for-android-)
      - [For IOS :](#for-ios-)
      - [For PC :](#for-pc-)
    - [Front-End](#front-end)

</details>

# Technical

# Audience

**This document is intended for :**

- **Software developer** : project's requirements, objectives, and constraints. It serves as a roadmap that guides the team in building the product, ensuring everyone is on the same page and working towards a common goal.
- **Program manager** : to validate against the functional specification and the client's expectations.
- **Quality assurance** : to assist in preparing the Test Plan and to use it for validating issues.
- **Project manager** : to help identify risks and dependencies.

# Deliverable

The team is tasked with making the front end of a recruitment application to facilitate the recruitment between companies and job-seekers.

## Details

The name of the application is "Adopte Un Candidat", is a "Tinder style" recruitment application that matches companies and job-seekers in a different way. The app will need to be available on phone, tablet and computer.

## Requirements

- Has to be programmed in Flutter.
- Anonymization of candidates.
- Valuing soft skills.
- Priority given to the human aspect.
- Matching between candidates and companies.

## Nice to have

- Release on the play store.
- Add a functionality to put your Monkey TIE's score.
- Add responsive application for computer.
- Some back-end to store data.
- Have the application in French and English.

## Priorities

- Do the Front-end of the app.
- Compatibility between phone, tablet and computer.

# Conventions

## Files & Folders

### *Naming*

all folders and files should be named in *UpperCamelCase*.

### *Organization*

- Images should be in an ./*Image* subfolder from where they are called.
- Technical, Functional and Management documents should be in their folder in a ./*Documents* folder.
- The code should be in an ./Src folder from the root.
- Folders and Files of the folder ./*Src* need to be in *lowercase_with_underscores* to be sensitive with the language Dart.

## GitHub

### *Naming*

GitHub branches should be named in *lowerCamelCase*.

### *Organization*

- The working version of the project goes into the main branch.
- the main should be updated at least once a week.
- There can't be any direct push to the main.
- There will only be 3 branches, document, code and main.
- Only push code that works and with no errors inside the code

## Coding

When in doubt follow this document : [Coding style](https://dart.dev/effective-dart/style), as this document only highlights the most important parts.

### *Naming*

Use clear names that describe the purpose of the object. Avoid abbreviations. Everything should be done in English.

- All classes and Enum are in *UpperCamelCase*.
- All functions are in *lowerCamelCase*.
- Constant variables are in *lowerCamelCase*.

### *Comments*

You can follow this link to have more information about the documentation : [Documentation style](https://dart.dev/effective-dart/documentation).

- Comments should be sentences.
- Don't use block comments for documentation.
- If something it's not easily understandable define it.

### *Formatting*

- Format your code using dart format.
- Changing your code to make it more formatter-friendly.
  
   If your code has particularly long identifiers, deeply nested expressions, a mixture of different kinds of operators, etc. the formatted output may still be hard to read. When that happens, reorganize or simplify your code.

- Avoid lines longer than 80 characters.
- Use curly braces for all flow control statement.

# Technical Architecture

## Technology Used

### Tested Platforms

- Pixel 8 pro **version** : vanilla ice cream.
- Huawei ELE L29 **version** : EMUI 12.0.0.
- Iphone 13 **version** : IOS 17.5.1.

### Software

Here's the technology stack and our IDE:

- Visual Studio Code **version** : 1.89.1.
- Android Studio **Version** : 2023.3.
- Flutter **version** : 3.22.0.
- SDK Android **version** : 34.0.0.
- Dart **version** : 3.4.0.

To download a specific version of Flutter or Dart you can use this website: [Flutter Version Management with FVM](https://blog.flutter.wtf/flutter-version-management/).

### Real Device Used

To run Flutter code you can use phones and PCs, on phone it is possible to do it on Android and IOS.There are however certain requirements to be met, I will show you how to do it on different devices, if you prefer you can emulate a phone whit android studio.

**Firstly you need to setup Flutter.**

- So to do that, run the command "flutter doctor" in your terminal.

If all goes well it should display "No issue found!".

![FlutterDoctor](./Image/FlutterDoctor.png)

If something goes wrong, it will show you what the problem is and how you can fix it.
If the problem persist you can follow this link for documentation: [install flutter documentation](https://flutter-ko.dev/get-started/install).

Now that everything is working, we need to put our phones in developer mode. 

#### For Android :

- **Step 1** : Go to *Settings*.
- **Step 2** : Scroll down to *Build number*.
- **Step 3** : Tap *Build number* seven times. After the first few taps, you should see the steps counting down until you unlock the developer options. You may also have to enter your PIN for verification.
- **Step 4** : Once developer options are activated, you will see a message that reads.
- **Step 5** : Go back to the *Settings* pane and head to *System*, where you will now find *Developer* options as an entry.
- **Step 6** : Tap it and toggle the switch on if it is not already, and from there, you can proceed to make adjustments to your phone.

For more information about that click here : [dev mode for Android](https://www.digitaltrends.com/mobile/how-to-get-developer-options-on-android/).

#### For IOS :

Read this quick article from Apple to switch your Iphone in developer mode : [dev mode for IOS](https://developer.apple.com/documentation/xcode/enabling-developer-mode-on-a-device)

---

Once the profile is approved, you can manually install and immediately open other applications from this developer.

**Your iOS or Android device will now be visible from your IDE, allowing you to run and debug your application by installing the built debug APK.**

While you can debug and test your code on a virtual device, it is often better to do so on a real portable device.

#### For PC :

To debug and run your flutter code on PC is more easier than on phones, your OS is already a device.

![DestopDevice](./Image/DestopDevice.png)

You can directly run and debug your code, you don't need to setup something else.

You can use virtual devices on your PC, whether it is IOS or Android-based. Some of these emulators are already integrated to Android-Studio which you downloaded previously with the "flutter doctor" command on your CMD.

### Front-End

