# Test Cases

Test Cases can have four status :

- **"Not to be tested" ⬜** if the cases cover a component or functionality that hasn't been implemented yet or that is expected to break at the moment.
- **"Failed" ❌** meaning the fonctionality(ies) related to that test case are expected to work, but have failed to pass.
- **"Validated" ✅** if the test case has been validated in the last testing round.
- **"Not tested" ❓** on occasion a test case could not be run.

|ID|Category|Description|Expected result|Status|
|---|---|---|---|---|
|001|Splash Screen|User clicks on "Sign Up"|User is sent to "Sign Up" page|✅|
|002|Splash Screen|User clicks on "Login"|User is sent to "Login" page|✅|
|003|Sign Up|User fills email form with an invalid mail|User is warned that mail is invalid when pressing "Next" instead of being redirected|❓|
|004|Sign Up|User fills "password" form with an invalid password|User is warned that password is invalid when pressing "Next" instead of being redirected|❓|
|005|Sign Up|User fills "confirm password" form with a different input than in password|User is warned that password and confirmation password are mismatched when pressing "Next" instead of being redirected|❓|
|006|Sign Up|User fills all form with valid input and click next|User is redirected to "Home" page|❌|
|007|Sign Up|User doesn't fill in all of the input in the form|User is warned that they need to fill all input field when pressing "Next", instead of being redirected|❓|
|008|Login|User fills form with an email that is not linked to an account and any password|User is warned that there is either an invalid email or password when pressing on "Confirm" |❓|
|009|Login|User fills form with an email liked to an account but the wrong password|User is warned that there is either an invalid email or password when pressing on "Confirm" |❓|
|010|Login|User fills form with an email liked to an account and the correct password|User is redirected to "Home" page when pressing on "Confirm" |❓|
|011|Home|User arrive at the home page|User is sent to the correct home page according to whether they are a company or job-seeker profile as filled in the Sign Up form|⬜|
|012|Home|User swipe a card to the right|The card disappear out of the screen to the right|✅|
|013|Home|User swipe a card to the Left|The card disappear out of the screen to the Left|✅|
|014|Home|User click on the red cross|The card disappear out of the screen to the Left|✅|
|015|Home|User click on the blue heart|The card disappear out of the screen to the Right|✅|
|016|Home|User click on the purple arrow|The last liked or disliked card is shown|✅|
|017|Home|User click on filter button|User is redirected to "filter" page|⬜|
|018|Home|User click on alarm button|User is sent to "notification page"|⬜|
|019|Filter|














