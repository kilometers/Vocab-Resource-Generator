ECHO OFF
:identry
SET /P id=What's the grade-level? (e.g. 5M, 6NFN): 
IF "%id%" == "6M" GOTO valid
IF "%id%" == "6I" GOTO valid
IF "%id%" == "6FN" GOTO valid
IF "%id%" == "6NFN" GOTO valid
IF "%id%" == "5M" GOTO valid
IF "%id%" == "5I" GOTO valid
IF "%id%" == "5FN" GOTO valid

ECHO Invalid identifier. Here we go again...
GOTO identry

:valid

:week

SET /P week=What week do you want to generate?:

IF EXIST "%UserProfile%\Vocabulary\%id%\%week%" ECHO Week %week% already exists. Please manually delete the folder. & GOTO :week

IF NOT EXIST %UserProfile%\Vocabulary mkdir %UserProfile%\Vocabulary
IF NOT EXIST %UserProfile%\Vocabulary\%id% mkdir %UserProfile%\Vocabulary\%id%
IF NOT EXIST %UserProfile%\Vocabulary\%id%\%week% mkdir %UserProfile%\Vocabulary\%id%\%week%

XCOPY /q %~dp0. %UserProfile%\Vocabulary\%id%\%week%
REN %UserProfile%\Vocabulary\%id%\%week%\vocab-quiz-answers.doc "Vocab Quiz Answers %id% W%week%.doc"
REN %UserProfile%\Vocabulary\%id%\%week%\vocab-intro-handout.doc "Vocab Intro Handout %id% W%week%.doc"
REN %UserProfile%\Vocabulary\%id%\%week%\vocab-intro.pptm "Vocab Intro %id% W%week%.pptm"
DEL %UserProfile%\Vocabulary\%id%\%week%\.gitattributes
DEL %UserProfile%\Vocabulary\%id%\%week%\README.md
DEL %UserProfile%\Vocabulary\%id%\%week%\generate-vocab-templates.bat

ECHO Week %week% generated successfully
GOTO :week

PAUSE