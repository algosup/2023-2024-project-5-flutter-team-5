## Conventions

### Files & Folders

#### *Naming*

all folders and files should be named in *UpperCamelCase*.

#### *Organisation*

- Images should be in an ./*Image* subfolder from where they are called.
- Technical, Functional and Management documents should be in their folder in a ./*Documents* folder.
- The code should be in an ./Src folder from the root.
- Folders and Files of the folder ./*Src* need to be in *lowercase_with_underscores* to be sensitive with the language Dart.

### GitHub

#### *Naming*

GitHub branches should be named in *lowerCamelCase*.

#### *Organisation*

- The working version of the project goes into the main branch.
- the main should be updated at least once a week.
- There can't be any direct push to the main.
- There will only be 3 branches, document, code and main.
- Only push code that works and with no errors inside the code

### Coding

When in doubt follow this document : [Coding style](https://dart.dev/effective-dart/style), as this document only highlights the most important parts.

#### *Naming*

Use clear names that describe the purpose of the object. Avoid abbreviations. Everything should be done in English.

- All classes and Enum are in *UpperCamelCase*.
- All functions are in *lowerCamelCase*.
- Constant variables are in *lowerCamelCase*.

#### *Comments*

You can follow this link to have more information about the documentation : [Documentation style](https://dart.dev/effective-dart/documentation).

- Comments should be sentences.
- Don't use block comments for documentation.
- If something it's not easely understable define it.

#### *Formating*

- Format your code using dart format.
- Changing your code to make it more formatter-friendly.
  
   If your code has particularly long identifiers, deeply nested expressions, a mixture of different kinds of operators, etc. the formatted output may still be hard to read. When that happens, reorganize or simplify your code.

- Avoid lines longer than 80 characters.
- Use curly braces for all flow control statement.

