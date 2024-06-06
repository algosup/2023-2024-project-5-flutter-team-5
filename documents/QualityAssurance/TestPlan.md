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

## I. Scope

### A. Components to be tested

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

### B. Components not to be tested

These component will not be tested :
- Saving information from one session to the next
- Connection to a backend
- backend
- notification
- proper application of filter
- communication between pages

### C. Third-Party Components

Component used in the project, which can not be influenced by the team outside of updates:
- Flutter
- Android SDK
- cupertino_icons
- hidable
- fluttertoast
- flutter_card_swiper
- flutter_test
- integration_test


 /!\ not complete  

<!-- Add things in there when technical is finished -->

## II. Quality and acceptance criteria

### A. User Interface

#### 1. Conformity

The components of the user interface should look like and behave like the mockup provided in the functional specifications.

#### 2. Responsiveness

The application must be responsive under the following aspect ratio and size :
- **9:19.5 - 6.5"** (Samsung Galaxy A25)
- **9:21 - 6.1"** (Sony Xperia 10 V *&* Apple iPhone 13)
- **10:16 - 11.0"** (Samsung Galaxy Tab S9)
- **4:3 - 16"** (Standard desktop screen)
- **16:9 - 17"** (Widescreen desktop screen)

The texts and images must remain readable without strain by someone with 10/10 vision 50cm from the eyes for Phones and tablet. 100cm for computer screens.

#### 3. Speed

The application should take at most 0.5s to change pages on our *benchmark android* and *benchmark iPhone*. The desktop version should take at most 0.2s to switch pages on our *benchmark PC*.

#### 4. Visual Design

the Application should matches the color theme used in the mockup While keeping enough contrast to remain easily readable.
The font, color choice, icon and styling should be consistent throughout the app.

On the desktop version interactive element should have an hover to make it clear these are interactive.
On the phone version a click should highlight the element even if the new page isn't loaded yet.

#### 5. Navigation

The navigation bar should be visible and working on all pages after an account is loged-in

on an android phone, the back arrow should bring the user back to the last page he was on.

#### 6. Form

Forms should have clear labels, placeholders and a validation message.
Required fields should be appropriately indicated, and users should not be able to submit a form without completing these fields.
Error messages should be displayed and clearly indicate which field is invalid and why.

### B. Compatibility 

A component should run on Android 11 or newer, on Windows 10 or newer and iOS 15 or newer. There should only be one version of a component for all the OS to simplify maintainability.

### C. Code Quality

- Name should be explicit and use full word. Naming convention as defined in the Technical Specification should be respected.
- The Code should be commented so that functions which use isn't obvious are understandable.
- All interactive element and should have a key to simplify integration test

## III. Resources

### A. Test team role and reasonability

#### 1. Software development team

The Software development team is responsible for unit testing their code and to ensure the code quality. 
Any new or updated feater that is pushed to the git :
- has been manually tested to at least run and be responsive on Android studio and on Window.
- passe the automated unit and integration tests.

#### 2. QA team

The Quality Assurance team is in charge of creating automated integration test. The QA team is also responsible for doing more in depth, manual integration testing.
These manual test should try to use the application as a user would to make sure that everything behave and look as expected from the interface. Performance testing should also be done on the benchmark device during manual test.
Manual testing should only be done once a week or when a pull request is made for a new or major change on a component. 

### B. Testing tools

#### 1. Automated testing

We will use both the ``integration_test`` and ``flutter_test`` test package from flutter to automatize testing. Test for new component are to be added as the component get developed. This should not be unit testing.

The packages are meant to partially automatize integration testing. The test program use ``find.byKey()`` to check if every component is present as expected, then use ``tester.tap()`` on those component to make sure the component behave as expected. If a new element or page was expected to appear, then the program continue to test the new elements, until the entire application has been tested.

Unit testing will be done with ``flutter_test`` package.

#### 2. Android studio

Android studio will be used to perform both automated and manual testing in a controlled environment. We can use it to change the SDK and phone size at will, making testing easier.


### C. Environments

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

## IV. Defect tracking

This is reference for the priority that should be assigned to an issue relative to it's impact on the product.

**Critical:** The tested component isn’t available or doesn’t work, preventing any further testing. 
*eg.* Code that doesn't compile.

**High:** Component doesn't work as expected or the result doesn't meet acceptance criteria in a visible or obvious way.
*eg.* Setting button send user to Home page.

**Medium:** Component doesn't work as expected or the result doesn't meet acceptance criteria but only on edge case or in hard to perceive way.
*eg.* Changing page takes 1.7s instead of 0.5s

**Low:** Component work and meet acceptance criteria but best practice hasn't been followed and/or implementation could be improved.
*eg.* The code isn't commented, and a class is duplicated to do something that could be done with inheritance instead.

## V. Test documentation

The QA team need to provide the following deliverables :

### A. Bug reports database

The gitHub Issues page is used as a database for this project. There should be an issue for all bug or defect found in the main or release version of the database. 
There shouldn't be bug report about unfinished components even if they are on the main as those would unnecessarily clutter the bug database. 

A bug report should follow the template provided when creating a github issue :
- A short description of the problem encountered
- The test case that was being tested
- The priority of the issue
- The environment in which the issue was encountered
- Reproducible step to reach the issue
- A description of the result obtained
- A description of the expected result
- Suggestion for potential solution

### B. Automation Script

The QA team is responsible for delivering automated integration test script. Those test should be made by checking if the key for all the element are here as expected and by then interacting with these key to see if the component behave as expected by watching how the key change in the page.

### C. Test cases

A test case document should be provided so that everyone in the QA team can know what needs to be tested and by who.
This document can be found in [Documents/QualityAssurance/TestCase.md](TestCase.md)

The test case also tells when it is relevant to test a component relative to the advancement of the project.

## VII. Process description

