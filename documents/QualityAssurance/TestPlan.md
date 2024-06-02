<!-- prupose :
- make sure the software is working as intended
- make sure it is what we want
- test usability for enduser
- check the security
- make sure deployment is smooth
- analyse bug to find their root causes

Tools :
- Instrumented UI tests 
- Github issue 

https://tech-stack.com/blog/test-plan/
-->


# Test Plan

## Scope

### Components to be tested

The quality assurance will test :
- The functional and technical specification document of the product
- The User interface :
  - account creation
  - login
  - filling and editing profile information :
    - first and last name
    - phone number
    - email
    - address
    - birth date
    - CV
  - reading information 
  - filling and editing soft-skills
  - main page :
    - like, dislike, cancel
    - swipe right or left
  - list of match page
  - chat page
  - setting page :
    - support center
    - light and dark theme
    - login out
    - deleting an account
    - GDPR, License, and User Agreement
- Quality of the code

### Components not to be tested

These component will not be tested :
- Saving information from one session to the next
- Connection to a backend
- backend
- notification
- proper application of filter
- communication between pages

### Third-Party Components

Component used in the project, which can not be influenced by the team outside of updates:
- Flutter
- Android SDK
- cupertino_icons
- hidable
- fluttertoast
- flutter_card_swiper
- flutter_test
- integration_test


# /!\ not complete  

<!-- Add things in there when technical is finished -->

## Quality and acceptance criteria

### User Interface

#### Conformity

The components of the user interface should look like and behave like the mockup provided in the functional specifications.

#### Responsiveness

The application must be responsive under the following aspect ratio and size :
- **9:19.5 - 6.5"** (Samsung Galaxy A25)
- **9:21 - 6.1"** (Sony Xperia 10 V *&* Apple iPhone 13)
- **10:16 - 11.0"** (Samsung Galaxy Tab S9)
- **4:3 - 16"** (Standard desktop screen)
- **16:9 - 17"** (Widescreen desktop screen)

The texts and images must remain readable without strain by someone with 10/10 vision 50cm from the eyes for Phones and tablet. 100cm for computer screens.

#### Speed

The application should take at most 0.5s to change pages on our *benchmark android* and *benchmark iPhone*. The desktop version should take at most 0.2s to switch pages on our *benchmark PC*.

#### Visual Design

the Application should matches the color theme used in the mockup While keeping enough contrast to remain easily readable.
The font, color choice, icon and styling should be consistent throughout the app.

On the desktop version interactive element should have an hover to make it clear these are interactive.
On the phone version a click should highlight the element even if the new page isn't loaded yet.

#### Navigation

The navigation bar should be visible and working on all pages after an account is loged-in

on an android phone, the back arrow should bring the user back to the last page he was on.

#### Form

Forms should have clear labels, placeholders and a validation message.
Required fields should be appropriately indicated, and users should not be able to submit a form without completing these fields.
Error messages should be displayed and clearly indicate which field is invalid and why.

### Compatibility 

A component should run on Android 11 or newer, on Windows 10 or newer and iOS 15 or newer. There should only be one version of a component for all the OS to simplify maintainability.

### Code Quality

- Name should be explicit and use full word. Naming convention as defined in the Technical Specification should be respected.
- The Code should be commented so that functions which use isn't obvious are commented.
- All interactive element and should have a key to simplify integration test
- 

## Resources

### Test team role and reasonability



### Testing tools

#### Automated testing

We will use both the ``integration_test`` and ``flutter_test`` test package from flutter to automatize testing. Test for new component are to be added as the component get developed. This should not be unit testing.

The packages are meant to partially automatize integration testing. The test program use ``find.byKey()`` to check if every component is present as expected, then use ``tester.tap()`` on those component to make sure the component behave as expected. If a new element or page was expected to appear, then the program continue to test the new elements, until the entire application has been tested.

Unit testing will be done with ``flutter_test`` package 

### Environments

The user interface and compatibility of the phone application will be tested in Android Studio using the latest SDK for android 14 with the v34 API.

Test for the Windows application responsiveness will be done on a computer equivalent to the *benchmark PC* with an up to date version of Windows 11.

To test the speed and readability of the application in real life condition we will use the following devices :

***benchmark Android :*** 2019 Samsung Galaxy A50
- CPU : Exynos 9610 
- RAM : 4Gb
- GPU : Mali-G72 MP3
- screen : 1080x2340~60Hz
- OS : Android 11

***benchmark iPhone :*** 2021 Apple Iphone 13 Pro
- CPU : Apple A15 Bionic
- RAM : 6Gb
- GPU : Apple GPU
- screen : 11170x2532~120Hz
- OS : iOS 17.5.1
  
***benchmark PC :*** 2020 Lenovo ThinkBook 14-IIL - 20SL.
- CPU : Intel Core i7-1065G7
- RAM : 16Gb DDR4
- GPU : Intel Iris Plus Graphics G7
- screen : 1920x1080~60Hz
- OS : Windows 11

## Defect tracking

## Test documentation

## Risk assessment

## Process description