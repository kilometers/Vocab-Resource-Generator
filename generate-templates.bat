ECHO OFF
:identry
SET /P id=What's the grade-level? (e.g. 5M, 6NFN): 
IF "%id%" == "6M" SET handout=vocab-intro-handout-m& GOTO valid
IF "%id%" == "6I" SET handout=vocab-intro-handout-i& GOTO valid
IF "%id%" == "6FN" SET handout=vocab-intro-handout-fn& GOTO valid
IF "%id%" == "6NFN" SET handout=vocab-intro-handout-fn& GOTO valid
IF "%id%" == "5M" SET handout=vocab-intro-handout-m& GOTO valid
IF "%id%" == "5I" SET handout=vocab-intro-handout-i& GOTO valid
IF "%id%" == "5FN" SET handout=vocab-intro-handout-fn& GOTO valid

ECHO Invalid identifier. Here we go again...
GOTO identry

:valid

:week

SET /P week=What week do you want to generate?: 
SET vocabpath=%UserProfile%\Documents\Vocabulary

IF EXIST "%vocabpath%\%id%\%week%" ECHO Week %week% already exists. Please manually delete the folder. & GOTO :week

IF NOT EXIST %vocabpath% mkdir %vocabpath%
IF NOT EXIST %vocabpath%\%id% mkdir %vocabpath%\%id%
IF NOT EXIST %vocabpath%\%id%\%week% mkdir %vocabpath%\%id%\%week%

XCOPY /q %~dp0.\vocab-quiz-answers.doc "%vocabpath%\%id%\%week%\Vocab Quiz Answers %id% W%week%.doc"*
XCOPY /q %~dp0.\%handout%.doc "%vocabpath%\%id%\%week%\Vocab Intro Handout %id% W%week%.doc"*
XCOPY /q %~dp0.\vocab-intro.pptm "%vocabpath%\%id%\%week%\Vocab Intro %id% W%week%.pptm"*
XCOPY /q %~dp0.\words.xlsx "%vocabpath%\%id%\%week%\words.xlsx"*
MKDIR %vocabpath%\%id%\%week%\images

ECHO Week %week% generated successfully
GOTO :identry

PAUSE