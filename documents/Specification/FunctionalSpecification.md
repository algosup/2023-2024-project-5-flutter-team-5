# Adopte un candidat functional specification 

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/algosup/2023-2024-project-5-flutter-team-5) [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

<details>
<summary>Table of Contents</summary>

- [Adopte un candidat functional specification](#adopte-un-candidat-functional-specification)
  - [1. Introduction](#1-introduction)
    - [1.1 Purpose](#11-purpose)
    - [1.2 Goals](#12-goals)
    - [1.3 Stakeholders](#13-stakeholders)
      - [1.3.1 Project Team Members](#131-project-team-members)
      - [1.3.2 Other Stakeholders](#132-other-stakeholders)
    - [1.4 Project Scope](#14-project-scope)
      - [1.4.1 In Scope](#141-in-scope)
      - [1.4.2 Out of Scope](#142-out-of-scope)
    - [1.5 Risks and Assumptions](#15-risks-and-assumptions)
    - [1.6 Deliverables and Milestones](#16-deliverables-and-milestones)
  - [2. Solution](#2-solution)
    - [2.1 Pages](#21-pages)
    - [2.2 Pages](#22-pages)
      - [2.2.1 Home page](#221-home-page)
      - [2.2.2 Profile page](#222-profile-page)
      - [2.2.3 Filter page](#223-filter-page)
      - [2.1.4 Message page](#214-message-page)
      - [2.1.5 Chat page](#215-chat-page)
      - [2.1.6 Setting page](#216-setting-page)
  - [3. Functional Requirements](#3-functional-requirements)
    - [3.1 Personas](#31-personas)
    - [3.2 Use cases](#32-use-cases)
      - [3.2.1 Flow chart](#321-flow-chart)
      - [3.2.2 Use cases table](#322-use-cases-table)
    - [3.3 Mock-up](#33-mock-up)
  - [4 Non-Functional Requirements](#4-non-functional-requirements)
  - [5. System Configuration](#5-system-configuration)
    - [5.1 Application Configuration](#51-application-configuration)
  - [6. Integration Requirements](#6-integration-requirements)
    - [6.1 Development Environment](#61-development-environment)
    - [6.2 Error Reporting](#62-error-reporting)
  - [7. Glossary](#7-glossary)
</details>



## 1. Introduction

### 1.1 Purpose
**Adopte 1 Candidat** is an application designed to help companies recruit candidates for their job openings. Inspired by the dating app Tinder, it allows companies to create job listings and candidates to apply for them. The company can then accept or reject applicants, who have anonymous profiles. Similarly, candidates can accept or reject job offers. If both the company and the candidate accept each other, they can start a conversation. The application is available on Android and Windows platforms.

### 1.2 Goals

- Two type of users: company and candidate
- Candidates have an anonymous profile
- Each user can Like, Pass or Cancel other users
- If their have a match, they can chat together, the company alway send the first message 

- Available on Android and Windows
- Only display job offer in a radius around you
- Candidates share their hard skills and soft skills.
- Companies share their job offer, salary, schedule and perks 


### 1.3 Stakeholders

#### 1.3.1 Project Team Members
| Name | Role | Link |
|------|------|------|
| Rémy Charle     | Project Manager     |  [GitHub](https://github.com/RemyCHARLES)    |
|   Salaheddine Namir   | Program Manager     |  [GitHub](https://github.com/T3rryc)    |
|    Lucas Megnan  | Technical Lead          |  [GitHub](https://github.com/LucasMegnan)    |
|  Michel Riff    | Software Enginner          |   [GitHub](https://github.com/MichelRiff)   |
|  Max Bernard    | Quality Assurance         |   [GitHub](https://github.com/maxbernard3)   |

#### 1.3.2 Other Stakeholders
| Name | Role | Link |
|------|------|------|
|   ALGOSUP    | School     |  [Website](https://www.algosup.com/)    |
|We are evolution| Client	 |  [Website](https://www.we-are-evolution.com/)    |


### 1.4 Project Scope

#### 1.4.1 In Scope

- Use flutter to create the application
- Front End
- Filter by location
- Chat
- Like, pass and cancel buttons
- Anonymization of candidates profiles
- Create account
- Login
- Setting

#### 1.4.2 Out of Scope
- Back End
- Admin panel
- Monetization

### 1.5 Risks and Assumptions

| Risk| Impact| Mitigation|
|------|------|------|
|The team doesn't understand the requirements |High|PRD was already send to the client and it was been validated|
|Poorly structured source code|Low|The team have decided to use the convention of the [official dart website](https://dart.dev/effective-dart/style) to write and structured the source code |
| The team is not familiar with the technology used | Medium | The team have decided to use the [flutter documentation](https://flutter.dev/docs) to learn the technology |
|The product isn't deliver in time|High|Every part of the project has deadline|
|OS compatibility|Low| Flutter is natively cross-platform |
|Communication between team members|High|Team has a private slack server to communicate and share information remotely|

### 1.6 Deliverables and Milestones
|Date And Time | Deliverable |
|-------------|-------------|
|      05/24/2024 5PM       |    Functional Specification         |
|	  06/07/2024 5PM       |    Technical Specification             |
|	  06/07/2024 5PM       |    Test Plan             |
|	  06/14/2024 5PM       |    Code            |
|	  06/14/2024 5PM       |    User Manual            |
|	  06/21/2024 9AM       |    Oral Presentation            |


## 2. Solution 

### 2.1 Overview

To meet the client's request, we have decided to create a Flutter application. The main feature is the "Swipe" profile function, where users can like, pass, or cancel another user. If two users like each other, they can start a chat. Company users can send the first message after a match. Additionally, users can access other profiles, the search page, notification log, message page, settings page, and filter page. Users can also edit their profiles, set their location, log out, and delete their accounts.

### 2.2 Pages

#### 2.2.1 Home page
The page where the user can access the "Swipe" profile feature
The candidate has access to the company profile and company has access to the candidate profile. The user has 4 possibilities:
- Like
- Pass
- Cancel
- Look the profile of the user displayed 

The user can tap "Like" button or swipe this finger of the left and the user can tap "Pass" button or swipe this finger of the right. The user can press "Cancel" button to undo the like. The profile of the other user is displayed in the middle of the screen, to access to the profile, the user need to tap the window on the middle of the screen to access to the profile details.


#### 2.2.2 Profile page
The page with the user's profile and the option to modify it.

there is a list of soft skills the candidate can rate himself on with stars. from 1 to 5 stars.

The list of **softskill** is as follow:

    1. Communication Skills
        - Verbal Communication
        - Written Communication
        - Listening Skills
        - Presentation Skills

    2. Teamwork and Collaboration
        - Cooperation
        - Conflict Resolution
        - Relationship Building
        - Networking

    3. Problem-Solving Skills
        - Critical Thinking
        - Analytical Skills
        - Creativity
        - Decision Making

    4. Adaptability and Flexibility
        - Open-Mindedness
        - Learning Agility
        - Stress Management
        - Time Management

    5. Leadership and Management
        - Delegation
        - Motivating Others
        - Strategic Thinking
        - Project Management

    6. Work Ethic
        - Responsibility
        - Dependability
        - Initiative
        - Attention to Detail

    7. Interpersonal Skills
        - Empathy
        - Emotional Intelligence
        - Negotiation
        - Diplomacy

    8. Customer Service Orientation
        - Patience
        - Active Listening
        - Conflict Resolution
        - Relationship Management

    9. Creativity and Innovation
        - Idea Generation
        - Open to New Ideas
        - Risk-Taking
        - Problem Solving

    10. Cultural Awareness and Sensitivity
        - Diversity and Inclusion
        - Global Awareness
        - Respect for Others
        - Cross-Cultural Communication

    11. Professionalism
        - Accountability
        - Reliability
        - Punctuality
        - Appearance and Demeanor

    12. Conflict Resolution
        - Mediation
        - Negotiation
        - Active Listening
        - Patience

    13. Time Management
        - Prioritization
        - Planning
        - Goal Setting
        - Scheduling


The candidate can also add other data in this profile as follow.

	1. Hobby 
	2. Ambition
	3. Personality
	4. Experience
	5. Education
	6. Language
	7. Available Area
	8. Available Time


Company at the other hand can has also has a list of **characteristics of the job offer** they are offering is as follow. 

	1. Job Title
	2. Scale of Salary
	3. Schedule
	4. Perks
	5. Type of contract
	6. Type of job offer
	7. Type of company
	8. Diploma required
	9. City
	10. Radius


#### 2.2.3 Filter page
The page contain button to filter the type of job offer, the type of contract, the city and the radius. among other. This page is accessible from every page at the top right corner of the screen (except on the setting page and filter).
According to the type of the user, the filter has this following options:

    1. Candidate filter
	- Type of job offer
	- Type of contract
	- City
	- Radius
	- Diploma required
	- Type of company
	- Scale of salary
	- Schedule
	- Available area
	- Available time
	- Language
	
    2. Company filter
    - Diploma
	- Available area
	- Available time
	- Language
	- Soft skills
	- Hard skills

To select the option, the user needs to tick the box.
For the city, the user needs to tap on the text field and for the radius, a slider is available. 



#### 2.1.4 Message page
The page containing the logs of all the messages sent and received a long with an history of your matches. To access to the message page, the user need to tap on the button on the bottom center of the screen, available at every page.



#### 2.1.5 Chat page
The page where the user can chat with another user after chose match user on the message page.
The user has 2 possibilities to access to the chat page:
- Tap on the matched user on match log (only if the user is a company)
- Tap on the message log 

Each message log has the name of the user and the last message sent. The match log at the other hand has only the name of the user.

In the chat page, the user can tap on the text field, write a message with a keyboard and tap on the send button to send the message. The user can also tap on the back button to go back to the message page. The possiblility to delete or edit a message is available.

#### 2.1.6 Setting page
This page contains the account setting including email, phone numbers, linked accounts, logout and delete option. The page also contain the community rule, the privacy policy, legal mention and support contact. 

## 3. Functional Requirements

<!-- Add a part defining the different pages and their functions before doing the use cases as they are currently referring to pages that are not defined-->
<!-- Define what should go in the user profile-->
<!-- Define what should be in the filters-->


### 3.1 Personas

![Candidate](Image/CandidatePersona.png)

<!-- CEO persona seem to be a really poor fit for the use case. As he is seemingly looking more for hard than soft skills -->

![CEO](Image/CeoPersona.png)

### 3.2 Use cases

#### 3.2.1 Flow chart

![Flow chart](Image/FlowChart.png)

#### 3.2.2 Use cases table
<!-- A lot of these would be better described with a flow chart-->
<!-- Add indications of what to do in Alternate flow or Exception flow-->
<!-- history page doesn't exist What is it referring to?-->
<!-- Indicate the current pages when pressing button as navigation is hard to follow -->

|Name|Description|Actors|Basic flow|Alternate flow|Exception flow|Pre condition|Post condition|
|----|-----------|------|----------|----------------|--------------|--------------|----------|
|Create account|The user create an account|Candidate, Company|The user clicks on the sign up button, fill the form and click on the submit button|The user click on the sign in button|The user click on the submit button without finishing the form|None|The user is redirected to the home page|
|Login|The user login|Candidate, Company|The user clicks on sign in button, enter their email address or user name and password|The user click on sign up button|None|Already have account|The user is redirected to the home page|
|Like|The user like an other user|Candidate, Company|The user clicks on the like button|The user click on the pass button|The user click on the cancel button|None|The user is redirected to the next profile|
|Pass|The user pass an other user|Candidate, Company|The user clicks on the pass button|The user click on the like button|None|None|The user is redirected to the next profile|
|Cancel|The user undo like|Candidate, Company|The user clicks on the cancel button|None|None|Has already liked a profile|The user stay on the home page|
|First message|Company send the first message after a match |Company|Company user clicks on chat|None|None|Have already a match|The user is redirected to the chat room|
|Chat|The user chat with another user|Candidate, Company|The user clicks on the matched user on match log or on the message log |Click on message log or match log|None|Company has send the first message|The user is redirected to the chat page|
|Search|The user search another user|Candidate, Company|The user clicks on the search button, fill the form and click on validate|The user click on the go back button|None|None|The user is redirected to the search page|
|Logout|The user logout|Candidate, Company|The user clicks on the logout button|None|None|The user has already login in and go to the setting page|The user is redirected to the login page|
|Setting|The user access to setting page|Candidate, Company|The user clicks on the setting button|None|None|None|User is redirected to the setting page|
|Filter|The user access to the filter page|Candidate, Company|The user clicks on filter button|None|None|None|user is redirected to Filter page|
|Edit profile|The user edit their profile|Candidate, Company|The user clicks on the edit profile button|None|None|None|The user is redirected to the edit profile page|
|Set location|The user set his location|Candidate, Company|the user click on location and set one|None|The user can don't fill the option|The user is on filter page|Set a location|
|Match log|The user access all matches |Candidate, Company|None|None|None|The user has already match and go to message page|The user has access to the match log|
|Delete account|The user delete his account|Candidate, Company|The user click on delete account button|None|None|The user is on setting page|The user is redirected to the login page|
|Notification|The user see the notification|Candidate, Company|The user receive a notification|None|None|None|The user is redirected to the notification log|
|Home|The user access the home page|Candidate, Company|The user click on the home button and access to the "Swipe" profile feature|None|None|None|The user is redirected to the home page|	
|Profile access|The user access to the profile of other user|Candidate, Company|The user click on the profile button on home page|None|None|None|The user is redirected to the profile user page|


### 3.3 Mock-up

<!-- Add names to the pages so that reader can understand which pages is which in the above use cases section-->
<!-- mockup sometime conflict with information given in use case. which is correct? eg. Location seem to be a filter in the mockup but a profile setting in the use cases-->
These mock correspond to this following pages:

- **Filter page**
<img src="Image/FilterLightMode.png" width="200" height="444">
<img src="Image/FilterDarkMode.png" width="200" height="444">

- **Message page**
<img src="Image/MessageLightMode.png" width="200" height="444">
<img src="Image/MessageDarkMode.png" width="200" height="444">

- **Profile page**
<img src="Image/ProfileLightMode.png" width="200" height="444">
<img src="Image/ProfileDarkMode.png" width="200" height="444">

- **Home page**
<img src="Image/SwipeLightMode.png" width="200" height="444">
<img src="Image/SwipeDarkMode.png" width="200" height="444">

- **Setting page**
<img src="Image/SettingLightMode.png" width="200" height="444">
<img src="Image/SettingDarkMode.png" width="200" height="444">


## 4 Non-Functional Requirements

<!-- Be more specific eg. any android phone from the last 5 years and windows 10-->


- The application has French and English language
- The application has light and dark mode
- The application is adapted to all screen sizes
- Application work on Windows and Android





## 5. System Configuration

### 5.1 Application Configuration

- The application is available on Android and Windows
- The login is required to access to the application
- To create an account, the user must fill the form contain the mail address, the user name, the password, and can start to edit his profile(not mandatory at this point)
- The user can access to the setting page to edit his profile, logout and delete his account



## 6. Integration Requirements

### 6.1 Development Environment

- Flutter 2.10.0
- Dart 2.16.0
- Android Studio 2021.1.1
- Windows 11
- Viual Studio Code 1.64.2
- MacOs 12.3



### 6.2 Error Reporting

- The application must display an error message if the user try to login with a wrong mail address or password
- The application must display an error message if the user try to create an account with a mail address already used
- The application must display an error message if the user try to create an account with a user name already used
- The application must display an error message if the user try to create an account with a password too short
- The application display an error message if the user try access to deleted profile



## 7. Glossary

- **Match**: When two users like each other
- **Flutter**: An open-source UI software development kit created by Google
- **Dart**: A programming language optimized for building mobile, desktop, server, and web applications
- **PRD** : Product Requirement Document




